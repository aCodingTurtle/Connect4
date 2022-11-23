function [gameOver] = checkForWin(currentBoard)
  if (chip1a == 1 && chip1b == 1 && chip1c == 1 && chip1d == 1)
      gameOver = true;
      return
  else
      gameOver = false;
      return
  end
end
gameOver = 0;
%CheckForWin Checks board for a win (4 in a row) of either player color
%Check for win Row-wise
for Row = 1:6
        for Column = 1:4
            if Row-win = checkForWin(currentBoard(Row, Column), currentBoard(Row, (Column+1)), currentBoard(Row, (Column+2)), currentBoard(Row, (Column+3)));
                chip1 = 1;
                gameOver = 1;
            elseif
                Row-win = checkForWin(currentBoard(Row, Column), currentBoard(Row, (Column+1)), currentBoard(Row, (Column+2)), currentBoard(Row, (Column+3)));
                chip2 = 1;
                gameOver = 1;
            end
            
        end
end
end
