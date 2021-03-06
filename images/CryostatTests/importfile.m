function [S21 temp]=importfile(fileToRead1)
%IMPORTFILE(FILETOREAD1)
%  Imports data from the specified file
%  FILETOREAD1:  file to read

%  Auto-generated by MATLAB on 28-May-2012 10:53:12

DELIMITER = ',';
HEADERLINES = 2;

% Import the file
newData1 = importdata(fileToRead1, DELIMITER, HEADERLINES);

% Create new variables in the base workspace from those fields.
S21=newData1.data;
temp=newData1.textdata{2};


