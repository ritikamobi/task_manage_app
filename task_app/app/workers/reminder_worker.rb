class ReminderWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(task_hash)
   	SiteMailer.reminder_notice(task_hash).deliver_now
  	end
end