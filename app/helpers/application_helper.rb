module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    {success: 'alert-success',
     error: 'alert-danger',
     alert: 'alert-warning',
     notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def page_title
    @title || controller_name.gsub(/Controller/, "").humanize
  end

  def current_year
    DateTime.current.year
  end
end
