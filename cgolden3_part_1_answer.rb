module FunWithStrings
  def palindrome?
    string = self.downcase.gsub(/\W/, "")
    string == string.reverse
  end

  def count_words
    words = {}
    self.downcase.gsub(/[!.,-]/, '').split.each {|string|
      words.store(string, words[string].to_i + 1)}
    words
  end

  def anagram_groups
    self.downcase.split.group_by {|string|
      string.chars.sort
    }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
