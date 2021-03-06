function stoptime = getmarlinstoptime(yr,ydayoffset);
% function time = getmarlinstoptime(year,ydayoffset);
%
% Assumes that there is a global variable head from which to get
% head.time and head.saildata.  The argument year is necessary
% because it is not supplied by the Marlin data stream....
  
global head

if ~isfield(head,'saildata')
  error('You must load a Marlin file into the global head');
end;


if nargin<0
  error('You must specify a year.');
end;
if nargin<1
  ydayoffset=0;
end;

% get the "precise" time from the saildata string.  
hr = str2num(head.saildata([1:2]+36));
mint = str2num(head.saildata([3:4]+36));
sec = str2num(head.saildata([5:10]+36));

% get the yearday  
day=str2num(head.endtime(15:17))-1; % the saildata is off by one day...
stoptime=datenum(yr,1,1,hr,mint,sec)+day;
