function  mutpop=mutation(mutpop,pop,nmut,lb,ub,img)

npop=length(pop);

for n=1:nmut
    
   i=randi([1 npop]);
   p=pop(i).pos;
   
   j=randi([1 size(p,2)]);
   
   if rand<0.05
       
    p(:,j)=[p(2,j);p(1,j);p(3,j)];  
   else
    p(:,j)=[p(1,j);p(2,j);(ub/5)-p(3,j)];    
       
   end
    
    
    
    mutpop(n).pos=p;
    mutpop(n).cost=fitness(p,img);
    
    
end






end