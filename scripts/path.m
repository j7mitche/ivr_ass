function path(robot, targets, lastPos, maze, obstacles, corners, obstacles_v)

EPSILON = 10;
global MODE;

position = lastPos;
targets_size = size(targets);
position_matrix = [];
for i = (1 : targets_size(1))
    tar = targets(i, :);

    distance(tar,position)
    while( distance(tar,position) > EPSILON )

        position_matrix = [position_matrix; position];
        position = goToTarget(robot, tar, maze, obstacles, corners, position, obstacles_v);

        if (MODE == 1)
            
        
            a = take_snap();
            %obstacles = myjpgload('/tmp/snapshot.ppm', 0);
            obstacles = '/tmp/snapshot.ppm';
            pause(0.2);
            %imshow(obstacles)
        else
            takePicture();
            obstacles = '00000005.jpg';
        end
    end
end

position_matrix 


end
