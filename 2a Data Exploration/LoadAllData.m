%% This script allows you to open and explore the data in a *.nc file
clear all
close all

FileName = '..\Model\o3_surface_20180701000000.nc';

Contents = ncinfo(FileName);