function rotate(robot, angle, direction)

global MODE;

EPSILON = 20;
EPSILON_MAX = 110;

if (MODE == 1)
    speed = 15;
    angleCorrector = 40;
else
    speed = 3;
    angleCorrector = 50;
end



if (angle <= EPSILON)
    return;
end

if ( direction < 0 )
   set_speeds(-speed,speed ); % turning left
else
       set_speeds(speed,-speed); % turning left
end

%time = angle/angleCorrector;
angle = min(angle, EPSILON_MAX);
pause(angle/angleCorrector);
set_speeds(0,0);


end