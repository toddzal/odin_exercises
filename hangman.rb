def get_word
    lines = File.readlines "5desk.txt"
    x = lines.select {|val| val.length > 4 && val.length <13}
    return x.sample
  end
  
  def show_game (arr)
      board = "\n[ --> "
      arr.each do |val|
        if val[0] == 0
          board += val[1] + " "
        else
          board += val[2] + " "
        end
      end
      board += " <-- ]"
      puts board
  end

  def show_guess (arr)
    board = "Wrong Guesses --> "
    arr.each do |val|
        board += val + ", "
    end
    board += " <-- ]"
    puts board
end
  
  def check_guess
  end
  
  def handle_guess
    puts "\nType your guess below?\n"
    guess = gets.chomp
    if $myWord.include? guess
      $boardArr.each.with_index do |val, indx|
        if val[2] == guess
            $boardArr[indx][0] = 1
        end
      end
    else
      $guess_arr.push(guess)
    end
    show_game($boardArr)
    show_guess($guess_arr)
    if $guess_arr.length == 6
      $game_over == true
      puts "\n Game over!!! You Lose!"
    end
  end

  def start_game
    while $game_over == false do
      handle_guess
    end
  end
  
  
  
    #Initialize variables
    $boardArr = []
    flag = 0
    $guess_arr = []
    $game_over = false
    #Get Word
    $myWord = get_word.chomp
    #1. Show Rules
        puts "\nHANGMAN: The objective of the game is to guess the randomly selected word. You play by guessing a letter. It will appear in the word if present. If not it will appear in the wrong guesses bin. If you can't guess the word after 10 wrong guesses the game is over and you lose. \n\n"
    #2. Show Game board
      $myWord.each_char{|c| $boardArr.push([flag, "_", c])}
      show_game($boardArr)
    #3. Initialize game
      start_game
    #4. Handle Guesses
    #5. Keep Score/Faulty guesses
    #6. Check for win
    #7. How many guesses
    
  
  
  
