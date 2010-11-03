function [corners] = pic_stuff(nomaze, maze, obstacles)

    diff_pic = removeBackground(maze, nomaze);

    imwrite(diff_pic, 'diff.jpg','jpg');

    [height, width] = size(diff_pic);
    
    
    %imshow(diff_pic)
    
    % find compact areas
    [labeled, labels_no] = bwlabel(diff_pic * (-1) + 1, 8);
    circles = getCircles(labeled, labels_no);
    [corners, notcorners] = takeFourCorners(circles);
    
    corners = correctOrientation( corners, notcorners );

    projected_pic = remap('diff.jpg', 'jpg', corners);
    
    imwrite( projected_pic, 'proj.jpg', 'jpg');
    %imshow(projected_pic);

%     new_corners = [corners(:,2),corners(:, 1)];
% 
%     min = 10000;
%     min_index = -1;
%     for i = 1:4
% 
%         dist = distance(new_corners(i,:), notcorners(1,:));
% 
%         if dist < min
%             min = dist;
%             min_index = i;
%       %  end
   % end

    %new_conrners(min_index, 1)

    %imshow(obstacles);

end


