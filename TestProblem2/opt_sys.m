beta=1;

x1_cop=-1;
x2_cop=2;

converged=false;
while converged==false

    [x1_res1,obj_res1]=opt_ss1(x1_cop,x2_cop, beta);

    [x2_res2,obj_res2]=opt_ss2(x1_cop,x2_cop, beta);


%ss1 constraint cases
counter(1)=x1_cop+beta*x2_cop-4.0;
both(1)= x1_res1+beta*x2_res2-4.0;
ss1(1)= x1_res1+beta*x2_cop-4.0;
ss2(1)= x1_cop+beta*x2_res2-4.0;

%ss2 constraint cases
counter(2)=2.0-beta*x1_cop-x2_cop;
both(2)= 2.0-beta*x1_res1-x2_res2;
ss1(2)= 2.0-beta*x1_res1-x2_cop;
ss2(2)= 2.0-beta*x1_cop-x2_res2;

%objectives
counter(3)=x1_cop^2+x2_cop^2;
both(3)=x1_res1^2+x2_res2^2;
ss1(3)=x1_res1^2+x2_cop^2;
ss2(3)=x1_cop^2+x2_res2^2;


    if abs(x1_res1-x1_cop)<=0.1 && abs(x2_res2-x2_cop)<=0.1
       converged=true;
    end
    
    if x2_res2<x2_cop
        x2_cop=x2_res2;
    end
    if x1_res1>x1_cop
        x1_cop=x1_res1;
    end

%if i==1
%    converged=true
%end

end

counter
both
ss1
ss2

