class TurnHandler
	class Player
		attr_reader :name, :symbol
		def initialize(name, symbol)
			@name = name
			@symbol = symbol
		end
	end
	attr_reader :current_player
	def initialize(player1, player2)
		@player1 = Player.new(player1, "X")
		@player2 = Player.new(player2, "O")
		@current_player = @player1
	end

	def next_turn
		@current_player == @player1 ? @current_player = @player2 : @current_player = @player1
	end
end