class Marker
  attr_reader :secret
  def initialize(secret)
    @secret = parse(secret)
  end
  
  def guess(these)
   @guess = parse(these)
  end
  
  def mark
    @working_secret  = @secret.dup
    @working_guess   = @guess.dup
    
    correct         = number_correct
    matches         = number_matches - correct
    
    mark    = ['p'] * correct
    mark    << ['m'] * matches
    mark.flatten!
    return mark
  end
  
  private
  
  def number_correct(secret = @working_secret, guess = @working_guess)
    correct = 0
    4.times do |i|
      if secret[i-1] == guess[i-1]
        correct += 1
        secret.delete(i-1)
        guess.delete(i-1)
      end
    end
    return correct
  end
  
  def number_matches(secret = @working_secret, guess = @working_guess)
    matches = 0
    guess.each do |guessed_letter|
      if index = secret.index(guessed_letter)
        matches += 1
        secret.delete(index)
      end
    end
    return matches
  end
  
  def parse(input)
    input.to_s.split(//).select { |i| i=~/[a-z]/ }
  end
end
