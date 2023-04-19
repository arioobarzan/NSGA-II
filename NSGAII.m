clc
clear
close all
format shortG

%% parametres setting

nvar=100;        %  number of variable
lb=500; % lower bound
ub=300;     % upper bound
img = uint8(zeros(ub,lb));

%img = drawCircle(img,100,100,50);


npop=100;     % number of population


pc=0.7;       % percent of crossover
ncross=2*round(npop*pc/2);  % number of crossover offspring

pm=0.3;        %  percent of mutation
nmut=round(npop*pm);  % number of mutation offspring


maxiter=50;


%% initialization
tic
emp.pos=[];
emp.cost=[];
emp.rank=[];      
emp.cdis=[];      % crowding distance


pop=repmat(emp,npop,1);
%%
for i=1:npop
    n = floor(nvar/2*rand()+nvar/2);
    ccl = zeros(3,n);
    for j=1:n
        xc = randi(lb);
        yc = randi(ub);
        r = randi((ub/5)-10)+10;
        ccl(:,j) = [xc yc r];
    end
    pop(i).pos= ccl;
    pop(i).cost=fitness(pop(i).pos,img);
    i
end
%%
[pop,F]=non_dominated_sorting(pop,npop);
pop=crowding_distance(pop,F);
pop=sorting(pop);

%% main loop

for iter=1:maxiter

    % crossover
    crosspop=repmat(emp,ncross,1);
     crosspop=crossover(crosspop,pop,ncross,img);
     
     % mutation
     mutpop=repmat(emp,nmut,1);
     mutpop=mutation(mutpop,pop,nmut,lb,ub,img);
     
     [pop]=[pop;crosspop;mutpop];
    
     [pop,F]=non_dominated_sorting(pop,npop);
      pop=crowding_distance(pop,F);
      pop=sorting(pop);
      
      pop=pop(1:npop);
      
      [pop,F]=non_dominated_sorting(pop,npop);
      pop=crowding_distance(pop,F);
      pop=sorting(pop);
      
      
      C=[pop.cost]';
      
      figure(1)
      plotpareto(F,C)
      
      
      
      disp([ ' iter =   '  num2str(iter) ' N Pareto = '  num2str(length(F{1})) ]) 
    
    
    
    
    
end

%% results

pareto=pop(F{1},:);
toc




