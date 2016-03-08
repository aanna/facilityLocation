README.md

facility location problem for AMOD system
- there are two implementations of the maximal coverage problem 

FOLDER 2015-07_FMWorkshop
given the demand file:
-BOOKINGS: .txt: space-separated activities file with  customer activities for each line:
format: booking_id | booking_time | customer_id | source_node_x | source_node_y | destination_node_x | destination_node_x | travel_mode
- CUSTOMERS: txt: space- separated customers file with customers listed with their "home" nodes on each line, format:  customer_id | home_node_x | home_node_y

steps:
MATLAB
1. Find X and Y for customers/bookings -> file findXYforCustomers.m
2. Generate a histogram of the demand (discretization of the space) -> generate coordinates of bins and number of trips from each bin (histogramOfTheDemand.m -> out: centers_of_bins.txt and hi_of_bins.txt)
3. Generate matrix a_ij for different radius of service (generate_aij.m)
C++
4. run minFacility_hi.cpp
MATLAB
5. find coordinates for the facilities based on the bins_centers
6. print locations of facilities on the map
