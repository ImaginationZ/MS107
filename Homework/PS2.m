function [] = genepossion
    lamda=5;
    times=1000;
    function [ out ] = gene( u, lamda )
        out=0;
        p=exp(-lamda);
        while(u>p)
           out=out+1; 
           u=u-p;
           p=p*lamda/out;
        end
    end
    list=rand(1,times);
    for t=1:times
        genelist(1,t)=gene(list(1,t),5);
    end
    gmin=min(genelist);
    gmax=max(genelist);
    gp=linspace(gmin,gmax,20);
    f=ksdensity(genelist,gp);
    plot(gp,f);

end