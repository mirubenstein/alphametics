class Alphametics

  def self.solve(input)
    characters = input.scan(/\w/).uniq
    (0..9).to_a.permutation(characters.count).to_a.each do |permutation|
      numbers = input.tr(characters.join, permutation.join).scan(/\d+/)
      next if numbers.any? { |n| n[0] == '0' }
      if numbers.pop.to_i == numbers.sum(&:to_i)
        return characters.zip(permutation).sort.to_h
      end
    end
    {}
  end
end

module BookKeeping
  VERSION = 4
end
