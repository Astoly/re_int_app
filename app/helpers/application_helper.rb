module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ReIntApp"      
    end
  end
end
