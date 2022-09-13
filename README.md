# 'Hangman'

Hangman is a console game in the Ruby language
## The principle of the game
The word is hidden. The player must guess it using the letters of the Russian alphabet. The number of errors is limited.

## System requirements:

**installed Ruby interpreter**

## Application launch

Copy files to the folder, go to it in the terminal and enter the following commands:

first, to install the necessary gem

```
$ bundle install
```
to start the game

```
$ bundle exec ruby main.rb
```
Enjoy!

## Possible settings

### how to add new words to the game?
words are stored in a file data/words.txt

just add new words to the file. Each word must be on a new line and written in UPPER CASE

### how to change the number of possible errors?

in file lib/game.rb 

change the value of the constant. Default value = 7

```
  TOTAL_ERRORS_ALLOWED = 7
```