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

end