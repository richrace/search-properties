class ParseSearchString

  def find_bedrooms(search_string)
    search_string.match(/\d\s(bed)/i).to_s[0].to_i
  end

end