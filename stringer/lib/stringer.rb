require "stringer/version"

module Stringer
  def self.spacify *strings
    string = ""
    strings.each_with_index do |s,i|
      if i == 0
        string += s
      else
        string += " " + s
      end
    end
    string
  end

  def self.minify(string, max_length)
    result = ""
    string.each_char.with_index(0) do |s,i|
      if i < max_length
        result += s
      end
    end
    result
  end

  def self.replacify string, find, replace
    result = ""
    wordArr = string.split
    wordArr.each do |w|
      if w == find
        result += replace + " "
      else
        result += w + " "
      end
    end  
    result.slice(0, result.length - 1)
  end

  def self.removify string, remove
    result = ""
    wordArr = string.split
    wordArr.each do |w|
      if w != remove
        result += w + " "
      end
    end
    result
  end
end
