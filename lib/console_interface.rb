# frozen_string_literal: true

require 'colorize'

class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"]
    .sort
    .map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_made}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_allowed}

    END

    if @game.won?
      puts 'Поздравляем, вы выиграли!'
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".colorize(:yellow)
    end
  end

  def figure
    FIGURES[@game.errors_made].colorize(:green)
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter.nil?
          '__'
        else
          letter
        end
      end

    result.join(' ').colorize(:blue)
  end

  def errors_to_show
    @game.errors.join(', ').colorize(:red)
  end

  def get_input
    print 'Введите следующую букву: '
    gets[0].upcase
  end
end
