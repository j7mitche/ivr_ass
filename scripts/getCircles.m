function circlecenters = getCircles(labeled, labels_no)

% looking for 6 dots in the pictuer

% choose those areas which are resemble circle
CIRCLE_MAX_COMPACTNESS = 1.3;
CIRCLE_MIN_COMPACTNESS = 0.7;

EPSILON_CIRCLE_SIZE = 19;

areas_properties = regionprops(labeled, 'Area', 'Centroid', 'Perimeter');

[areasx, order] = sort([areas_properties(:).Area], 'descend');
%size(circles_labels)

circlecenters = zeros(6,2);
circles_labels = zeros(6,1);
circles_found = 0;
for i = (1 : labels_no)

    areas_properties(order(i)).Area;
    compactness = getcompactness(areas_properties(order(i)));

    if (compactness <= CIRCLE_MAX_COMPACTNESS && ...
        compactness >= CIRCLE_MIN_COMPACTNESS && ...
        areas_properties(order(i)).Area >= EPSILON_CIRCLE_SIZE)
        
        circles_found = circles_found + 1;
        circles_labels(circles_found) = order(i);

        center = areas_properties(order(i)).Centroid;
        circlecenters(circles_found,1) = center(1);
        circlecenters(circles_found,2)=center(2);

        if (circles_found == 6) break; end
    end

end

circles_labels = circles_labels((1:circles_found),:);
circlecenters = circlecenters((1:circles_found),:);

imwrite(ismember(labeled, circles_labels), '1.jpg');

end
