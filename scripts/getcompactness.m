function compactness = getcompactness(Image)

     [H,W] = size(Image);
     area = bwarea(Image);
     perim = bwarea(bwperim(Image,4));
     
     % compactness
     compactness = perim*perim/(4*pi*area);

