# frozen_string_literal: true

class Players
  attr_accessor :p1, :p2

  def initialize
    puts 'Whats your name?'
    @p1 = gets.chomp.to_s.capitalize
    puts "Great #{@p1}, your color is '🟠'"
    puts 'Whats your name player 2?'
    @p2 = gets.chomp.to_s.capitalize
    puts "Great #{@p2}, your color is '🔵'"
  end
end
