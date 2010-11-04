
global MODE
MODE = 2; % if 1 then webots, 2 for khepera robot


%addpath('~/Downloads/ivr_ass');
%addpath('~/Downloads/local_webots');
%addpath('~/Downloads/robot_commands');
%addpath('~/Downloads/tcp_udp_ip');

s = serial('/dev/ttyS0');
if (MODE == 1)
    open_webot;
else
    open_robot;
end

%fopen(s);

%fprintf(s,'D,3,3'); % goes 18 pixels per second

% if distance is really short, then only moves that distance
%pause(1); 
%fprintf(s,'D,0,0');

[nomaze, maze, mazewR] = prepareEnv(MODE)


%driveRobot(s, 'nomaze.jpg','maze.jpg','obstacles.jpg');
driveRobot(s, nomaze, maze, mazewR);

%fclose(s); 
if (MODE == 1)
    close_webot;
else
    close_robot;
end