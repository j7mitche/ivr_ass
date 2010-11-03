function newArray = correctOrientation(corners, notcorners)


if ( abs(notcorners(1,2) - notcorners(2,2)) < 5)
    if ( notcorners(1,2) < notcorners(2,2) )
        top = 1;
    else
        top = 2;
    end
elseif( notcorners(1,1) > notcorners(2,1) )
    top = 4;
else
    top = 5;
end

new_corners = [corners(:,2),corners(:, 1)];

min = 10000;
min_index = -1;
    for i = 1:4
   
        dist = distance(new_corners(i,:), notcorners(mod(top,3),:));
    
        if dist < min
            min = dist;
            min_index = i;
        end
    end
    
if ( top > 3 )
    if ( corners(min_index,1) < notcorners(mod(top,3),1) )
        newArray = rotateArr(corners, 1);
    else
        newArray = rotateArr(corners, 3);
    end
else
    if ( corners(min_index,1) > notcorners(mod(top,3),1) )
        newArray = rotateArr(corners, 2);
    else
        newArray = corners;
    end
end

end
    