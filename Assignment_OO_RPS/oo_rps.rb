class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def to_s
    value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (rock? && other_move.lizard?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (rock? && other_move.spock?)
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other_move)
    (paper? && other_move.rock?) ||
      (paper? && other_move.spock?)
  end

  def <(other_move)
    (paper? && other_move.scissors?) ||
      (paper? && other_move.lizard?)
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other_move)
    (scissors? && other_move.paper?) ||
      (scissors? && other_move.lizard?)
  end

  def <(other_move)
    (scissors? && other_move.rock?) ||
      (scissors? && other_move.spock?)
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other_move)
    (lizard? && other_move.spock?) ||
      (lizard? && other_move.paper?)
  end

  def <(other_move)
    (lizard? && other_move.rock?) ||
      (lizard? && other_move.scissors?)
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def >(other_move)
    (spock? && other_move.scissors?) ||
      (spock? && other_move.rock?)
  end

  def <(other_move)
    (spock? && other_move.paper?) ||
      (spock? && other_move.lizard?)
  end
end

module Scoreable
  def increase_score
    self.score += 1
  end
end

class Player
  include Scoreable

  attr_accessor :move, :name, :score, :moves

  def initialize
    set_name
    @score = 0
    @moves = []
  end

  def set_and_save_move(m)
    case m
    when 'rock'
      self.move = Rock.new
    when 'paper'
      self.move = Paper.new
    when 'scissors'
      self.move = Scissors.new
    when 'lizard'
      self.move = Lizard.new
    when 'spock'
      self.move = Spock.new
    end
    moves << m
  end

  def save_move(mv)
    moves << mv
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case name
    when 'R2D2'
      Move::VALUES[0]
    when 'Hal'
      [Move::VALUES[2], Move::VALUES[2], Move::VALUES[2], Move::VALUES[0]]
    else
      Move::VALUES.sample
    end
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def increment_score
    if human.move > computer.move
      human.increase_score
    elsif human.move < computer.move
      computer.increase_score
    end
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name} score: #{human.score}"
    puts "#{computer.name} score: #{computer.score}"
  end

  def display_past_moves
    puts "#{human.name} played the following moves:"
    human.moves.each { |mv| puts mv }
    puts "\n#{computer.name} played the following moves:"
    computer.moves.each { |mv| puts mv }
  end

  def someone_won?
    human.score == 5 || computer.score == 5
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be 'y' or 'n'."
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def main_game_loop
    loop do
      human.set_and_save_move(human.choose)
      computer.set_and_save_move(computer.choose)
      display_moves
      display_round_winner
      increment_score
      display_score
      break if someone_won?
    end
  end

  def play
    display_welcome_message

    loop do
      main_game_loop
      display_past_moves
      break unless play_again?
      reset_score
    end
    display_goodbye_message
  end
end

RPSGame.new.play
