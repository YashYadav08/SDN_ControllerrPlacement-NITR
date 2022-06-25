function [d1km]=dist_matrix(latlon1,latlon2)
n=length(latlon2);
d1km=zeros(n,1);
for i=1:n

radius=6371;

lat1=latlon1(1)*pi/180; %convert latitude to radians
lat2=(latlon2(i,1))*(pi/180);
lon1=latlon1(2)*pi/180;
lon2=(latlon2(i,2))*(pi/180);
deltaLat=lat2-lat1;
deltaLon=lon2-lon1;
%Haversine distance using the Harvesine formula 
a=sin((deltaLat)/2)^2 + cos(lat1)*cos(lat2) * sin(deltaLon/2)^2;
%c=2*atan2(sqrt(a),sqrt(1-a));
d1km(i,1)=2*radius*asin(min(1,sqrt(a)));  %alternatively use arcsin note:min is to
%protect against rounding errors
%d1km=radius*c; 
end
end