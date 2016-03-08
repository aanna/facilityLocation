close all; clear; clc;

%% Read the demand
origFile = sprintf('input_vis/cbd_sorted_bookings.txt');
tripDataOrig = dlmread(origFile, ' ', 0, 0);

% booking file format: id, time, originX, originY, destX, destY, mode
origX = tripDataOrig(:,4);
origY = tripDataOrig(:,5);

%% figure
figure()
[values_E, centers] = hist3([origX(:) origY(:)],[50 50]);
imagesc(values_E)
colorbar
%axis equal
axis xy
%% save centers to vectors of x and y
% x,y coordinates of each center of the bin
coord_x = centers{1,1};
coord_y = centers{1,2};

fileCenters = fopen('centers_of_bins_cbd-2015-07-02.txt','w');
len = 1;
for j = 1:length(coord_x)
    
    for k = 1:length(coord_y)
        
        fprintf(fileCenters,'%0u %0u %0u\n', len, coord_x(j), coord_y(k));
        len = len+1;
        
    end
end
fclose(fileCenters);

%% save h_i (number of occurences in each bin)
reshapedV = reshape(values_E, [], 1);

file_hi = fopen('hi_of_bins_cbd-2015-07-02.txt','w');

for j = 1:length(reshapedV)
    
    fprintf(file_hi,'%0u\n', reshapedV(j));
      
end
fclose(file_hi);

%% sum vector h_i
% 
% sum = 0;
% for k = 1:length(reshapedV)
%     sum = sum +reshapedV(k);
% end
% 
