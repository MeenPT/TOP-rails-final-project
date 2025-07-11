class DaisyFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, options = {})
    options[:class] ||= "fieldset-legend"
    super(method, options)
  end

  def text_field(method, options = {})
    options[:class] ||= "input w-full"
    super(method, options)
  end

  def password_field(method, options = {})
    options[:class] ||= "input w-full"
    super(method, options)
  end

  def textarea(method, options = {})
    options[:class] ||= "textarea w-full"
    super(method, options)
  end

  def error(method, options = {})
    if object.errors[method]
      options[:class] ||= "label text-error"
      message = object.errors[method].join(", ")
      @template.content_tag(:span, message, options)
    end
  end

  def submit(value = nil, options = {})
    options[:class] ||= "btn btn-primary"
    super(value, options)
  end
end
