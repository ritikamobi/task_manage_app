module TaskHelper

	def format_date_time(date)
    return date.strftime( "#{date.day.ordinalize} %b, %Y %H:%M:%S") if not date.blank?
  end

  def status_format(status)
  	if status == 1
  		return "Backlog"
  	elsif status == 2
  		return "InProgress"
  	else
  		return "Completed"
  	end
  end

  def date_format(date)
  	return date.strftime("%Y-%m-%d") if not date.blank?
  end
end
