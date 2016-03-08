close all; clear; clc;

% This file is to calculate distance between stations which is used by
% Rebalancing_glpk.cpp to rebalance vehicles between stations

%% Read the faciilty location

origFile = sprintf('outputs/facilityCoordinates/facilityCoordinates_ecbd-15facilities.txt');
tripDataOrig = dlmread(origFile, ' ', 0, 0);
coordX_c1 = tripDataOrig(:,2);
coordY_c1 = tripDataOrig(:,3);

% calculate distance matrix
Dist = pdist2([coordX_c1(:), coordY_c1(:)], [coordX_c1(:), coordY_c1(:)]);

% save to file
fileTOSave = sprintf('outputs/distancesBetween%dFacilities-2015-06-18.txt', length(coordY_c1));
delimiter = ' ';
dlmwrite(fileTOSave, Dist, delimiter);