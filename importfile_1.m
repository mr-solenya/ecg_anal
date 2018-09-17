function importfile1(fileToRead1)
%IMPORTFILE1(FILETOREAD1)
%  Imports data from the specified file
%  FILETOREAD1:  file to read

%  Auto-generated by MATLAB on 18-Sep-2018 00:27:51

% Import the file
newData1 = load('-mat', fileToRead1);

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end
%data1=vars(1,:);
%data2=vars(2,:);
