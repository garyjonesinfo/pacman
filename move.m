% function for move pacman across the grid pattern
function [status,x,y] = move(x,y,f,fNames,fDirection,rows,columns)
    status = true;
    index = find(strcmpi(fNames,f{1})); % identifies index for for direction application 1 or -1
    switch upper(f{1}) % reads the direction
        case {'NORTH','SOUTH'} % for north and south direction
            yNew = y + fDirection(index); % new grid position y
            [status,y] = range_check(yNew,y,0,columns); % range check           
        case {'EAST','WEST'} % for east and west direction
            xNew = x + fDirection(index); % new grid position x
            [status,x] = range_check(xNew,x,0,rows); % range check                    
    end

end