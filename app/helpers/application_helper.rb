module ApplicationHelper


  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
  

  # Return a title on a per-page basis.
  
  
  def title
      base_title =" A"
  end
end
