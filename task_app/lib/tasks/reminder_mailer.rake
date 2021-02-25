namespace :reminder_mailer do
  desc "TO SEND NOTIFICATION ON DEADLINE BREACH"
  task task_reminder: :environment do
		puts "Process Started at : #{Time.now}"
		# begin
			Task::send_reminder_mail()
		# rescue Exception => ex
		# 	puts "ERROR |--> #{ex.message}"
		# end
		puts "Process ends at #{Time.now}"
	end
end
#rake reminder_mailer:task_reminder 
