function img = drawCircle(img,xc,yc,r)

    x = 1:size(img,2);
    y = 1:size(img,1);
    [xx,yy] = meshgrid(x,y);
    mask = hypot(xx - xc, yy - yc) <= r;
    img(mask) = randi(220)+35;

end

