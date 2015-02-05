board = {1=>' ', 2=>' ', 3=>' ', 4=>' ', 5=>' ', 6=>' ', 7=>' ', 8=>' ', 9=>' '}
user_positions_array = [] 

def create_user_posititions_array(user_move)
  user_positions_array << user_move
end

def player_places_piece(user_move, user_positions_array)
  begin
    puts "Choose a position (from 1 to 9) to place a piece:"
    gets.chomp.to_i
  end while user_positions_array.include?(user_move)
end

def display_user_positions (board, user_positions_array)
    user_positions_array.select do |user_move| 
  if board.keys.include?(user_move) && board[user_move] != "X" && board[user_move] != "O"
    board[user_move] = 'X'
  else player_places_piece(user_move)
    end
  end
end

def computer_places_piece(board)
  empty_keys_on_board = board.keys.select{|space| board[space] == ' '}
  comp_move = empty_keys_on_board.sample
  board[comp_move] = 'O'
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if board[line[0]] == 'X' && board[line[1]] == 'X' && board[line[2]] == 'X'
      return "Player"
    elsif board[line[0]] == 'O' && board[line[1]] == 'O' && board[line[2]] == 'O'
      return "Computer" 
    else
      return nil
    end
  end
end

def announce_winner(winner)
  puts "#{winner} won!"
end

def nine_positions_are_filled?(board)
  board.keys.select{|space| board[space] == ' '} == []
end

def display_board(board)
  system 'clear'
  puts
  puts "       |       |"
  puts "   #{board[1]}   |   #{board[2]}   |   #{board[3]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{board[4]}   |   #{board[5]}   |   #{board[6]}"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "   #{board[7]}   |   #{board[8]}   |   #{board[9]}"
  puts "       |       |"
  puts
end

display_board(board)

begin
  user_move = player_places_piece(user_move)
  create_user_posititions_array(user_move)
  display_user_positions(board, user_positions_array)
  
  comp_move = computer_places_piece(board)

  display_board(board)
 
  winner = check_winner(board)

end until winner || nine_positions_are_filled?(board)
if winner
  announce_winner(winner)
else
  puts "It's a tie."
end


