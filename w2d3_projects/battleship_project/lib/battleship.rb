require_relative "board"
require_relative "player"

class Battleship
attr_reader :player,:board
    def initialize(n)
        @board = Board.new(n)
        @player = Player.new
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        else return false
        end
    end

    def win?
        if @board.num_ships < 1
            puts 'you win'
            return true
        else false

        end
    end

    def game_over?
        if self.lose? || self.win?
            return true
        else false
        end        
    end

    def turn 
       if @board.attack(@player.get_move) == false
            @remaining_misses -= 1
       end
       @board.print
       puts @remaining_misses
    end



end
