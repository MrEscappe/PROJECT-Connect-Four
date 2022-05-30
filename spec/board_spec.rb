# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  let(:'🟠') { described_class.new }
  let(:'🔵') { described_class.new }

  describe '#update_board' do
    subject(:board_new) { described_class.new }

    context 'update the first row and first column with 🟠' do
      before do
        board_new.update_board(0, 0, '🟠')
      end

      it 'update cell' do
        board = board_new.instance_variable_get(:@board)
        update = board[0][0]
        expect(update).to eq('🟠')
      end
    end

    context 'update the fifth row and the fith column with 🔵 ' do
      before do
        board_new.update_board(4, 5, '🔵')
      end

      it 'update cell' do
        board = board_new.instance_variable_get(:@board)
        update = board[4][5]
        expect(update).to eq('🔵')
      end
    end
  end

  describe '#horizontal_check' do
    subject(:check) { described_class.new }

    context 'Check if horizontal check return true ' do
      before do
        check.update_board(3, 3, '🟠')
        check.update_board(3, 4, '🟠')
        check.update_board(3, 5, '🟠')
        check.update_board(3, 6, '🟠')
      end

      it 'Check True' do
        board = check.horizontal_check?('🟠')
        expect(board).to eq(true)
      end

      it 'Check false' do
        board = check.horizontal_check?('🔵')
        expect(board).to eq(false)
      end
    end

    describe 'Check random places' do
      subject(:check) { described_class.new }

      context 'Should return false' do
        before do
          check.update_board(0, 0, '🟠')
          check.update_board(1, 1, '🟠')
          check.update_board(5, 2, '🟠')
          check.update_board(2, 3, '🟠')
        end
        it 'is false?' do
          board = check.horizontal_check?('🟠')
          expect(board).to eq(false)
        end
      end
    end
  end

  describe '#vertical_check?' do
    subject(:check) { described_class.new }

    context 'Four colors in a column' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(1, 0, '🟠')
        check.update_board(2, 0, '🟠')
        check.update_board(3, 0, '🟠')
      end
      it 'Should return true' do
        board = check.vertical_check?('🟠')
        expect(board).to eq(true)
      end

      context 'Check 🔵 in a column' do
        it 'Return false' do
          board = check.vertical_check?('🔵')
          expect(board).to eq(false)
        end
      end
    end

    context 'Three colors in a column' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(1, 0, '🔵')
        check.update_board(2, 0, '🟠')
        check.update_board(3, 0, '🔵')
        check.update_board(5, 0, '🟠')
      end
      it 'Return false' do
        board = check.vertical_check?('🟠')
        expect(board).to eq(false)
      end
    end
  end

  describe '#diagonal_check_right?' do
    subject(:check) { described_class.new }

    context 'Four colors in a right diagonal' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(1, 1, '🟠')
        check.update_board(2, 2, '🟠')
        check.update_board(3, 3, '🟠')
      end

      it 'Should return true' do
        board = check.diagonal_check_right?('🟠')
        expect(board).to eq(true)
      end
    end

    context 'Four colors in a right diagonal, and the last one is different ' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(1, 1, '🟠')
        check.update_board(2, 2, '🟠')
        check.update_board(3, 3, '🔵')
      end

      it 'Should return false' do
        board = check.diagonal_check_right?('🟠')
        expect(board).to eq(false)
      end
    end
  end

  describe '#diagonal_check_left?' do
    subject(:check) { described_class.new }

    context 'Four colors in a left diagonal' do
      before do
        check.update_board(1, 6, '🟠')
        check.update_board(2, 5, '🟠')
        check.update_board(3, 4, '🟠')
        check.update_board(4, 3, '🟠')
      end

      it 'Should return true' do
        board = check.diagonal_check_left?('🟠')
        expect(board).to eq(true)
      end
    end

    context 'Four colors in a left diagonal, and the last one is different ' do
      before do
        check.update_board(1, 6, '🟠')
        check.update_board(2, 5, '🟠')
        check.update_board(3, 4, '🟠')
        check.update_board(4, 3, '🔵')
      end

      it 'Should return false' do
        board = check.diagonal_check_left?('🟠')
        expect(board).to eq(false)
      end
    end
  end

  describe '#win?' do
    subject(:check) { described_class.new }

    context 'Check vertical win' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(0, 1, '🟠')
        check.update_board(0, 2, '🟠')
        check.update_board(0, 3, '🟠')
      end
      it 'Returns true' do
        win = check.win?
        expect(win).to be true
      end
    end

    context 'Check vertical win' do
      before do
        check.update_board(0, 0, '🟠')
        check.update_board(0, 1, '🟠')
        check.update_board(0, 2, '🔵')
        check.update_board(0, 3, '🟠')
      end

      it 'Return false' do
        win = check.win?
        expect(win).to be false
      end
    end
  end

  describe '#available_space_column?' do
    subject(:check) { described_class.new }

    before do
      check.update_board(0, 0, '🟠')
      check.update_board(1, 0, '🟠')
      check.update_board(2, 0, '🔵')
      check.update_board(3, 0, '🟠')
      check.update_board(4, 0, '🔵')
      check.update_board(5, 0, '🟠')
    end

    context 'Check if space is available' do
      it 'Returns false' do
        board = check.available_space_column?(0)
        expect(board).to eq(false)
      end
    end

    context 'Check if space is available' do
      it 'Returns true' do
        board = check.available_space_column?(2)
        expect(board).to be true
      end
    end
  end

  describe '#available_space_row' do
    subject(:check) { described_class.new }

    before do
      check.update_board(0, 0, '🟠')
      check.update_board(1, 0, '🟠')
      check.update_board(2, 0, '🔵')
      check.update_board(3, 0, '🟠')
    end

    context 'Check if space is available' do
      it 'Returns 0 if is available' do
        board = check.available_space_row(0)
        expect(board).to eq(4)
      end
    end

    context 'Check if space is available' do
      before do
        check.update_board(0, 3, '🟠')
        check.update_board(1, 3, '🟠')
        check.update_board(2, 3, '🔵')
        check.update_board(3, 3, '🟠')
        check.update_board(4, 3, '🟠')
      end

      it 'Returns 1 if is unavailable' do
        board = check.available_space_row(3)
        expect(board).to eq(5)
      end
    end
  end
end
