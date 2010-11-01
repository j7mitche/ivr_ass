function bigSpot = findBigSpots( foreground, background, corners, index)

obs_pic = removeBackground( foreground, background);
imwrite(obs_pic, 'obs.jpg','jpg');
projwobs_pic = remap('obs.jpg', 'jpg', corners);
imwrite( projwobs_pic, 'temp.jpg', 'jpg');
projwobs_pic = myjpgload( 'temp.jpg', 0);
projwobs_pic = getlargest(projwobs_pic,0);

%imshow(projwobs_pic);

[labeled, labels_no] = bwlabel(-projwobs_pic + 1, 4);
areas = regionprops(labeled, 'Area');
[areas, order] = sort([areas(:).Area], 'descend');
centroids = regionprops(labeled, 'Centroid');
bigSpot = centroids(order(index));
end
