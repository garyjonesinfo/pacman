% function for check input by the user
function [status, userInput] = input_check(str,fNames,commandNames)

if ~isempty(strfind(upper(str),'PLACE')) % if entry is PLACE
    try
       userInput = textscan(str,'%s %d %d %s','delimiter',','); % separate text and coordinates
       status = name_check(userInput{4},fNames); % function to check user input is correct
    catch
       status = false; % if input is incorrect
       userInput = {'',0,0,''}; % set initialised input
    end 
elseif name_check(str,commandNames), % if not PLACE function check that other functions are correct
    userInput = {str,0,0,''}; % format user input values status true
    status = true;
else
    userInput = {'',0,0,''}; % if format is incorrect status false
    status = false;
end

end