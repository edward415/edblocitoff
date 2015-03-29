namespace :todo do
  desc "Delete tasks older than 7 days"
  task delete_tasks: :environment do
    Task.where("expires_at <= ?", Time.now).destroy_all
  end

end
