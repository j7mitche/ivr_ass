function newArray = rotateArr(original, rot)

    temp = [original; original];
    
    [h,w] = size(original);
    
    newArray = temp( (rot + 1:rot+h),1:w);

end