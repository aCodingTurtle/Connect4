%% Software Design Project - Connect 4
% Group L

% workspace setup
clc; clear;

%% SimpleGameEngine setup

% Initialize simpleGameEngine object with spritesheet
scene = simpleGameEngine('SpritesheetOSUvMichigan.png',16,16,4,[250,250,250]);

% List of sprite sheet contents, can be displayed by using drawScene
sprite_sheet_contents = [[1 2 3 4];[5 6 7 8];[9 10 11 12];[13 14 15 16]];

%% Variables

% A blank board layout
blankBoard = [
    4 5 6 7 8 9 10;
    ones(6, 7)
];

% Player variables
% Player 1: chip sprite index, marker sprite index, win count
% Player 2: chip sprite index, marker sprite index, win count
players = [
    2, 11, 0;
    3, 12, 0;
];

% Turn variable
turn = 0;

% GameOver flag
gameOver = false;

%% Play the Game

% Outer game loop - allows the user to play again and reset the board state
while true
    % Reset the board and draw it
    currentBoard = blankBoard;
    drawScene(scene, currentBoard); 

    % Reset the turn counter
    turn = 0;

    % Reset the gameOver flag 
    gameOver = false;
    
    % Start marker in middle of board (displaying the marker later adds 1)
    markerIndex = 3; 
    
    % Array with the top row of numbers
    numRow = blankBoard(1,:);
    
    % Win count (scoreboard) along the bottom
    xlabel(sprintf("OSU: %d | Michigan: %d",players(1,3),players(2,3)))

    % innner game loop - plays a game of connect 4
    while ~gameOver
        title(sprintf("Turn %d",turn+1))
        % Game must end at turn 42 in a draw
        if turn == 42
            title("Draw")
            gameOver = true;
            break
        end
        
        % Check who's turn it is
        currentPlayer = mod(turn, 2) + 1; % Corresponds to a row in players

        % Put the marker onscreen 
        currentBoard(1,:) = numRow;
        currentBoard(1,mod(markerIndex,7)+1) = ...
                players(currentPlayer, 2);
        drawScene(scene, currentBoard);
        
        chipPlaced = false; 
        while ~chipPlaced
            key = getKeyboardInput(scene);
            if strcmp(key,'leftarrow')
                % Move the marker to the left and wrap around at 7 and 0
                markerIndex = markerIndex - 1;
            elseif strcmp(key,'rightarrow')
                % Move the marker to the right and wrap around at 7 and 0
                markerIndex = markerIndex + 1;
            elseif strcmp(key,'space')
                [chipPlaced, currentBoard] = placeChip(currentBoard, ...
                    players(currentPlayer,:));
            end
            currentBoard(1,:) = numRow;
            currentBoard(1,mod(markerIndex,7)+1) = ...
                players(currentPlayer, 2);
            drawScene(scene, currentBoard);
        end

        % Check if the game has been won / board has been filled
        % gameOver = checkForWin(currentBoard,players(1,1),players(2,1));

        if false%gameOver
            % Increment the winning player's win count
            players(currentPlayer,3) = players(currentPlayer,3) + 1;
            xlabel(sprintf("OSU: %d | Michigan: %d", ...
                players(1,3),players(2,3)))
            
            % Fill the top row of the board with the player's marker
            currentBoard(1,:) = players(currentPlayer,2);
            drawScene(scene, currentBoard);
            
            % Display who won
            if currentPlayer == 2
                title("Xichigan Wins")
            else
                title("OSU Wins")
            end
            
            % break out of the inner loop (to not increment turn again)
            break
        end
        % Increment turn
        turn = turn + 1;
    end
    waitForPlayAgain = input("Press enter to play again ", 's');
end
