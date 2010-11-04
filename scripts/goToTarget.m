function lastPos = goToTarget(robot, target, maze, obstacles, corners, lastPos, obstacles_vector)

EPSILON = 5;
DISTANCE_OBSOLETE = 70;
global MODE;

robot_point = findRobot(obstacles, maze, corners, obstacles_vector);
%robot_point = input('Current point:');

%imshow(obstacles);

a = lastPos - robot_point; %vector between last postion and current

robot_point
b = target - robot_point; %vector between target and current
target

len = sqrt(sum(a.^2))*sqrt(sum(b.^2));
%a
%b
%len
%dot2=dot(a,b)
movement_dist = sqrt(sum(a.^2));
if (len ~= 0 && movement_dist > EPSILON && ...
        distance(lastPos, robot_point) < DISTANCE_OBSOLETE)
    angle = 180 - acosd( dot(a,b)/ (sqrt(sum(a.^2))*sqrt(sum(b.^2))))

    c = [lastPos(1), lastPos(2),1;robot_point(1),robot_point(2),1; ...
         target(1), target(2), 1];

    rotate(robot, angle, det(c) );
end

lastPos = robot_point;

%fprintf(robot,'D,3,3'); % goes 18 pixels per second
%send_command('D,15,15');
if (MODE == 1)
    set_speeds(15, 15);
    
    % if distance is really short, then only moves that distance
    pause(min(4, sqrt(sum(b.^2))/18 )); 
else
    set_speeds(3, 3);
    
    % if distance is really short, then only moves that distance
    pause(min(1.5, sqrt(sum(b.^2))/18 )); 
end

set_speeds(0, 0);

end