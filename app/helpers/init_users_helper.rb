module InitUsersHelper
  
  def render_errors(object)
    object.errors.each do |key|
      hash = object.errors[key].join(", ")
      flash[:error] = "#{key.capitalize} #{hash}."
    end
  end
end
