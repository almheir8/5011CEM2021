%% Script to examine NetCDF data formats and check for non-numeric values (chars only)

clear all
close all

%% Define plain text variable types
DataTypes = {'NC_Byte', 'NC_Char', 'NC_Short', 'NC_Int', 'NC_Float', 'NC_Double'};

%% Test a good file
%% Set file to test
FileName = '../Model/o3_surface_20180701000000.nc'; % define our test file

Contents = ncinfo(FileName); % Store the file content information in a variable.

%function to store datatypes of the file
[datatype] = SetupTestFile(FileName);


%% display data types
DataInFile = DataTypes(datatype)'

%% find character data types
FindText = strcmp('NC_Char', DataInFile);

%% print results

%Function to print the result of the test
PrintResults(FileName,FindText);

%% #####

%% Test File with Errors
%% Set file to test
    FileName = '../6a Testing Text/TestyTest.nc'; % define our test file

    %function to store datatypes of the file
    [datatype] = SetupTestFile(FileName); 
    
    %% display data types
    DataInFile = DataTypes(datatype)'

    %% find character data types
    FindText = strcmp('NC_Char', DataInFile);

    %% print results
   
    %Function to print the result of the test
    PrintResults(FileName,FindText);

