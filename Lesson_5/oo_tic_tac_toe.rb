require 'pry'

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]] + # rows
                  [[1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24], [5, 10, 15, 20, 25]] + # cols
                  [[1, 7, 13, 19, 25], [5, 9, 13, 17, 21]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  |  #{@squares[4]}  |  #{@squares[5]}"
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |"
    puts "  #{@squares[6]}  |  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  |  #{@squares[10]}"
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |"
    puts "  #{@squares[11]}  |  #{@squares[12]}  |  #{@squares[13]}  |  #{@squares[14]}  |  #{@squares[15]}"
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |"
    puts "  #{@squares[16]}  |  #{@squares[17]}  |  #{@squares[18]}  |  #{@squares[19]}  |  #{@squares[20]}"
    puts "     |     |     |     |"
    puts "-----+-----+-----+-----+-----"
    puts "     |     |     |     |"
    puts "  #{@squares[21]}  |  #{@squares[22]}  |  #{@squares[23]}  |  #{@squares[24]}  |  #{@squares[25]}"
    puts "     |     |     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if five_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..25).each { |key| @squares[key] = Square.new }
  end

  def find_square(line, board, marker)
    if board.values_at(*line).select(&:marked?).collect(&:marker).count(marker) == 4
      return board.select { |k, v| line.include?(k) && v.marker == Square::INITIAL_MARKER }.keys.first
    end

    nil
  end

  private

  def five_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 5
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
  attr_accessor :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end
end

class TTTGame
  COMPUTER1_MARKER = "O"
  COMPUTER2_MARKER = "Z"
  CHOOSE = 'choose'
  FIRST_TO_MOVE = [COMPUTER1_MARKER, COMPUTER2_MARKER, 'human', CHOOSE].sample

  attr_reader :board, :human, :computer1, :computer2

  def initialize
    @board = Board.new
    @human = Player.new(human_pick_name, human_pick_marker)
    @computer1 = Player.new(['Hal', 'Herman', 'R2D2'].sample, COMPUTER1_MARKER)
    @computer2 = Player.new(['C3P0', 'Mr. Dingle', 'Sal'].sample, COMPUTER2_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      sub_main_game
      display_match_winner
      binding.pry
      break unless play_again?
      reset_scores
      reset
      display_play_again_message
    end
  end

  def sub_main_game
    loop do
      display_board
      player_move
      display_round_result
      increment_winner_score
      break if !!someone_won_match?
      sleep 3
      reset
    end
  end

  def human_pick_marker
    choice = nil

    loop do
      puts "Please enter the symbol you would like to use as your marker on the board:"
      choice = gets.chomp
      break if choice.size == 1
      puts "Invalid choice. It must be 1 character long."
    end

    choice
  end

  def human_pick_name
    choice = nil

    loop do
      puts "Please enter your name:"
      choice = gets.chomp
      break unless choice == ''
      puts "Please enter a valid name."
    end

    choice
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "Your marker: #{human.marker}. #{computer1.name} marker: #{computer1.marker}. #{computer2.name} marker: #{computer2.marker}."
    puts display_score
    puts ""
    board.draw
    puts ""
  end

  def display_match_winner
    case someone_won_match?
    when @human
      puts "You won the match!"
    when @computer1
      puts "#{computer1.name} won the match!"
    when @computer2
      puts "#{compter2.name} won the match!"
    end
  end

  def increment_winner_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer1.marker
      computer1.score += 1
    when computer2.marker
      computer2.score += 1
    end
  end

  def display_score
    puts "\nSCORE"
    "#{human.name}: #{human.score}\n#{computer1.name}: #{computer1.score}\n#{computer2.name}: #{computer2.score}"
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys, ', ', 'or')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves(brd, player, player_marker)
    square = nil

    Board::WINNING_LINES.each do |line|
      square = brd.find_square(line, brd.squares, player_marker)
      break if square
    end

    if !square
      Board::WINNING_LINES.each do |line|
        square = brd.find_square(line, brd.squares, @human.marker)
        break if square
      end
    end

    if !square
      square = 13 if brd.squares[13].marker == Square::INITIAL_MARKER
    end

    if !square
      square = brd.unmarked_keys.sample
    end

    brd[square] = player.marker
  end

  def display_round_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won the round!"
    when computer1.marker
      puts "#{computer1.name} won the round!"
    when computer2.marker
      puts "#{computer2.name} won the round!"
    else
      puts "It's a tie!"
    end
  end

  def someone_won_match?
    if human.score == 5
      @human
    elsif computer1.score == 5
      @computer1
    elsif computer2.score == 5
      @computer2
    else
      false
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear
    @current_marker = FIRST_TO_MOVE
  end

  def reset_scores
    @human.score = 0
    @computer1.score = 0
    @computer2.score = 0
  end

  def display_play_again_message
    puts "Let's play again!"
    puts
  end

  def human_turn?
    @current_marker == @human.marker || @current_marker == 'human'
  end

  def choose?
    @current_marker == CHOOSE
  end

  def computer1_turn?
    @current_marker == COMPUTER1_MARKER
  end

  def choose_first_move
    choice = nil
    loop do
      puts "Choose who goes first (human or computer):"
      choice = gets.chomp
      break if ['human', 'computer'].include?(choice)
      puts "That's not a valid choice. Please try again."
    end

    choice == 'human' ? @human.marker : [COMPUTER1_MARKER, COMPUTER2_MARKER].sample
  end

  def current_player_moves
    if choose?
      @current_marker = choose_first_move
    elsif human_turn?
      human_moves
      @current_marker = COMPUTER1_MARKER
    elsif computer1_turn?
      computer_moves(@board, computer1, COMPUTER1_MARKER)
      @current_marker = COMPUTER2_MARKER
    else
      computer_moves(@board, computer2, COMPUTER2_MARKER)
      @current_marker = @human.marker
    end
  end
end

game = TTTGame.new
game.play
