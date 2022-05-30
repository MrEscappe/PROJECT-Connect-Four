# frozen_string_literal: true

require_relative '../lib/game'

describe ConnectFour do
  describe '#valid_move?' do
    subject(:check) { described_class.new }

    context 'When the player input a valid number' do
      it 'Should return true' do
        valid = check.valid_move?(2)
        expect(valid).to eq(true)
      end
    end

    context 'When the player input an invalid number' do
      it 'Should return false' do
        valid = check.valid_move?(8)
        expect(valid).to eq(false)
      end
    end

    context 'When the player input a valid number but the place is already occupied' do
      subject(:insert_board) { check.instance_variable_get(:@board) }

      before do
        insert_board.board[0][0] = '🟠'
      end

      it 'Should return true' do
        valid = check.valid_move?(0)
        expect(valid).to eq(true)
      end
    end
  end
end
