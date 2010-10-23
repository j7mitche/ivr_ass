diff_pic = removeBackground( 'maze.jpg', 'nomaze.jpg');

imwrite(diff_pic, 'diff.jpg','jpg');

[height, width] = size(diff_pic);

% find compact areas
[labeled, labels_no] = bwlabel(diff_pic * (-1) + 1, 4);
compactness = findAreasCompactness(labeled, labels_no);
circles = getCircles(labeled, compactness, 10);
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

robot_point = findBigSpots('mazewR.jpg', 'maze.jpg', corners, 1)

osb1 = findBigSpots('mazewR.jpg', 'maze.jpg', corners, 2)
obs2 = findBigSpots('mazewR.jpg', 'maze.jpg', corners, 3)
%imshow(projwobs_pic);


    


