function [] = pic_stuff(nomaze, maze, obstacles)

    diff_pic = removeBackground(maze, nomaze);

    imwrite(diff_pic, 'diff.jpg','jpg');

    [height, width] = size(diff_pic);

    % find compact areas
    [labeled, labels_no] = bwlabel(diff_pic * (-1) + 1, 8);
    circles = getCircles(labeled, labels_no);
    [corners, notcorners] = takeFourCorners(circles);

    projected_pic = remap('diff.jpg', 'jpg', corners);

    new_corners = [corners(:,2),corners(:, 1)];

    min = 10000;
    min_index = -1;
    for i = 1:4

        dist = distance(new_corners(i,:), notcorners(1,:));

        if dist < min
            min = dist;
            min_index = i;
        end
    end

    %new_conrners(min_index, 1)

    robot_point = findBigSpots(obstacles, maze, corners, 1)

    osb1 = findBigSpots(obstacles, maze, corners, 2)
    obs2 = findBigSpots(obstacles, maze, corners, 3)
    imshow(obstacles);

end


