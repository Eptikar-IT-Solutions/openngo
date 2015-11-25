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
end
