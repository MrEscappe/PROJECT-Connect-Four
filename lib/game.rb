# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class ConnectFour
  def initialize
    @players = Players.new
    @board = Board.new
    @turn = 0
    @win = false
  end

  def start
    until @turn == 42
      if @turn.even?
        turn(@players.p1, '🟠')
      else
        turn(@players.p2, '🔵')
      end
    end
  end

  def turn(player, symbol)
    @move = player_input(player, symbol)
    if valid_move?(@move) && @win == false
      @turn += 1
      @board.update_board(@board.available_space_row(@move), @move, symbol)
      check_win?(player)
    else
      puts 'Invalid input!, please choose a number between 1-7.'
    end
  end

  def player_input(player, symbol)
    puts "#{player}(#{symbol}) choose one available space."
    input = gets.chomp.to_i - 1
  end

  def valid_move?(column)
    (0..6).include?(column) && @board.available_space_column?(column)
  end

  def check_win?(player)
    if @board.win?
      @win = true
      end_win(player)
      play_again
    elsif check_draw?
      puts 'Game Over!! Its a DRAW!'
    end
  end

  def check_draw?
    @turn == 42 && @win == false
  end

  def end_win(player)
    puts "Congratulations #{player}, you win the game!"
  end

  def play_again
    puts 'Do you want to play again? (Y/N)'
    input = ''
    until %w[y n].include?(input)
      input = gets.chomp.downcase
      case input
      when 'y'
        system 'clear'
        load 'lib/game.rb'
      when 'n'
        exit
      else
        puts 'Please enter either Y or N.'
      end
    end
  end
end

game = ConnectFour.new
game.start
