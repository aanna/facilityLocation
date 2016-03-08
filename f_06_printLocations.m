close all; clear; clc;

% print locations of the stations

%% read max coordinates of the figure
cornerCoord = sprintf('outputs/cornerCoordinates.txt');
cornerCoord_ = dlmread(cornerCoord, ' ', 0, 0);

coordX_corner = cornerCoord_(:,1);
coordY_corner = cornerCoord_(:,2);
[lat_corner, lon_corner] = utm2ll(coordX_corner, coordY_corner, 48);

%% read the locations
origFile = sprintf('outputs/facilityCoordinates/facilityCoordinates_cbd-10facilities.txt');

tripDataOrig = dlmread(origFile, ' ', 0, 0);

coordX_c1 = tripDataOrig(:,2);
coordY_c1 = tripDataOrig(:,3);
[lat_c, lon_c] = utm2ll(coordX_c1, coordY_c1, 48);

figure % create new figure
load seamount
%subplot(4,2,1) % first subplot
scatter(lon_corner, lat_corner, 1, 'k')
xlabel('xPos');
ylabel('yPos');
% title('Minimum Number of Facilities: Service Radius 2000 m')
hold on
scatter(lon_c, lat_c, 1, 'k')
%set(gca, 'Units', 'Points');
plot(lon_corner, lat_corner,'.k','MarkerSize',1)
plot(lon_c, lat_c,'.k','MarkerSize',50)
plot_google_map


%%
% c = [lon_c lat_c]; % center
% r = 2250; % m
% 
% pos = [c-r 2*r 2*r];
% h = rectangle('Position', pos, 'Curvature',1);