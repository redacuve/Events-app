module ApplicationHelper
  
  def title(page_title = '')
    base_title = 'Events App'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def bs_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error', 'danger'
      'alert-danger'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

end
