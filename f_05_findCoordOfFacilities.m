close all; clear; clc;

% find x,y of chosen facilities

%% Read the facility file

origFile = sprintf('outputs/failities2015-07-02.txt');
facilityFile = dlmread(origFile, ' ', 0, 0);
facilityID = facilityFile(:,1);

%% Read centers of bins

origFile = sprintf('centers_of_bins_cbd-2015-07-02.txt');
tripDataOrig = dlmread(origFile, ' ', 1, 0);

centerID = tripDataOrig(:,1);
centerX = tripDataOrig(:,2);
centerY = tripDataOrig(:,3);

% find facilityID and its coordinates
facilityX = zeros(length(facilityID),1);
facilityY = zeros(length(facilityID),1);
for i = 1:length(facilityID)
    
    facility_iter = find(centerID == facilityID(i));
    facilityX(i) = centerX(facility_iter);
    facilityY(i) = centerY(facility_iter);
    
end

%% save coord to file

fileTOSave = sprintf('outputs/facilityCoordinates_cbd-%dfacilities.txt', length(facilityID));
fileFacilities = fopen(fileTOSave,'w');
for j = 1:length(facilityX)
    
    fprintf(fileFacilities,'%0u %0u %0u\n', j, facilityX(j), facilityY(j));
end
fclose(fileFacilities);
