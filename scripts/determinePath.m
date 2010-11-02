function [turn, path] = determinePath(robot_point, obs1, obs2)

TURNING_POINT = 92;
FIRST_PATH = 115;
SECOND_PATH = 188;

if ( robot_point(1) < TURNING_POINT )
       turn = 1; %turn left
else
       turn = -1; %turn right
end
      
   if( obs1(2) > FIRST_PATH && obs2(2) > FIRST_PATH )
       path = 1;
   elseif ( obs1(2) > SECOND_PATH || obs2(2) > SECOND_PATH )
       path = 2;
   else
       path = 3;
   end

   
end