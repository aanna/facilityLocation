close all; clear; clc;

% Facility location problem

%% read the demand file
% origins of the trips
origFile = sprintf('centers_of_bins_cbd-2015-07-02.txt');
tripDataOrig = dlmread(origFile, ' ', 0, 0);
facilityX = tripDataOrig(:,2);
facilityY = tripDataOrig(:,3);

% facilities -> generate facility at each bin

% for each facility find a set of facilities within S
% S -> max acceptable service distance
S = 1000; % [m]

% distances between all facilities
Dist = pdist2([facilityX(:), facilityY(:)], [facilityX(:), facilityY(:)]);

set_of_facilites = zeros(length(Dist));
for i = 1:length(Dist)

    for j = 1:length(Dist)
        
        if (Dist(i, j) <= S)
            set_of_facilites(i, j) = 1;
            
        end   
    end 
end


%% save to file

fileTOSave = sprintf('outputs/aij_matrix_cbd_S%dm.txt', S);
delimiter = ' ';
dlmwrite(fileTOSave, set_of_facilites, delimiter);
