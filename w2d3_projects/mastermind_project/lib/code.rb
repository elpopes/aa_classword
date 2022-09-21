require "byebug"
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

    def self.valid_pegs?(array_of_pegs)
      valid_pegs = "RRGBYrgby"

      unless  
        # array_of_pegs.each do |peg|
        #   if valid_pegs.include?(peg)
        #     true
        #   else false
        #   end
        # end
        false
        
        raise ArgumentError.new "Must choose R, G, B, or Y"
      end
      counter = 0
        array_of_pegs.each do |peg|
          if POSSIBLE_PEGS.has_key?(peg.capitalize)
            counter += 1
          end  
        end
      return counter == 4
    end

  def initialize(array_of_pegs)

    Code.valid_pegs?(array_of_pegs)



  end

end
