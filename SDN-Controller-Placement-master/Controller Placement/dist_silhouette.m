function [d1km d2km d3km]=lldistkm(latlon1,latlon2,n)
%n is the number of nodes
%function used for silhouette
for i=1:n
radius=6371;

lat1=latlon1(1)*pi/180; %convert latitude to radians
lat2=latlon2(i)*pi/180;
lon1=latlon1(1)*pi/180;
lon2=latlon2(i+2)*pi/180;
deltaLat=lat2-lat1;
deltaLon=lon2-lon1;

%Haversine distance using the Harvesine formula 
a=sin((deltaLat)/2)^2 + cos(lat1)*cos(lat2) * sin(deltaLon/2)^2;
%c=2*atan2(sqrt(a),sqrt(1-a));
d1km=2*radius*asin(min(1,sqrt(a)));  %alternatively use arcsin note:min is to
%protect against rounding errors
%d1km=radius*c;  

%Euclidean distance using Pythagorean fomula
x=deltaLon*cos((lat1+lat2)/2);
y=deltaLat;
d2km=radius*sqrt(x*x + y*y); %Pythagoran distance using Spherical Earth projected to a plane
%Very fast and produces fairly accurate result for small distances

%distance using the Law of Cosines
d3km =radius*acos(sin(lat1)*sin(lat2)+ cos(lat1)*cos(lat2)*cos(deltaLon));
end
end