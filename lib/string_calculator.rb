class StringCalculator
  def add(string_numbers)
    return 0 if string_numbers.strip.empty?

    if string_numbers.start_with?("//")
      delimiter_section, numbers = string_numbers.split("\n", 2)
      custom_delimiter = delimiter_section[2..-1]
    else
      custom_delimiter = nil
      numbers = string_numbers
    end

    delimiters = [",", "\n"]
    if custom_delimiter
      if custom_delimiter.start_with?("[") && custom_delimiter.end_with?("]")
        custom_delimiter = custom_delimiter[1..-2]
      end
      delimiters << custom_delimiter
    end

    delimiters.each do |delim|
      numbers = numbers.gsub(delim, ",")
    end

    numbers = numbers.split(",").map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
    numbers.sum
  end
end


# calc = StringCalculator.new
# puts calc.add("")
# puts calc.add("1,2")
# puts calc.add("1\n2,3")
# puts calc.add("//;\n1;2")

# begin
#   puts calc.add("1,-2,3,-4")
# rescue => e
#   puts e.message
# end
