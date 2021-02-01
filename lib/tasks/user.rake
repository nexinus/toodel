namespace :user do
  desc "TODO"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UpdateUserJob.perform_later(user.id)
    end
  end

  desc "Updating a given user..."
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Updating #{user.first_name}..."
    UpdateUserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end
