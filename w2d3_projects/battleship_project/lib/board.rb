require "byebug"
class Board
    attr_reader :grid, :size
    def initialize(n)
        @grid = Array.new(n,:N) {Array.new(n,:N)}
        @size = n * n
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos,value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value 
    end

    def num_ships
        counter = 0
        @grid.flatten.each {|cell| counter += 1 if cell == :S}
        counter
    end

    def attack(pos)
        if  self[(pos)] == :S
            self[(pos)] = :H
            puts "you sunk my battleship!"
            return true
       else 
            self[(pos)] = :X
            return false
       end
    end

    def place_random_ships
        while self.num_ships < size / 4
        rnd_row = rand(0...(grid.length))
        rnd_col = rand(0...(grid.length))
        pos = [rnd_row, rnd_col]
            self[(pos)] = :S
        end
    end

    def hidden_ships_grid
        new_grid = @grid.map do |row|
            row.map do |cell| 
                if cell == :S
                    cell = :N 
                else cell = cell    
                end
            end
        end                                
    end

    def self.print_grid(grid)
\
        grid.each do |row|
            puts row.join(" ") 
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end

