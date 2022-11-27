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
chip1 = 0;
chip2 = 0;
%CheckForWin Checks board for a win (4 in a row) of either player color
%Check for win Row-wise
for Row = 1:6
        for Column = 1:4
            if Row-win = checkForWin(currentBoard(Row, Column), currentBoard(Row, (Column+1)), currentBoard(Row, (Column+2)), currentBoard(Row, (Column+3)));
                chip1 = 1;
                gameOver = 1;
            elseif Row-win = checkForWin(currentBoard(Row, Column), currentBoard(Row, (Column+1)), currentBoard(Row, (Column+2)), currentBoard(Row, (Column+3)));
                chip2 = 1;
                gameOver = 1;
            end
            
        end
end

%Check for win Column-wise
for Ro = 1:3
        for Colum = 1:7
            if Column-win = checkForWin(currentBoard(Ro, Colum), currentBoard((Ro+1), Colum), currentBoard((Ro+2), Colum), currentBoard((Ro + 3), Colum));
                chip1 = 1;
                gameOver = 1;
            elseif Column-win = checkForWin(currentBoard(Ro, Colum), currentBoard((Ro +1), Colum), currentBoard((Ro + 2), Colum), currentBoard((Ro + 3), Colum));
                chip2 = 1;
                gameOver = 1;
            end
            
        end
end

%Check for Win Left Diagonal
for DRow = 1:3
        for DColumn = 1:4
            if LeftD-win = checkForWin(game(DColumn, DRow), game((DRow+1), (DCoulmn+1)), game((DRow+2), (DColumn+2)), game((DRow+3), (DColumn+3)));
                chip1 = 1;
                gameOver = 1;
            elseif LeftD-win = checkForWin(game(DColumn, DRow), game((DRow+1), (DCoulmn+1)), game((DRow+2), (DColumn+2)), game((DRow+3), (DColumn+3)));
                chip2 = 1;
                gameOver = 1;
            end
        end
end

%Check for Win Right Diagonal
for DRo = 1:3
        for DColum = 7:-1:4
            if RightD-win = checkForWin(game(DColum, DRo), game((DRo+1), (DCoulm-1)), game((DRo+2), (DColum-2)), game((DRo+3), (DColum-3)));
                chip1 = 1;
                gameOver = 1;
            elseif RightD-win = checkForWin(game(DColum, DRo), game((DRo+1), (DCoulm-1)), game((DRo+2), (DColum-2)), game((DRo+3), (DColum-3)));
                chip2 = 1;
                gameOver = 1;
            end
        end
end

