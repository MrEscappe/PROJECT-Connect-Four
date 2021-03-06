# frozen_string_literal: true

class Board
  attr_accessor :board, :piece

  def initialize
    @board = Array.new(6) { Array.new(7) { '⚫' } }
    render_board(@board)
  end

  def update_board(row, column, piece)
    @piece = piece
    @board[row][column] = piece
    render_board(@board)
  end

  def render_board(board)
    board.reverse_each do |e|
      puts '---+----+----+----+----+----+----'
      puts e.join(' | ')
    end
    puts '---+----+----+----+----+----+----'
    puts ' 1   2    3    4    5    6    7'
  end

  def available_space_column?(column)
    0.upto(5) do |row|
      return true if @board[row][column] == '⚫'
    end
    false
  end

  def available_space_row(column)
    0.upto(5) do |row|
      return row if row == 5 || @board[row][column] == '⚫'
    end
  end

  def win?
    if horizontal_check?(piece) || vertical_check?(piece) || diagonal_check_left?(piece) || diagonal_check_right?(piece)
      true
    else
      false
    end
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
    0.upto(2) do |row|
      0.upto(6) do |column|
        if @board[row][column] == piece && @board[row + 1][column] == piece &&
           @board[row + 2][column] == piece && @board[row + 3][column] == piece
          return true
        end
      end
    end
    false
  end

  def diagonal_check_right?(piece)
    0.upto(2) do |row|
      0.upto(6) do |column|
        if @board[row][column] == piece && @board[row + 1][column + 1] == piece &&
           @board[row + 2][column + 2] == piece &&
           @board[row + 3][column + 3] == piece
          return true
        end
      end
    end
    false
  end

  def diagonal_check_left?(piece)
    0.upto(2) do |row|
      0.upto(6) do |column|
        if @board[row][column] == piece && @board[row + 1][column - 1] == piece &&
           @board[row + 2][column - 2] == piece &&
           @board[row + 3][column - 3] == piece
          return true
        end
      end
    end
    false
  end
end

# board = Board.new
# board.update_board(0, 0, '🔵')
# p board.available_space_column?(0)
# p board.available_space_row(0)
# p board.update_board(board.available_space_row(0), 0, '🟠')
