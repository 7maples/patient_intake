module ApplicationHelper
  def formatted_list(array_as_string)
    array_as_string.split('"').
      select {|e| e.match(/\w+/) }.
      map(&:capitalize).
      join(", ")
  end
end
