close all; clear; clc;

% load nodes coordinates
stationsFile = sprintf('outputs/facilityCoordinates/facilityCoordinates_cbd-10facilities.txt');
stData = dlmread(stationsFile, ',', 0, 0);
stX = stData(:,2);
stY = stData(:,3);

% load nodes coordinates
networkFile = sprintf('outputs/cbd_nodes.txt');
networkData = dlmread(networkFile, ',', 0, 0);
nodeID_network = networkData(:,1);
coordX = networkData(:,2);
coordY = networkData(:,3);

originX = zeros(length(stX),1);
originY = zeros(length(stX),1);

dist_ = pdist2([stX(:), stY(:)], [coordX(:), coordY(:)]);

mindistNodeID = zeros(length(stX),1);
for i = 1 : length(stX)
    [tof, id] = min(dist_(i,:));
    mindistNodeID(i) = nodeID_network(id);
end

nodes_unique = unique(mindistNodeID);

% find coord for each node
facilityX = zeros(length(nodes_unique),1);
facilityY = zeros(length(nodes_unique),1);
for i =1 : length(nodes_unique)
      facility_iter = find(nodeID_network == nodes_unique(i));
    facilityX(i) = coordX(facility_iter);
    facilityY(i) = coordY(facility_iter);
end

fileC = fopen('stations_cbd10.txt','w');
for j = 1:length(facilityX)
    fprintf(fileC,'%0u %0f %0f\n', nodes_unique(j), facilityX(j), facilityY(j));
end
fclose(fileC);
