module Players #inherits from a Player
  class Computer < Player

# valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board) #move returns a valid position for the computer to move
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      end

    end

  end
end
