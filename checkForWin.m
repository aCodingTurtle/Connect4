function [gameOver] = checkForWin(currentBoard(chip1, chip2))
  if (chip1 == currentBoard(Row, Column) && chip1 == currentBoard(Row, Column+1) && chip1 == currentBoard(Row, Column+2) && chip1 == currentBoard(Row, Column+3) | chip2 == currentBoard(Row, Column) && chip2 == currentBoard(Row, Column+1) && chip2 == currentBoard(Row, Column+2) && chip2 == currentBoard(Row, Column+3))
      gameOver = true;
      return
  else
      gameOver = false;
      return
  end



%Define varaibles used for each possible way to win
a = 0;
b = 0;
c = 0;
d = 0;
%CheckForWin Checks board for a win (4 in a row) of either player color
%Check for win Row-wise
for Row = 1:6
        for Column = 1:4
            a = checkForWin(currentBoard(Row, Column), currentBoard(Row, (Column+1)), currentBoard(Row, (Column+2)), currentBoard(Row, (Column+3)));
            if a == true
                if currentBoard(Row, Column) == 1
                    fprintf ('Human Player Wins')
                elseif currentBoard(Row, Column) == 2
                    fprintf ('Player 2 Wins')
                end
            end
        end
end
end
