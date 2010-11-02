function rotate(robot, angle, direction)

if ( direction < 0 )
   fprintf(robot,'D,-3,3'); % turning left
else
       fprintf(robot,'D,3,-3'); % turning left
end

pause(angle/50);
fprintf(robot,'D,0,0');


end