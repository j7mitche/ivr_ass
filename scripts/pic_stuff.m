first_hist = dohist('maze.jpg',0);
nomaze_pic = myjpgload('nomaze.jpg',0);
maze_pic = myjpgload('maze.jpg',0);
thresh = findthresh(first_hist,4,0);
mazet_pic = maze_pic > thresh;
nomazet_pic = nomaze_pic > thresh;
mazet_pic = im2bw(maze_pic);
nomazet_pic = im2bw(nomaze_pic);
diff_pic = ~(mazet_pic | nomazet_pic) + mazet_pic;

[height, width] = size(diff_pic);

window_size = 3;
black_a_width = floor(width / window_size);
black_a_height = floor(height / window_size);
black_area = zeros(black_a_height, black_a_width);

for i = (1:black_a_height - 1) * window_size + 1
    for j = (1:black_a_width -1) * window_size + 1

         tiny = diff_pic(i - (window_size - 1)/2: i + (window_size - 1)/2, ... 
            j - (window_size - 1)/2: j + (window_size - 1)/2); 
            
         black_pics = window_size ^ 2 - sum(sum(tiny));
         black_area(floor(i / window_size), floor(j / window_size)) =  ...
            (black_pics >  0.8 * window_size ^ 2);
    end

end

% looking for corner dots:
%
% find compact areas
[labeled, labels_no] = bwlabel(diff_pic * (-1) + 1, 4);
% compute compactness
compactness = zeros(labels_no, 1);
for label = (1:labels_no)
    [r, c] = find(labeled == label);
    [h, w] = size(labeled);
    compact_window = max(max(r) - min(r), max(c) - min(c));
    compact_area = labeled( min(r) : min(min(r) + compact_window, h), ...
        min(c) : min(min(c) + compact_window, w)) == label;
    compactness(label) = getcompactness(compact_area);
end
% choose those areas which are resemble circle
CIRCLE_TRESHOLD = 0.2;
circles_labels = find(abs(compactness - 1) < CIRCLE_TRESHOLD);
%imwrite(ismember(labeled, circles_labels), '1.jpg')
[h,w] = size(circles_labels);
centroids = regionprops(labeled, 'Centroid');

X = zeros(h, 2);
for i=(1:h)
   s = centroids(circles_labels(i)).Centroid;
   X(i,1) = s(1); X(i,2)=s(2);
end
circles_convhull = convhull(X(:,1), X(:,2));

