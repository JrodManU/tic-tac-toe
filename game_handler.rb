require_relative "board"
require_relative "turn_handler"
class GameHandler
	attr_accessor :board, :turn_handler
	def initialize(size, player1, player2)
		@board = Board.new(size)
		@turn_handler = TurnHandler.new(player1, player2)
		start
	end

	def start
		until @board.winner?
			@board.print_grid
			@board.choose_spot(@turn_handler.current_player)
			@turn_handler.next_turn
			if @board.full
				@board.print_grid
				puts "Nobody won...."
				return false
			end
		end
		@board.print_grid
		@turn_handler.next_turn
		puts "Congratz #{@turn_handler.current_player.name}, you won!"
	end
end
puts "What size would you like the board to be?"
board_size = gets.chomp
puts "Please enter your name player1."
player1_name = gets.chomp
puts "Please enter your name player2."
player2_name = gets.chomp
game = GameHandler.new(board_size.to_i, player1_name, player2_name)