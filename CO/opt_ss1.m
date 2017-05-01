function [J1_res,xcom_res]=opt_ss1(z1,z2, x_com)


func=@objective;
con=@constraint;
b0=[1,1];
options = optimset('Display', 'off') ;
[b1_res,J1_res,exitflag, output]=fmincon(func,b0,[],[],[],[],[],[],con,options);
xcom_res=b1_res(2);

    function obj=objective(b1)
        obj=ss1_obj(b1, z1,z2, x_com);       
    end
    function [con,ceq]=constraint(b1)
        con=ss1_con(b1,z2);
        ceq=[];
    end

end