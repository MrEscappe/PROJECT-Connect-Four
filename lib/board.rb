# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7) { '⚫' } }
  end

  def update_board(row, column, symbol)
    @board[row][column] = symbol
    # render_board(@board)
  end

  def render_board(board)
    board.reverse_each do |e|
      puts '---+----+----+----+----+----+----'
      puts e.join(' | ')
    end
    puts '---+----+----+----+----+----+----'
    puts ' 0   1    2    3    4    5    6'
  end

  def horizontal_check?(piece)
    0.upto(5) do |row|
      0.upto(3) do |column|
        if @board[row][column] == piece && @board[row][column + 1] == piece &&
           @board[row][column + 2] == piece && @board[row][column + 3] == piece
          return true
        end
      end
    end
    false
  end

  def vertical_check?(piece)
    0.upto(4) do |row|
      0.upto(6) do |column|
        if @board[row][column] == piece && @board[row + 1][column] == piece &&
           @board[row + 2][column] == piece && @board[row + 3][column] == piece
          return true
        end
      end
    end
    false
  end
end

# board = Board.new
# board.update_board(2, 5, '🔵')
# board.update_board(3, 5, '🔵')
# board.update_board(4, 5, '🔵')
# board.update_board(5, 5, '🔵')

# p board.vertical_check?('🔵')
