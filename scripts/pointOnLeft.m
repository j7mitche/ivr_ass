function is_on_left = pointOnLeft(vector_point1, vector_point2, point)
   c = [vector_point1(1), vector_point1(2), 1;
        vector_point2(1), vector_point2(2), 1; ...
         point(1), point(2), 1];

    if (det(c) > 0)
        is_on_left = 1;
    else
        is_on_left = -1;
    end
    
end