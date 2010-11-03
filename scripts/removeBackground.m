function diff_pic = removeBackground( foreground, background)

global MODE;

front_pic = myjpgload(foreground, 0);

front_hist = dohist(front_pic,0);
back_pic = myjpgload(background, 0);
%back_hist = dohist(back_pic,0);

if (MODE == 2)
    thresh = findthresh(front_hist,8,0);
else
    thresh = 244;
end

mazet_pic = ~(front_pic < thresh);

%imshow(mazet_pic);
%thresh2 = findthresh(back_hist,4,0);
nomazet_pic = ~(back_pic < thresh);
%mazet_pic = im2bw(front_pic);
%nomazet_pic = im2bw(back_pic);

diff_pic = ~(mazet_pic | nomazet_pic) + mazet_pic;
imwrite(diff_pic, 'removed_back.jpg', 'jpg');
%imshow(diff_pic)
end
