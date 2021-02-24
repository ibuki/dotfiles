#!/usr/bin/env ruby
# frozen_string_literal: true

Pry.config.color = true
Pry.config.editor = 'vim'

Pry.config.prompt = Pry::Prompt.new(
  'custom',
  'my custom prompt',
  [
    proc do |obj, nest_level, _|
      prompt = ''
      prompt << "#{Rails.version}@" if defined?(Rails)
      prompt << RUBY_VERSION.to_s
      "#{prompt} (#{obj}:#{nest_level})> "
    end
  ]
)

## Alias
Pry.config.commands.alias_command 'lM', 'ls -M'
Pry.config.commands.alias_command 'w', 'whereami'
Pry.config.commands.alias_command '.clr', '.clear'

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-awesome_print
if defined? AwesomePrint
  begin
    require 'awesome_print'
    Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
    # Pry.config.print = proc { |output, value| output.puts value.ai } # without paging
  rescue LoadError => e
    puts 'no awesome_print :('
    puts e
  end
end

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-hirb
if defined? Hirb
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry::DEFAULT_PRINT
      Pry.config.print = proc do |output, value, pry|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value, pry)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

# refs: https://github.com/deivid-rodriguez/pry-byebug#matching-byebug-behaviour
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'fin', 'finish'
end
