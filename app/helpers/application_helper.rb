module ApplicationHelper
  def flash_class(type)
    case type
    when 'success' then 'alert-success'
    when 'alert'   then 'alert-warning'
    when 'error'   then 'alert-danger'
    when 'notice'  then 'alert-info'
    else type.to_s
    end
  end 
end
