function  [pop,F]=non_dominated_sorting(pop,npop)

%%
k=1;

F{k}=[];

n1=npop;

dm=zeros(n1);% dominate matrix
%%
for i=1:n1
    a=pop(i).cost;
    
    if i==n1
        if sum(dm(:,i))==0
            F{k}=[F{k} i];
            pop(i).rank=k;
        end
        break
    end
    
    for j=i+1:n1
        
        b=pop(j).cost;
        
        if dominate(a,b)
            dm(i,j)=1;
        elseif dominate(b,a)
            dm(j,i)=1;
        end
        
    end
    
    if sum(dm(:,i))==0
        F{k}=[F{k} i];
        pop(i).rank=k;
    end
    
    
    
end
%%

s=F{k};
dm(s,:)=0;
dm(:,s)=inf;



while true
    k=k+1;
    
    s=find(sum(dm)==0);
    if isempty(s)
        break
    end
    F{k}=s;
    dm(s,:)=0;
    dm(:,s)=inf;
    
    for j=s
        pop(j).rank=k;
    end
    
end

end