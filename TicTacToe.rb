module TicTacToe
	WINLINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	class Game
		def initialize(player1, player2)
			@players = [player1, player2]
		end
		
		def startGame
			puts Player 1 Name #{@players[0].name}, Marker #{@players[0].marker}
			puts Player 2 Name #{@players[1].name}, Marker #{@players[1].marker}

			@board = Array.new
			for i in 0..8	
				@board[i] = Tile.new(#{i+1})
			end
			
			@playerTurn = rand(2)
			
			puts #{@players[@playerTurn].name} goes first
			print_board
			
			@gameWon = false
			while @gameWon != true
				turn
				
				if @gameWon == false
					if @playerTurn == 0  @playerTurn = 1  @playerTurn = 0
					end
					puts n#{@players[@playerTurn].name}'s turn
				end
			end

			endOfGame

		end
		
		private
		def turn
			validSpot = false
			while validSpot == false
				print Select your position 
				@position = gets
				
				if @board[@position.to_i-1].mark == @players[0].marker  @board[@position.to_i-1].mark == @players[1].marker			
					puts Selected spot is already marked. Try again
				else
					validSpot = true
				end
			end
			
			@board[@position.to_i-1].mark = @players[@playerTurn].marker
			print_board

			WINLINES.each do winLine
				inARow = 0
				
				winLine.each do winSpot
				
					if @board[winSpot-1].mark == @players[@playerTurn].marker
						inARow += 1	
					end
				end

				if inARow == 3
					@gameWon = true
					return
				end
			end
		end


		def print_board
			rightLines = [0,1,3,4,6,7]
			underScores = [2,5]
			
			for spot in 0..8
				print  #{@board[spot].mark} 
				
				if rightLines.include(spot)
					print 
				end
				
				if underScores.include(spot)
					print n---+---+---n
				end
			end

			puts
		end

		def endOfGame
			puts #{@players[@playerTurn].name} has won.
		end

	end


	class Tile
		attr_accessor mark
		def initialize(mark)
			@mark = mark
		end
	end

	class Player
		attr_reader name, marker
		def initialize(name, marker)
			@name = name
			@marker = marker
		end
	end
end

include TicTacToe
player1 = Player.new(Bob, X)
player2 = Player.new(Joe, O)
theGame = Game.new(player1, player2).startGame