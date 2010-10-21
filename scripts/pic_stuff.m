first_hist = dohist('maze.jpg',0);
nomaze_pic = myjpgload('nomaze.jpg',0);
maze_pic = myjpgload('maze.jpg',0);
thresh = findthresh(first_hist,4,0);
mazet_pic = maze_pic > thresh;
nomazet_pic = nomaze_pic > thresh;
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
         black_area(i, j) = 1 - ...
            (black_pics >  0.8 * window_size ^ 2);
    end

end

