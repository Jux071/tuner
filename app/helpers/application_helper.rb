module ApplicationHelper

	def parse_attribute(attribute)
    attribute.to_s.capitalize.split('_').join(' ')
  end
	
	def error_for(attribute, errors, &block)
    if errors[attribute].any?
      content_tag :p, nil, class: 'validation-error'  do
        yield("#{parse_attribute(attribute)} #{errors[attribute][0]}") if block_given?
        "#{parse_attribute(attribute)} #{errors[attribute][0]}"
      end
    end
  end

  def display_flash(type)
    if flash[type]
      content_tag :div, flash[type], class: "alert alert-success"
      content_tag :p, flash[type]
    end    
  end

end
