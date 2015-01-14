require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'

require 'sudoku'

describe Soduku do
  before do
    @sudoku = Soduku.new(
      [
        [0, 3, 5, 2, 9, 0, 8, 6, 4], 
        [0, 8, 2, 4, 1, 0, 7, 0, 3], 
        [7, 6, 4, 3, 8, 0, 0, 9, 0], 
        [2, 1, 8, 7, 3, 9, 0, 4, 0], 
        [0, 0, 0, 8, 0, 4, 2, 3, 0], 
        [0, 4, 3, 0, 5, 2, 9, 7, 0], 
        [4, 0, 6, 5, 7, 1, 0, 0, 9], 
        [3, 5, 9, 0, 2, 8, 4, 1, 7], 
        [8, 0, 0, 9, 0, 0, 5, 2, 6]
      ]
    )
  end

  describe '#row_valid?' do
    it 'returns true when there are no duplicates' do
      @sudoku.row_valid?(0).must_equal true
    end

    it 'retuns true when the indexed row contains all digits 1-9 with no repeats' do
      @sudoku.board[0] = (1..9).to_a
      @sudoku.row_valid?(0).must_equal true
    end

    it 'returns false when the indexed row contains duplicates of a number' do
      @sudoku.board[0] = (1..9).to_a
      @sudoku.board[0][4] = 1
      @sudoku.row_valid?(0).must_equal false
    end
  end

  describe '#col_valid?' do
    it 'retuns true when a col contains all digits 1-9 with no repeats' do
      @sudoku.col_valid?(0).must_equal true
    end

    it 'returns false when a col contains duplicates of a number' do
      @sudoku.board[0][0] = 1
      @sudoku.board[1][0] = 1
      @sudoku.col_valid?(0).must_equal false
    end
  end

  describe '#square_valid?' do
    it 'returns true when the upperleft square contains all digits 1-9 with no repeats' do 

    end

    it 'returns true when the upperright square contains all digits 1-9 with no repeats' do 

    end
    
    it 'returns true when the lowerleft square contains all digits 1-9 with no repeats' do 

    end

    it 'returns true when the lowerright square contains all digits 1-9 with no repeats' do 

    end

  end

  describe '#valid?' do
    it 'returns true when row_valid? col_valid? and square_valid are true' do

    end

    it 'returns false when row_valid is false' do

    end

    it 'returns false when col_valid is false' do 

    end

    it 'returns false when square_valid is false' do

    end

  end

  describe '#solve' do
    it 'should return a solved board for the configuration described above' do
      solved = [
        [1, 3, 5, 2, 9, 7, 8, 6, 4],
        [9, 8, 2, 4, 1, 6, 7, 5, 3],
        [7, 6, 4, 3, 8, 5, 1, 9, 2],
        [2, 1, 8, 7, 3, 9, 6, 4, 5],
        [5, 9, 7, 8, 6, 4, 2, 3, 1],
        [6, 4, 3, 1, 5, 2, 9, 7, 8],
        [4, 2, 6, 5, 7, 1, 3, 8, 9],
        [3, 5, 9, 6, 2, 8, 4, 1, 7],
        [8, 7, 1, 9, 4, 3, 5, 2, 6],
      ]
      @sudoku.solve
      @sudoku.board.must_equal solved
    end

    
  end
  
end
