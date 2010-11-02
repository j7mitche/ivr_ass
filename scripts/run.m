
%addpath(genpath('~/Downloads/ivr_ass'));
%addpath(genpath('~/Downloads/local_webots'));
%addpath(genpath('~/Downloads/robot_commands'));
%addpath(genpath('~/Downloads/tcp_udp_ip'));

s = serial('/dev/ttyS0');
fopen(s);

fprintf(s,'D,3,3'); % goes 18 pixels per second

% if distance is really short, then only moves that distance
pause(1); 
fprintf(s,'D,0,0');


driveRobot(s, 'nomaze.jpg','maze5.jpg','mazewR5.jpg');

fclose(s); 