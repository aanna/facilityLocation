close all; clear; clc;

%% Read customers
origFile = sprintf('input/ecbd_customers.txt');
tripDataOrig = dlmread(origFile, ' ', 0, 0);

custID = tripDataOrig(:,1);
node_custom = tripDataOrig(:,2);

%% read coordinates
coordinates = sprintf('input/ecbd_nodes.txt');
coord_file = dlmread(coordinates, ' ', 0, 0);

nodeID = coord_file(:,1);
node_x = coord_file(:,2);
node_y = coord_file(:,2);

%% Find coordinates for customers

cust_x = zeros(length(custID), 1);
cust_y = zeros(length(custID), 1);
for i = 1:length(custID)
    cust_iter = find (nodeID == node_custom(i));
    cust_x(i) = node_x (cust_iter);
    cust_y(i) = node_y (cust_iter);
    
end

fileTripsE = fopen('ecbd_customersXY.txt','w');

for j = 1:length(custID) 
    fprintf(fileTripsE,'%0u %0u %0u\n', custID(j), cust_x(j), cust_y(j));
end
fclose(fileTripsE);