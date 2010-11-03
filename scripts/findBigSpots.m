function [robot_point, obs1, obs2] = findBigSpots( foreground, background, corners, index)

obs_pic = removeBackground( foreground, background);
%imshow(obs_pic);
imwrite(obs_pic, 'obs1.jpg','jpg');
projwobs_pic = remap('obs1.jpg', 'jpg', corners);
imwrite( projwobs_pic, 'temp1.jpg', 'jpg');
projwobs_pic = im2bw( imread('temp1.jpg') );
projwobs_pic = getlargest(projwobs_pic,0);


imshow(projwobs_pic);

[labeled, labels_no] = bwlabel(-projwobs_pic + 1, 4);
regions = regionprops(labeled, 'Area', 'Centroid', 'Perimeter');
[areas, order] = sort([regions(:).Area], 'descend');


bigSpots = regions(order(1:3));

c1 = getcompactness(bigSpots(1));
c2 = getcompactness(bigSpots(2));
c3 = getcompactness(bigSpots(3));
compactness = [c1, c2, c3];
for i= 1:3
    compactness(i) = abs(1 - compactness(i));
end


robot_index = find(compactness == min(compactness));

robot_point = bigSpots(robot_index).Centroid;

obstacles = setdiff(1:3, [robot_index]);
obs1 = bigSpots(obstacles(1)).Centroid;
obs2 = bigSpots(obstacles(2)).Centroid;


end
