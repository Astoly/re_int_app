module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Reading Intelligence App"      
    end
  end
end
