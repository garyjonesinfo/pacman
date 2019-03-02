function pacman()

% IE Digital project application written in MATLAB
% Author: Gary Jones

% variable initialisations
prompt = '\n******\nPlease enter Pacman command options:\n\nPLACE, X,Y,F\nMOVE\nLEFT\nRIGHT\nREPORT\nEXIT\n\n';
str = '';
fNames = {'NORTH','EAST','SOUTH','WEST'}; % array of directions
fDirection = [1,1,-1,-1]; % array of grid directions
commandNames = {'MOVE','LEFT','RIGHT','REPORT'}; % array of command names
rows = 5; % matrix row max
columns = 5; % matrix column max
% pacman initialisation
x = 0;
y = 0;
f = '';

% loops until EXIT is entered by user
while (~strcmpi(str,'EXIT'))
    str = input(prompt,'s');
    [status, userInput] = input_check(str,fNames,commandNames);     % checks and validates user input
    if status,  % if user input is correct
        if strcmpi(userInput{1},'PLACE')  % if user has entered pacman Placement
            [xStatus,xvalue] = range_check(userInput{2},x,0,rows);  % x value range check
            [yStatus,yvalue] = range_check(userInput{3},y,0,columns); % y value range check
            if xStatus && yStatus % if data is valid then store pacman position
                x = xvalue;
                y = yvalue;
                f = upper(userInput{4});
            else
                disp('Input command out of bounds.'); % is range check failure report
            end
        elseif isempty(f)
            disp('Please first place Pacman'); % if pacman hasn't been placed yet
        else % if user input is not PLACE
            switch upper(userInput{1})
                case 'LEFT'
                    f = direction(fNames,f,-1); % Sets new direction
                case 'RIGHT'
                    f = direction(fNames,f,1); % Sets new direction
                case 'MOVE'
                    [status,x,y] = move(x,y,f,fNames,fDirection,rows,columns); % moves pacman based on position
                    if ~status,
                        disp('Input command out of bounds.'); % check if pacman out of bounds
                    end
                case 'REPORT' % report current position of pacman
                    fprintf('Output: %d,%d,%s\n',x,y,f{1});
            end
        end
    elseif ~status % if input commands are incorrect report
        disp('Input command incorrect. Please try again.');
    elseif strcmpi(str,'EXIT') % exits pacman program
        disp('Exiting Program.');
    end       
    fprintf('\n');
end

end

