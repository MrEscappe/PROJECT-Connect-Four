# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = ['⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫', '⚫']
  end

  def update_board(position, symbol)
    @board[position] = symbol
    render_board(@board)
  end

  def render_board(board)
    puts " #{board[6]} | #{board[7]} | #{board[8]}"
    puts '----+----+----'
    puts " #{board[3]} | #{board[4]} | #{board[5]}"
    puts '----+----+----'
    puts " #{board[0]} | #{board[1]} | #{board[2]}"
  end
end
