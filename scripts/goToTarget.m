function lastPos = goToTarget(robot, target, maze, obstacles, corners, lastPos)


%robot_point = findBigSpots(obstacles, maze, corners, 1);
robot_point = input('Current point:');
a = lastPos - robot_point; %vector between last postion and current

b = target - robot_point; %vector between target and current

angle = 180 - acosd( dot(a,b)/ (sqrt(sum(a.^2))*sqrt(sum(b.^2))));

c = [lastPos(1), lastPos(2),1;robot_point(1),robot_point(2),1; ...
     target(1), target(2), 1]
 
rotate(robot, angle, det(c) );
 
lastPos = robot_point;

fprintf(robot,'D,3,3'); % goes 18 pixels per second

% if distance is really short, then only moves that distance
%pause(min(1, sqrt(sum(b.^2))/18 )); 
pause(max(0, sqrt(sum(b.^2))/18 )); 
fprintf(robot,'D,0,0');

end