function [diff_pic, thresh] = removeBackground( foreground, background)

global MODE;

front_pic = myjpgload(foreground, 1);
%size(front_pic)
back_pic = myjpgload(background, 0);
%size(back_pic)


if (MODE == 2)
   diff = 255 - (back_pic - front_pic);
   front_hist = dohist(diff,0);
    thresh = findthresh(front_hist,4,0);
    diff_pic = -(diff < thresh) +1 ;

else
    thresh = 244;

    mazet_pic = ~(front_pic < thresh);
    nomazet_pic = ~(back_pic < thresh);
    diff_pic = ~(mazet_pic | nomazet_pic) + mazet_pic;
    %imshow(diff_pic);
end
    


%imshow(mazet_pic);


%mazet_pic = im2bw(front_pic);
%nomazet_pic = im2bw(back_pic);




imwrite(diff_pic, 'removed_back.jpg', 'jpg');
%imshow(diff_pic)
end
