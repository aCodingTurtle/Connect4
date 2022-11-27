function [colAvailable, outBoard] = placeChip(currentBoard, currentPlayerArray)
%PLACECHIP checks if the current column can be placed into and returns an
%updated gameboard
% currentBoard: The current board variable (with sprite numbers)
% currentPlayerArray: Array containing players(currentPlayerNumber, :) 
% so that the sprite chip number and marker number are available

% Create Row and Column variables that will store where the chip will be
% placed
groundRow = 1;
markerCol = 0;

% Iterate over each column to find where the marker is
for col = 1:7
    if currentBoard(1,col) == currentPlayerArray(2)
        markerCol = col;
        % Iterate over each row to find the first open row, starting from
        % the bottom (row 7) and working to the top of the board (row 2)
        for row = 2:7
            if currentBoard(row, col) == 1
                groundRow = row;
            end
        end
    end
end

% Setup the outBoard
outBoard = currentBoard;

if groundRow == 1
    % If the groundRow is 1 (the scoreboard) then we cannot place a chip.
    % That means we return false and do not update the gameboard.
    colAvailable = false;
else
    % If a suitable groundRow was found, then the column is available and
    % we can update the gameboard with the placed chip. 
    colAvailable = true;
    outBoard(groundRow, markerCol) = currentPlayerArray(1);
end

end
