module ApplicationHelper
  def vue_hidden_tag(attribute, nested_object_name, parent_object_name)
    nested_attributes = "#{nested_object_name.pluralize}_attributes"
    content_tag(:input, nil,
      type: 'hidden',
      'v-model' => "#{nested_object_name}.#{attribute}",
      'v-bind:name' => "'#{parent_object_name}[#{nested_attributes}][' + index + '][#{attribute}]'",
      'v-bind:id' => "'#{parent_object_name}_#{nested_attributes}_' + index + '_#{attribute}'")
  end

  def vue_label(attribute, nested_object_name, parent_object_name)
    nested_attributes = "#{nested_object_name.pluralize}_attributes"
    content_tag(:label,
      class: 'sr-only',
      'v-bind:for' => "'#{parent_object_name}_#{nested_attributes}_' + index + '_#{attribute}'") do
        if block_given?
          yield
        else
          attribute.to_s.humanize.titlecase
        end
      end
  end

  def vue_text_field(attribute, nested_object_name, parent_object_name, placeholder: nil, class: nil)
    nested_attributes = "#{nested_object_name.pluralize}_attributes"
    attribute_name = "#{attribute.to_s.split('_').join('][')}"
    attribute_js_path = attribute.to_s.split('_').join('.')
    content_tag(:input, nil,
      type: 'text', class: 'form-control', placeholder: placeholder,
      'v-model' => "#{nested_object_name}.#{attribute_js_path}",
      'v-bind:name' => "'#{parent_object_name}[#{nested_attributes}][' + index + '][#{attribute_name}]'",
      'v-bind:id' => "'#{parent_object_name}_#{nested_attributes}_' + index + '_#{attribute}'")
  end

end
