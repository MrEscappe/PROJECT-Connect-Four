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
end
