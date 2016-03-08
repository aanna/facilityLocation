close all; clear; clc;

%% Read customers locations
origFile = sprintf('input/ecbd_customers.txt');
tripDataOrig = dlmread(origFile, ' ', 0, 0);

origX = tripDataOrig(:,2);
origY = tripDataOrig(:,3);

%% Read bookings
bookingFile = sprintf('input/ecbd_sorted_bookings.txt');
tripDataB = dlmread(bookingFile, ' ', 0, 0);

time = tripDataB(:,2);
destX = tripDataB(:,4);
destY = tripDataB(:,5);

%% choose trips for the morning peak - 5:30 am till 11:30 am
% (19800 sec - 41400 sec)

origX_ = [];
origY_ = [];
destX_ = [];
destY_ = [];
time_ = [];
for i =1 : length(time)
    
    if (time(i) >= 19800 && time(i) < 41400)
        
        origX_ = [origX_ origX(i)];
        origY_ = [origY_ origY(i)];
        destX_ = [destX_ destX(i)];
        destY_ = [destY_ destY(i)];
        time_ = [time_ time(i)];
        
    end
end

%% choose trips for the evening peak - 5:00 pm till 9 am
% (61200 sec - 75600 sec) % 7pm = 68400 s

origX_e = [];
origY_e = [];
destX_e = [];
destY_e = [];
time_e = [];
for i =1 : length(time)
    
    if (time(i) >= 61200 && time(i) < 68400)
        
        origX_e = [origX_e origX(i)];
        origY_e = [origY_e origY(i)];
        destX_e = [destX_e destX(i)];
        destY_e = [destY_e destY(i)];
        time_e = [time_e time(i)];
        
    end
end
%% save to file morning peak
% save customers
fileTrips = fopen('customers-extendedCBD-morningPeak-2015-05-16.txt','w');

for j = 1:length(origX_) 
    fprintf(fileTrips,'%0u %0u %0u\n', j, origX_(j), origY_(j));
end
fclose(fileTrips);


fileBookings = fopen('bookings-extendedCBD-morningPeak2015-05-16.txt','w');

% save bookings 
for j = 1:length(origX_) 
    fprintf(fileBookings,'%0u %0u %0u %0u %0u\n', j, time_(j), j, destX_(j), destY_(j));
end
fclose(fileBookings);

%% save to file evening peak
% save customers
fileTripsE = fopen('customers-extendedCBD-eveningPeak2hrs-2015-05-22.txt','w');

for j = 1:length(origX_e) 
    fprintf(fileTripsE,'%0u %0u %0u\n', j, origX_e(j), origY_e(j));
end
fclose(fileTripsE);


fileBookingsE = fopen('bookings-extendedCBD-eveningPeak2hrs-2015-05-22.txt','w');

% save bookings 
for j = 1:length(origX_e) 
    fprintf(fileBookingsE,'%0u %0u %0u %0u %0u\n', j, time_e(j), j, destX_e(j), destY_e(j));
end
fclose(fileBookingsE);

%% plot histogram
% ndhist(origX, origY);

% figure()
% values = hist3([origX_(:) origY_(:)],[50 50]);
% imagesc(values)
% colorbar
% %axis equal
% axis xy

figure()
[values_E, centers] = hist3([origX_e(:) origY_e(:)],[50 50]);
imagesc(values_E)
colorbar
%axis equal
axis xy
%%

%% save histogram to the text file as h_i
reshapedV = reshape(values_E, [], 1);
