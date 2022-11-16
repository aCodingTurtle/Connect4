%% Software Design Project - Connect 4
% Group L

% workspace setup
clc; clear;

%% SimpleGameEngine setup

% Initialize simpleGameEngine object with spritesheet
scene = simpleGameEngine('Connect4Spritesheet.png',16,16,4,[250,250,250]);

% List of sprite sheet contents, can be displayed by using drawScene
sprite_sheet_contents = [[1 2 3 4];[5 6 7 8];[9 10 11 12];[13 14 15 16]];

%% Variables

% A blank board layout
blankBoard = [
    4 5 6 7 8 9 10;
    ones(6, 7)
];

% Current board that will be modified and then redisplayed 
currentBoard = blankBoard;

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

%% Start the game

while true
    drawScene(scene, blankBoard); 
    turn = 0;
    gameOver = false;
    while ~gameOver
        currentPlayer = mod(turn, 2) + 1; % Corresponds to a row in players
        placeChip(currentPlayer);
        gameOver = checkForWin();
        if gameOver
            currentBoard(1,:) = players(currentPlayer,2);
            drawScene(scene, currentBoard);
            if currentPlayer == 2
                title("Xichigan Wins")
            else
                title("OSU Wins")
            end
        end
    end
    waitForPlayAgain = input("Press enter to play again ", 's');
end
