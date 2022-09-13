# frozen_string_literal: true

require_relative 'lib/console_interface'
require_relative 'lib/game'

puts 'Вы наверное в первый раз? В целом, ничего страшного!'
puts 'Загадано слово, нужно его угадать за 7 попыток.'

word = File.readlines("#{__dir__}/data/words.txt", encoding: 'UTF-8', chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

until game.over?
  puts console_interface.print_out

  letter = console_interface.get_input

  game.play!(letter)
end

console_interface.print_out
