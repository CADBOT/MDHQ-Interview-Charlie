#!/usr/bin/env ruby
require 'set'

class Sudoku
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def solve
    # find an unused slot
    row, col = find_unused
    # Note assumes input boards are valid
    # If there are no unused spots... solution!
    return true unless row
    # cram a number in that spot
    (1..9).each do |i|
      board[row][col] = i
      # Check if the board is valid with that number
      if valid?(row, col)
        # Attempt to solve that board if it is
        if solve
          return true
        end
        # Otherwise, we will attempt the next number
      end
      board[row][col] = 0
    end
    false
  end

  def find_unused
    abs_index = board.flatten.index(0) 
    return unless abs_index
    row = abs_index / board.length
    col = abs_index % board.length
    [row, col]
  end

  def valid?(row, col)
    return false unless row_valid?(row)
    return false unless col_valid?(col)
    return false unless square_valid?(row, col)
    true
  end

  def row_valid?(row)
    used = board[row].select { |e| e != 0 } 
    used == used.uniq
  end

  def col_valid?(col)
    used = board.transpose[col].select {|e| e != 0 }
    used == used.uniq
  end
  
  def square_valid?(row, col)
    start_row = row - (row % 3)
    start_col = col - (col % 3)
    values = []
    3.times do |i|
      3.times do |j|
        values << board[start_row+i][start_col+j]
      end
    end
    used = values.select {|e| e != 0 }
    used == used.uniq
  end

end

def parse_board(input)
  input.map do |row| 
    row.chomp!.split(',').map(&:to_i)
  end
end

def main
  raw_board = parse_board(ARGF.readlines)
  puts raw_board.inspect
  game = Sudoku.new(raw_board)
  game.solve
  game.board.each { |row| puts row.inspect }
end

if __FILE__ == $0
  main
end
