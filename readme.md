
Entry Level Dev In-Office Assignment - Parking Lot

Information
There is a really old parking lot in Tuas, which is managed by an elderly gentleman Carl Fredricksen who manually redirects vehicles for parking. This was working well, until the new IMAX theatre opened in the neighbourhood. Considering it would be very difficult for Mr Fredricksen to manage this increase in demand all by himself, he has reached out to you, Russell, to design a parking lot management system. Create a console application to help out Mr. Fredricksen with his parking lot troubles.

Parking lot layout:
The parking lot has 3 levels.
Each level has 2 sections, each section has 15 spots.
A single spot can accommodate a Motorcycle, Car or a Bus/Truck.
The type of vehicle a spot can accommodate is predefined.
Level 1 can accommodate only Trucks/Buses.
Level 2 and 3 can accommodate only Cars and Motorcycles.
A parking spot can only accommodate one type of vehicle.
There is only one entry to the parking lot.

________________________________________________________________

Requirements

If there is more than 1 available spot, priority will be given to a spot closest to the entry.
The lot status should be updated when the vehicle occupies or leaves the spot.

Input format
You can have two types of inputs:

Entry:
Input: ENTRY $VEHICLE_TYPE $VEHICLE_NUMBER
  Output: Please proceed to $LEVEL_NUMBER $SPOT_NUMBER

For example,
Input: ENTRY Car TS07EH3768
  Output: Please proceed to Level 2, Spot 5

Exit
Input: EXIT $VEHICLE_NUMBER
Output: $LEVEL_NUMBER $SPOT_NUMBER is now available


### Parking Problem

-

### Assumptions
