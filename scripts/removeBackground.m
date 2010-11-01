function diff_pic = removeBackground( foreground, background)

front_pic = myjpgload(foreground,0);
front_hist = dohist(front_pic,0);
back_pic = myjpgload(background,0);
%back_hist = dohist(back_pic,0);

thresh = findthresh(front_hist,4,0);
mazet_pic = front_pic > thresh;
%thresh2 = findthresh(back_hist,4,0);
nomazet_pic = back_pic > thresh;
%mazet_pic = im2bw(maze_pic);
%nomazet_pic = im2bw(nomaze_pic);

diff_pic = ~(mazet_pic | nomazet_pic) + mazet_pic;

end
