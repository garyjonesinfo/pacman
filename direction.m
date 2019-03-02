% function for changing direction of pacman North,South,East,west
function newFName = direction(fNames,fName,shift)
    index = find(strcmpi(fNames,fName)); % locates index of direction
    index = index + shift; % locates new direction
    if index < 1 % bounds check below min
        index = length(fNames); 
    elseif index > length(fNames) % bounds check above max
        index = 1;
    end
    newFName = fNames(index); % assigns new direction name
end