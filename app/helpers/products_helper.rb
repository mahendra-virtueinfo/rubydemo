module ProductsHelper
  def add_object_link(name, form, partial, where)
    html = render(:partial => partial, :locals => { :form => form})
    link_to_function name, %{
      var new_object_id = new Date().getTime() ;
      var html = jQuery(#{js html}.replace(/index_to_replace_with_js/g, new_object_id)).hide();
      html.appendTo(jQuery("#{where}")).slideDown('slow');
      html.appendTo(jQuery("#{params[:counter]}")).val('#{params[:counter]}+1');
    }
  end

  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.inspect.to_json
    end
  end
end
