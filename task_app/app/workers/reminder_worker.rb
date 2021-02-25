class ReminderWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  #Send mail notification via Sidekiq and Redis
  def perform(task_hash)
   	SiteMailer.reminder_notice(task_hash).deliver_now
  	end
end