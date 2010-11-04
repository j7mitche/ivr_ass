function newArray = correctOrientation(corners, notcorners)


new_corners = [corners(:,2),corners(:, 1)];

min = 10000;
min_index = -1;
for i = 1:4
    distances(i) = distance(new_corners(i,:), notcorners(1,:));
end
[sorted_dists, order] = sort(distances);
a = new_corners(order(1),:);
b = new_corners(order(2),:);

if (a(2) < b(2)) 
    top_left = a;
    bottom_right = b;
elseif (a(2) == b(2))
    if (a(1) < b(1))
        top_left = a;
        bottom_right = b;
    else
        top_left = b;
        bottom_right = a;
    end
else
    top_left = b;
    bottom_right = a;
end

is_on_left = pointOnLeft(bottom_right, top_left, notcorners(1,:));
if (is_on_left == 1)
    proj_top = bottom_right;
else
    proj_top = top_left;
end

[row, col] = find(new_corners(:,1) == proj_top(1));
newArray = rotateArr(corners, row - 1);   

end
    