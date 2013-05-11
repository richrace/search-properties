class ParseSearchString

  attr_reader :num_words

  def initialize
    @num_words = {:one => 1,
                  :two => 2,
                  :three => 3,
                  :four => 4,
                  :five => 5,
                  :six => 6,
                  :seven => 7,
                  :eight => 8}
  end

  def find_bedrooms(search_string)
    found_bed_count = 0
    result = search_string.match(/(\d|one|two|three|four|five|six|seven|eight|nine)\s*(bed)/i).to_s
    if result[0].to_i > 0
      found_bed_count = result[0].to_i 
    else
      @num_words.each_key do |key| 
        found_bed_count = @num_words[key] if result.include?(key.to_s)
      end
    end
    found_bed_count
  end

  def find_property_type(search_string)
    search_string.match(/(house|flat)/i).to_s.downcase
  end

  def find_location(search_string)
    location = search_string
    location.gsub!(/(\d|one|two|three|four|five|six|seven|eight|nine)\s*(bedrooms|bedroom|beds|bed)/i,"")
    location.gsub!(/(houses|house|flats|flat)/i,"")
    location.strip!
    location.downcase
  end

  def parse_search_string(search_string)
    bed_count = find_bedrooms(search_string)
    property_type = find_property_type(search_string)
    location = find_location(search_string)
    {:bedroom_count => bed_count, :property_type => property_type, :location => location}
  end

end