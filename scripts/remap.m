% An example of projective transfer

function newimage = remap(name, ext, M)

UV=zeros(4,2);
XY=zeros(4,2);
UV=[[1,1]',[1,180]',[270,180]',[270,1]']';    % target points
XY=M;    % source points

P=esthomog(UV,XY,4);    % estimate homography mapping UV to XY

% get input image and sizes
inimage=imread(name, ext);
[IR,IC,D]=size(inimage);

outimage=zeros(270,180,3);   % destination image
v=zeros(3,1);

% loop over all pixels in the destination image, finding
% corresponding pixel in source image
for r = 1 : 270
for c = 1 : 180
  v=P*[r,c,1]';        % project destination pixel into source
  y=round(v(1)/v(3));  % undo projective scaling and round to nearest integer
  x=round(v(2)/v(3));
  if (x >= 1) & (x <= IC) & (y >= 1) & (y <= IR)
    outimage(r,c,:)=inimage(y,x,:);   % transfer colour
  end
end
end

newimage = outimage/255;

% save transfered image
%imwrite(uint8(outimage),'hzoutput.png','png');

end
