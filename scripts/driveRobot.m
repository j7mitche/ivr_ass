function [] = driveRobot(robot, nomaze, maze, obstacles)


    corners = pic_stuff(nomaze, maze, obstacles);


    robot_point = findBigSpots(obstacles, maze, corners, 1)
    
    obs1 = findBigSpots(obstacles, maze, corners, 2);
    obs2 = findBigSpots(obstacles, maze, corners, 3);
    
    %turn right if turn = -1 and turn left if turn = 1
    [turn, paths] = determinePath(robot_point, obs1, obs2);

    paths = 2;
    if ( paths == 1 )
        targets = [30 90; 145 90];
    elseif (paths == 2 )
        targets = [30 160; 145 160];
    else
        targets = [30 225; 145 225];
    end

    if (turn == 1)
        targets = [targets; [145 50]];
    else
        
        targets = [targets(2,:); targets(1,:); [25 50]];
    end    
    %targets
    
    %robot_point = [25 50];
    path(robot, targets, robot_point, maze, obstacles, corners);

    
    
    
    fclose(s); 
end