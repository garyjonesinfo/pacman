% function that checks user input name is correct. Check a predefined list
function check = name_check(str,list)
    check = false;
    if sum(strcmpi(str,list))>0,
        check = true;
    end
end