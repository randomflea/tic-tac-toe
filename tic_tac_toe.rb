class BoardSpace
  attr_reader :contents, :played
  def initialize(space_number)
    @played = false
    @contents = " "
    @space_number = space_number
  end

  def set_contents(contents)
    if @played
      return false
    else
      @contents = contents
      @played = true
      return true
    end
  end
end

class Board
  def initialize()
    @turn_number = 0
    @board = []
    for i in (1..9)
      @board.push(BoardSpace.new(i))
    end
  end

  def take_turn(space)
    contents = @turn_number % 2 == 0 ? "x" : "o"
    if @board[space - 1].set_contents(contents) 
      @turn_number += 1
      return true
    else
      return "Space already occupied"
    end
  end

  def check_win()
    if @board[0].played
      if @board[0].contents == @board[1].contents and 
         @board[0].contents == @board[2].contents
        return "#{@board[0].contents} wins!"
      elsif @board[0].contents == @board[3].contents and 
            @board[0].contents == @board[6].contents
        return "#{@board[0].contents} wins!"
      elsif @board[0].contents == @board[4].contents and 
            @board[0].contents == @board[8].contents
        return "#{@board[0].contents} wins!"
      end
    elsif @board[1].contents == @board[4].contents and 
          @board[1].contents == @board[7].contents
      return "#{@board[1].contents} wins!"
    elsif @board[2].played
      if @board[2].contents == @board[4].contents and 
         @board[2].contents == @board[6].contents
        return "#{@board[2].contents} wins!"
      elsif @board[2].contents == @board[5].contents and 
            @board[2].contents == @board[8].contents
        return "#{@board[2].contents} wins!"
      end
    elsif @board[3].contents == @board[4].contents and 
          @board[3].contents == @board[5].contents
      return "#{@board[3].contents} wins!"
    elsif @board[6].contents == @board[7].contents and 
          @board[6].contents == @board[8].contents
      return "#{@board[6].contents} wins!"
    else
      return false
    end
  end
  def display_board()
    puts "#{@board[0].contents}|#{@board[1].contents}|#{@board[2].contents}"
    puts "-----"
    puts "#{@board[3].contents}|#{@board[4].contents}|#{@board[5].contents}"
    puts "-----"
    puts "#{@board[6].contents}|#{@board[7].contents}|#{@board[8].contents}"
  end
end
# class Board
#         if turn_number > 4
      # check_win
      #   check 0,1,2
      #         0,3,6
      #         0,4,8
      #         1,4,7
      #         2,5,6
      #         2,5,8
      #         3,4,5
      #         6,7,8
#     display_board
#         "{@board[0]}|{@board[1]}|{@board[2]}"
#         "------"
#         "{@board[3]}|{@board[4]}|{@board[5]}"
#         "------"
#         "{@board[6]}|{@board[7]}|{@board[8]}"
# end