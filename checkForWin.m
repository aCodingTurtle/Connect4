clc
clear

currentBoard = zeros(6,7)
function [gameOver] = checkForWin(chip1a, chip1b, chip1c,chip1d)
  if (chip1a == 1 && chip1b == 1 && chip1c == 1 && chip1d == 1 | chip1a == 2 && chip1b == 2 && chip1c == 2 && chip1d == 2)
      gameOver = true;
      return
  else
      gameOver = false;
      return
  end



%Define varaibles used for each possible way to win
a = 0
b = 0
c = 0
d = 0
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

%Check for win Column-wise
for Row2 = 1:3
        for Column2 = 1:7
            if Column-win = checkForWin(currentBoard(Row2, Column2), currentBoard((Row2+1), Column2), currentBoard((Row2+2), Column2), currentBoard((Row2 + 3), Column2));
                chip1 = 1;
                gameOver = 1;
            elseif Column-win = checkForWin(currentBoard(Row2, Colum), currentBoard((Row2 +1), Column2), currentBoard((Row2 + 2), Column2), currentBoard((Row2 + 3), Column2));
                chip2 = 1;
                gameOver = 1;
            end
            
        end
end

%Check for Win Left Diagonal
for Row3 = 1:3
        for Column3 = 1:4
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
for Row4 = 1:3
        for Column4 = 7:-1:4
            if RightD-win = checkForWin(game(DColum, DRo), game((DRo+1), (DCoulm-1)), game((DRo+2), (DColum-2)), game((DRo+3), (DColum-3)));
                chip1 = 1;
                gameOver = 1;
            elseif RightD-win = checkForWin(game(DColum, DRo), game((DRo+1), (DCoulm-1)), game((DRo+2), (DColum-2)), game((DRo+3), (DColum-3)));
                chip2 = 1;
                gameOver = 1;
            end
        end
end
end
