function path(robot, targets, lastPos, maze, obstacles, corners, obstacles_v)

global MODE;

FINAL_EPSILON = 10;
if (MODE == 1)
    EPSILON = 10;
else
    EPSILON = 25;
end


position = lastPos;
targets_size = size(targets);
position_matrix = [];
precision = EPSILON;
for i = (1 : targets_size(1))
    tar = targets(i, :);
    if (i == targets_size(1))
        precision = FINAL_EPSILON;
    end
    
    while( distance(tar,position) > precision )
        dist=distance(tar,position)
        position_matrix = [position_matrix; position];
        position = goToTarget(robot, tar, maze, obstacles, corners, position, obstacles_v);

        if (MODE == 1)
            
        
            a = take_snap();
            %obstacles = myjpgload('/tmp/snapshot.ppm', 0);
            obstacles = '/tmp/snapshot.ppm';
            pause(0.5);
            %imshow(obstacles)
        else
            takePicture();
            obstacles = '00000005.jpg';
        end
    end
end
position_matrix = [position_matrix; position];
hold on;
imshow('proj.jpg');
plot(position_matrix(:,1), position_matrix(:,2));
hold off;


end
