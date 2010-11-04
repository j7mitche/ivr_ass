function [] = driveRobot(robot, nomaze, maze, obstacles)


    corners = pic_stuff(nomaze, maze, obstacles);


    [robot_point, obs1, obs2] = findBigSpots(obstacles, maze, corners, 1);
        
    %turn right if turn = -1 and turn left if turn = 1
    [turn, paths] = determinePath(robot_point, obs1, obs2)

    if ( paths == 1 )
        targets = [35 85; 145 85];
    elseif (paths == 2 )
        targets = [35 150; 145 150];
    else
        targets = [35 230; 145 230];
    end

    if (turn == 1)
        targets = [targets; [150 45]];
    else
        
        targets = [targets(2,:); targets(1,:); [30 45]];
    end    
    %targets
    
    %robot_point = [25 50];
    path(robot, targets, robot_point, maze, obstacles, corners, [obs1; obs2]);

    
    
    
end