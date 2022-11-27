function [gameOver] = checkForWin(currentBoard, chip1, chip2)

gameOver = false;

% Horizontal Check
for Row = 2:7
    for Column = 1:4
        if chip1 == currentBoard(Row, Column) && ...
                chip1 == currentBoard(Row, Column+1) && ...
                chip1 == currentBoard(Row, Column+2) && ...
                chip1 == currentBoard(Row, Column+3) || ...
                chip2 == currentBoard(Row, Column) && ...
                chip2 == currentBoard(Row, Column+1) && ...
                chip2 == currentBoard(Row, Column+2) && ...
                chip2 == currentBoard(Row, Column+3) 
            gameOver = true;
            return
        end
    end
end

end