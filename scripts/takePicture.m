function Image = takePicture ()

unix('mplayer tv:// -tv driver=v4l:width=640:height=480:device=/dev/video0 -frames 5 -vo jpeg');
Image = imread('00000005.jpg');
pause(0.2);

end