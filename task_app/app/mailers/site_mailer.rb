class SiteMailer < ActionMailer::Base
  default from: "TaskWeb.Co <ritikamobi@gmail.com>"
  def reminder_notice(task_hash)
    @task_hash = task_hash
    subject = "Task Completion Reminder"
    mail(to:  @task_hash["user_email"], subject: subject) 
  end
    
end