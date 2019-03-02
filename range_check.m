% function for check movement within defined grid (5x5)
function [status,value] = range_check(newValue,oldValue,minRange,maxRange)
        if newValue >= minRange && newValue <= maxRange, % Within range new value set and status true
            value = newValue;
            status = true;
        else % out of range old value is kept status false
            value = oldValue;
            status = false;
        end
end