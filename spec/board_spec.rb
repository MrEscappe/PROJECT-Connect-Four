# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  let(:"🟠") { described_class.new }

  describe '#update_board' do
    subject(:board_new) { Board.new }

    context 'update the first row and first column with some symbol' do
      before do
        board_new.update_board(1, '🟠')
      end

      it 'update cell' do
        board = board_new.instance_variable_get(:@board)
        update = board[1]
        expect(update).to eq('🟠')
      end

    end
  end
end
