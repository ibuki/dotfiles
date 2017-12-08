namespace :foo do

  desc ""
  task :task_name, :arg1, :arg2
  task task_name: :environment do |_, args|

  end
end
