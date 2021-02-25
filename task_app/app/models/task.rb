class Task < ApplicationRecord
  belongs_to :user
  scope :ordered_by_id, -> { order(id: :desc) }
  validates_presence_of :start_date, :end_date, :title, :status

 def self.send_reminder_mail
    task_list = Task.where.not(status: 3)
    task_list.each do |task|
      task_hash = {}
      task_hash['user_email'] = task.user.email
      task_hash['task_name'] = task.title
      task_hash['task_status'] = status_obj(task.status)
      task_hash['task_deadline'] = format_date_time(task.end_date)
      schedule_date = format_date(task.end_date - 1.day - 1.hour)
      current_date =  format_date(DateTime.now)
      if current_date == schedule_date
        ReminderWorker.perform_async(task_hash)
      end
    end
  end

  def self.status_obj(status)
  	if status == 1
  		return "Backlog"
  	elsif status == 2
  		return "InProgress"
  	else

  	end
  end

  def self.format_date_time(date)
    return date.strftime( "#{date.day.ordinalize} %b, %Y %H:%M:%S") if not date.blank?
  end

   def self.format_date(date)
    return date.strftime( "%Y-%m-%d %H:%M") if not date.blank?
  end
end
