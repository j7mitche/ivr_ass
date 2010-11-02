function compactness = getcompactness(regionprop)

     area = regionprop.Area;
     perim = regionprop.Perimeter;
     
     % compactness
     compactness = perim*perim/(4*pi*area);

