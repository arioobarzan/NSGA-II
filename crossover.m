function  crosspop=crossover(crosspop,pop,ncross,img)

npop=length(pop);


for n=1:2:npop

    
    
    i1=floor(size(pop(n).pos,2)/2);
    i2=floor(size(pop(n+1).pos,2)/2);
    
    
    p1=pop(n).pos;
    p2=pop(n+1).pos;
    
    
    o1=[p1(:,1:i1) p2(:,i2+1:end)];
    o2=[p2(:,1:i2) p1(:,i1+1:end)];


crosspop(n).pos=o1;
crosspop(n).cost=fitness(o1,img);

crosspop(n+1).pos=o2;
crosspop(n+1).cost=fitness(o2,img);




end

end