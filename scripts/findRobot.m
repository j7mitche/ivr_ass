function [robot_point] = findRobot( foreground, background, corners, obstacles_vector)

obs_pic = removeBackground( foreground, background);
%imshow(obs_pic);
imwrite(obs_pic, 'obs.jpg','jpg');
projwobs_pic = remap('obs.jpg', 'jpg', corners);
imwrite( projwobs_pic, 'temp.jpg', 'jpg');
projwobs_pic = im2bw( imread('temp.jpg') );
projwobs_pic = getlargest(projwobs_pic,0);


imshow(projwobs_pic);

[labeled, labels_no] = bwlabel(-projwobs_pic + 1, 4);
regions = regionprops(labeled, 'Area', 'Centroid', 'Perimeter');
[areas, order] = sort([regions(:).Area], 'descend');


bigSpots = regions(order(1:3));

%OBSTACLE_EPSILON = 40;
area_dist = zeros(3,1);
for i = (1:3)
    x = bigSpots(i).Centroid;
    area_dist(i) = min(distance(x, obstacles_vector(1,:)), distance(x, obstacles_vector(2,:)));
%     if (dist > OBSTACLE_EPSILON)
%         robot_point = x;
%         break;
%    end
end
robot_point = bigSpots(find(area_dist == max(area_dist))).Centroid;


end
