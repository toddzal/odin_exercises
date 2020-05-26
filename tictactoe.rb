
class Game
    
    def initialize
        @game_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @game_grid = "_#{@game_arr[0]}_|_#{@game_arr[1]}_|_#{@game_arr[2]}_\n" +
 "_#{@game_arr[3]}_|_#{@game_arr[4]}_|_#{@game_arr[5]}_\n" +
 " #{@game_arr[6]} | #{@game_arr[7]} | #{@game_arr[8]} "
    end

    def start
        puts @game_grid
        play
    end

    def check_play(num)
         if @game_arr[num] == "X" ||  @game_arr[num] == "O"
            return false
         else
            return true
         end
    end

    protected
    def play
        player = rand > 0.5 ?  "X": "O"
        puts "Player #{player} will go first."
        for i in 1..9 do
            puts "Player #{player}'s turn."
            handle_input(player)
            if find_winner == true
                puts "Player #{player} has won the game!!!!"
                return 
            end
            player == "X"? player = "O": player = "X"
        end
        puts "Stalemate!!! No winner this time."
        
    end
    def find_winner
        #Winning Combos
        combos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

        combos.each do |val|
            if @game_arr[val[0]] == @game_arr[val[1]] && @game_arr[val[0]] == @game_arr[val[2]] 
                return true
            end
        end

    end

    def handle_input(player)
        puts "Enter a number between 1 and 9>>"
            begin
            move = Kernel.gets.match(/\d/)[0]
            rescue StandardError =>e
            puts "You must enter a number between 1 and 9 "
            else
                if move.to_i >9 || move.to_i <1
                    puts "You must enter a number between 1 and 9 "
                    handle_input(player)
                elsif  check_play(move.to_i-1) == false
                    puts "Already Selected"
                    handle_input(player)
                else
                    @game_arr[move.to_i-1] = player
                    @game_grid = "_#{@game_arr[0]}_|_#{@game_arr[1]}_|_#{@game_arr[2]}_\n" +
                    "_#{@game_arr[3]}_|_#{@game_arr[4]}_|_#{@game_arr[5]}_\n" +
                    " #{@game_arr[6]} | #{@game_arr[7]} | #{@game_arr[8]} "
                    puts @game_grid 
                end
            end
    end


end

new_game = Game.new 
new_game.start