module TitlesHelper

  ### These 2 lines of HTML work also:
  ###   "<th></th>".html_safe
  ###   raw("<th></th>")
  ### "<th></th>" by itself causes literal symbols to be displayed
  def table_column_header(logged_in_user)
    if logged_in_user
      render(:inline => "<th></th>")
    end
  end

  def table_title(title_content, void)
    unless void
      "<td> <i>#{title_content}</i> </td>".html_safe
    else
      "<td> <del><i>#{title_content}</i></del> </td>".html_safe
    end
  end

  ### In html I was using:
  ###   <td> <%= link_to "Edit", edit_title_path(title) %> </td>
  ###   <td> <a href =
  ###     "<%= "/titles/" + title.id.to_s + "/delete" %>">Delete</a>
  ###   </td>
  def table_data_link(logged_in_user, title, action)
    if logged_in_user
      if action == "Edit"
"<td> <a href=/titles/#{title.id.to_s}/edit>#{action}</a> </td>".html_safe
      elsif action == "Delete"
"<td> <a href=/titles/#{title.id.to_s}/delete>#{action}</a> </td>".html_safe
      else
      end 
    end
  end

end
