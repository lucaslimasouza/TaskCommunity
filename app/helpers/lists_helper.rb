module ListsHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "list.remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    	render(association.to_s.singularize + "_form", :f => builder)
    end
    link_to_function(name, "list.add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def concat_strings(string1, string2)
	string1 +" "+ string2
  end
end
