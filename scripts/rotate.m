function rotate(robot, angle, direction)

EPSILON = 20;
EPSILON_MAX = 170;

if (angle <= EPSILON || angle > EPSILON_MAX)
    return;
end

if ( direction < 0 )
   set_speeds(-15,15 ); % turning left
else
       set_speeds(15,-15); % turning left
end
%time = angle/26
time = angle/40;

pause(angle/40);
set_speeds(0,0);


end