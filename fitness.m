function  Z=fitness(x,img)
    %x = pop(i).pos;
    im = img;
    for	i=1:size(x,2)
        im = drawCircle(im,x(1,i),x(2,i),x(3,i));
    end
    bl = sum(sum(im==0));
    Z = [size(x,2) bl]';
end