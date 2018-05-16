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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end

    link_to(name, '#', class: 'add_fields btn btn-sm btn-info btn-flat',
            data: { id: id, fields: fields.gsub('\n', '')})
  end
end
