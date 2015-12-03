module ApplicationHelper
    def bootstrap_class_for flash_type
      case flash_type
        when :success, "success"
          "alert-success"
        when :error, "error"
          "alert-danger"
        when :alert, "alert"
          "alert-warning"
        else
          "alert-info"
      end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
     fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_form", :f => builder)
    end
    link_to(name, "#", "data-association" => "#{association}" , "data-content" => "#{fields}", :class => "link_to_add_fields" )
  end
end
