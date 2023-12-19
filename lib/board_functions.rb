def display_board(console, board)
    board.each do |row|
        console.puts row.join(" ")
    end
end

