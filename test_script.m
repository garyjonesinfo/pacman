fNames = {'NORTH','EAST','SOUTH','WEST'}; % array of directions
fDirection = [1,1,-1,-1]; % array of grid directions
commandNames = {'MOVE','LEFT','RIGHT','REPORT'}; % array of command names
minRange = 0;
maxRange = 5;


%% Test 1 run valid input_check function test
str = 'PLACE,1,2,NORTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==true);
assert(strcmp(userInput{1},'PLACE'));
assert(userInput{2}==1);
assert(userInput{3}==2);
assert(strcmp(userInput{4},'NORTH'));

str = 'PLACE,1,5,SOUTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==true);
assert(strcmp(userInput{1},'PLACE'));
assert(userInput{2}==1);
assert(userInput{3}==5);
assert(strcmp(userInput{4},'SOUTH'));

%% Test 2 run invalid input_check function test
str = 'PLAC,1,2,NORTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==false);

str = 'PLACE,tf,2,NORTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==false);

str = 'PLACE,1,2,NRTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==false);

str = 'PLAC,1,546,NORTH';
[status, userInput] = input_check(str,fNames,commandNames);
assert(status==false);

%% Test 3 run valid range_check function test
oldValue = 1;
newValue = 3;
[status,value] = range_check(newValue,oldValue,minRange,maxRange);
assert(status==true);
assert(value==newValue);

%% Test 4 run invalid range_check function test
oldValue = 5;
newValue = 6;
[status,value] = range_check(newValue,oldValue,minRange,maxRange);
assert(status==false);
assert(value==oldValue);

%% Test 5 run valid name_check function test
str = 'NORTH';
check = name_check(str,fNames);
assert(check==true);

%% Test 6 run invalid name_check function test
str = 'TEST';
check = name_check(str,fNames);
assert(check==false);

%% Test 7 run LEFT direction function test
fName = 'NORTH';
shift = -1;
newFName = direction(fNames,fName,shift);
assert(strcmp(newFName,'WEST'));

%% Test 8 run RIGHT direction function test
fName = 'EAST';
shift = 1;
newFName = direction(fNames,fName,shift);
assert(strcmp(newFName,'SOUTH'));

%% Test 9 run valid NORTH move function test
x = 1;
y = 2;
f = {'NORTH'};
[status,x,y] = move(x,y,f,fNames,fDirection,maxRange,maxRange);
assert(status==true);
assert(x==1);
assert(y==3);

%% Test 10 run valid WEST move function test
x = 1;
y = 2;
f = {'WEST'};
[status,x,y] = move(x,y,f,fNames,fDirection,maxRange,maxRange);
assert(status==true);
assert(x==0);
assert(y==2);

%% Test 11 run invalid EAST move function test
x = 5;
y = 5;
f = {'EAST'};
[status,x,y] = move(x,y,f,fNames,fDirection,maxRange,maxRange);
assert(status==false);
assert(x==5);
assert(y==5);