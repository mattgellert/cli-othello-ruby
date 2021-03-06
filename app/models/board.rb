class Board
  attr_accessor :matrix_string

  @@all = []

  def initialize
    @matrix_string = Matrix.[](
      [7, 7, 7, 7, 7, 7, 7, 7],
      [7, 7, 7, 7, 7, 7, 7, 7],
      [7, 7, 7, 7, 7, 7, 7, 7],
      [7, 7, 7, 1, 0, 7, 7, 7],
      [7, 7, 7, 0, 1, 7, 7, 7],
      [7, 7, 7, 7, 7, 7, 7, 7],
      [7, 7, 7, 7, 7, 7, 7, 7],
      [7, 7, 7, 7, 7, 7, 7, 7]).to_s
    @@all << self
  end

  def self.last
    @@all[-1]
  end

  def change_cell(i, j, chip)
    self.send(:[]=, i, j, chip)
  end

  def self.get_chip_count(board)
    count = {zero: 0, one: 0}
    board.each do |cell|
      cell == 0 ? count[:zero] += 1 : cell == 1 ? count[:one] += 1 : nil
    end
    count
  end

  def to_printable_board(player1, player2)
    i, j = 0, 0
    count = self.class.get_chip_count(eval(self.matrix_string))
    puts "           _   _          _ _     "
    puts "          | | | |        | | |      "
    puts "      ___ | |_| |__   ___| | | ___  "
    puts "     / _ \\\| __| '_ \\ / _ \\ | |/ _ \\ "
    puts "    | (_) | |_| | | |  __/ | | (_) |"
    puts "     \\___/ \\__|_| |_|\\___|_|_|\\___/ "
    puts "\n"
    puts "     #{player1}: #{count[:zero]}      #{player2}: #{count[:one]}"
    puts "\n"
    puts "     a   b   c   d   e   f   g   h "
    puts "    ___ ___ ___ ___ ___ ___ ___ ___"
    board = eval(self.matrix_string)
    board.each do |cell|
      cell = " " if cell == 7
      print " #{j} " if i == 0
      print "| " + cell.to_s + " "
      i += 1
      if i == board.column_size
        print "\n"
        print "    ___ ___ ___ ___ ___ ___ ___ ___"
        puts "\n"
        i = 0
        j += 1
      end
    end
    puts "\n"
  end

end
