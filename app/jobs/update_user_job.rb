# class UpdateUserJob < ApplicationJob
#   queue_as :default

#   def perform(user_id)
#     user = User.find(user_id)
#     puts "Updating user #{user.first_name}..."
#     sleep 2
#     puts "Done! Updated #{user.first_name} details..."
#   end
# end
