module ApplicationHelper
    
  def sortable(column, title=nil)
    title ||= column
        
    if column == sort_column && sort_direction == "asc"
      direction = "desc"
    else direction = "asc"
    end

    if column == sort_column
      css_class = "hilite"
    else 
      css_class = "original"
    end

    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end   

end
