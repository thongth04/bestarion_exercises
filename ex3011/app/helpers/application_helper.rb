module ApplicationHelper

  def flash_class_name(name)
    case name
    when 'notice' then 'success'
    when 'alert'  then 'danger'
    else name
    end
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  
end
