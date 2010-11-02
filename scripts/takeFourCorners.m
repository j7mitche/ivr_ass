function [corners, notcorners] = takeFourCorners(X)

x_size = size(X);
circles_convhull = convhull(X(:,1), X(:,2));
v = setdiff( 1:x_size(1), circles_convhull);
notcorners = X(v,:)


corners = zeros(4,2);
for i = (1 : 4)
    point = X(circles_convhull(i), :);
    %centroids(circles_labels(circles_convhull(i))).Centroid;
    corners(i, 2) = point(1);
    corners(i, 1) = point(2);
end

end
