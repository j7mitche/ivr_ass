function path(robot, targets, lastPos, maze, obstacles, corners)

EPSILON = 20;

targets_size = size(targets);
for i = (1 : targets_size(1))
    tar = targets(i, :);
    position = lastPos;
    distance(tar,position)
    while( distance(tar,position) > EPSILON )
        position = goToTarget(robot, tar, maze, obstacles, corners, position);
        %obstacles = take_snap();
    end
end


end
