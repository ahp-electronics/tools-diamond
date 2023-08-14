module BIDIR_LR(inout wreal R, inout wire L);
    timeunit 1s;
    parameter real vsup = 1.8;
    parameter real vsuplow = 0;
    parameter real thiratio = 2.0/3;
    parameter real vthi = (thiratio * vsup) + ((1 - thiratio) * vsuplow);
    parameter real tloratio = thiratio / 2;
    parameter real vtlo = (tloratio * vsup) + ((1 - tloratio) * vsuplow);
    parameter real txdel = -1;

    real        R_val = `wrealZState;
    reg         R_conv = 1'bz;
    logic       L_val = 1'bz;
    real        L_conv = `wrealZState;
    real        dly = 0.0;

    initial begin
        $resolve_external(L, L_val);
        $resolve_external(R, R_val);
    end
   
    always begin
        dly = 0.0;
        if (R_val >= vthi)
            R_conv = 1'b1;
        else if (R_val <= vtlo)
            R_conv = 1'b0;
        else if (R_val === `wrealZState)
            R_conv = 1'bz;
        else if (R_val != R_val)
            R_conv = 1'bx;
        else if (txdel >= 0.0)
            begin
                dly = txdel;
                R_conv = 1'bx;
            end

        @(R_val);
    end 

    always begin
        if (L_val === 1'b0) 
            L_conv = vsuplow;
        else if (L_val === 1'b1) 
            L_conv = vsup;
        else if (L_val=== 1'bz) 
            L_conv = `wrealZState;
        else 
            L_conv = `wrealXState;
    
        @(L_val);
     end 

    assign R = L_conv;
    assign #(dly) L = R_conv;
endmodule 

module L2R(output wreal R, input wire L);
    timeunit 1s;
    parameter real vsup = 1.8;
    parameter real vsuplow = 0;
    parameter real thiratio = 2.0/3;
    parameter real vthi = (thiratio * vsup) + ((1 - thiratio) * vsuplow);
    parameter real tloratio = thiratio / 2;
    parameter real vtlo = (tloratio * vsup) + ((1 - tloratio) * vsuplow);
    parameter real txdel = -1;

    real        L_conv;

    always begin
        if (L === 1'b0) 
            L_conv = vsuplow;
        else if (L === 1'b1) 
            L_conv = vsup;
        else if (L=== 1'bz) 
            L_conv = `wrealZState;
        else 
            L_conv = `wrealXState;
    
        @(L);
     end 

    assign R = L_conv;
endmodule 

module R2L(input wreal R, output wire L);
    timeunit 1s;
    parameter real vsup = 1.8;
    parameter real vsuplow = 0;
    parameter real thiratio = 2.0/3;
    parameter real vthi = (thiratio * vsup) + ((1 - thiratio) * vsuplow);
    parameter real tloratio = thiratio / 2;
    parameter real vtlo = (tloratio * vsup) + ((1 - tloratio) * vsuplow);
    parameter real txdel = -1;

    reg         R_conv;
    real        dly = 0.0;

    always begin
        dly = 0.0;
        if (R >= vthi)
            R_conv = 1'b1;
        else if (R <= vtlo)
            R_conv = 1'b0;
        else if (R === `wrealZState)
            R_conv = 1'bz;
        else if (R != R)
            R_conv = 1'bx;
        else if (txdel >= 0.0)
            begin
                dly = txdel;
                R_conv = 1'bx;
            end

        @(R);
    end 

    assign #(dly) L = R_conv;
endmodule 

module L2L(L,L);
    input L;
endmodule

module R2R(R, R);
    input wreal R;
endmodule
