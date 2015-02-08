class Board

	class Square
		attr_accessor :value
		def initialize(value = "/")
			@value = value
		end
	end

	attr_reader :size

	def initialize(size)
		@size = size
		@squares = gen_grid
	end

	def gen_row
		row = []
		@size.times { row << Square.new }
		row
	end

	def gen_grid
		grid = []
		@size.times { grid << gen_row }
		grid
	end

	def print_grid
		@squares.each do |row|
			row.each { |square| print "#{square.value} "}
			puts " "
		end
	end

	def choose_spot(player)
		good_coords = false
		until good_coords
			coords = []
			coords << get_coord("x", player)
			coords << get_coord("y", player)
			if @squares[coords[1] - 1][coords[0] - 1].value == "/"
				good_coords = true
			elsif
				puts "Please try that again."
			end
		end
		@squares[coords[1] - 1][coords[0] - 1].value = player.symbol
	end

	def get_coord(axis, player)
		coord = 0
		until coord >= 1 && coord <= @size
			puts "#{player.name}, please enter an #{axis} coordinate between 1 and #{@size}."
			coord = gets.chomp
			coord = coord.to_i
			puts "Please try that again." if coord < 1 || coord > @size
		end
		coord
	end

	def winner?
		return true if horizontal
		return true if vertical
		return true if diagonal
	end

	def horizontal
		@squares.each do |row|
			line = []
			row.each { |square| line << square.value }
			return true if same(line)
		end
		false
	end
	def vertical
		(0).upto(@size - 1) do |index|
			line = []
			@squares.each { |row| line << row[index].value }
			return true if same(line)
		end
		false
	end
	def diagonal
		line = []
		(0).upto(@size - 1) { |index| line << @squares[index][index].value }
		return true if same(line)
		line = []
		(@size - 1).downto(0) { |index| line << @squares[index][index].value }
		return true if same(line)
		false
	end
	def same(array)
		return true if array.all? { |value| value == "X" } || array.all? { |value| value == "O" }
	end
	def full
		@squares.each do |row|
			return false if row.any? { |square| square.value == "/" }
		end
		true
	end
end



