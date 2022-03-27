// Code your design here
module decoder_2_4(E , In , Out);    
input E;                                 //宣告致能輸入E
input [1:0] In;                          //宣告In[0]、In[1]輸入
output [3:0] Out;                        //宣告Out[0]~Out[3]輸出
wire [3:0] Out;                          //宣告Out[0]~Out[3]為連接線
assign Out = E ? 1'b1 << In : 4'h0;      //E為1時輸出二進制左移In個位元，為0時輸出0
endmodule

module decoder_3_8(E , In , Out);
input E;                                 //宣告致能輸入E
input [2:0] In;                          //宣告In[0]~In[2]輸入
output [7:0] Out;                        //宣告Out[0]~Out[7]輸出
wire E1 , G1 , G2;                       //宣告三對八解碼器致能線E1，二對四解碼器致能線G1、G2
    not u1(E1 , In[2]);                  //E1=透過NOT閘連接E1與In[2]
    and a1(G1 , E , In[2]);              //G1=透過AND閘連接E與In[2]
    and a2(G2 , E , E1);                 //G2=透過AND閘連接E與E2
decoder_2_4 block1(G1 , In[1 : 0] , Out[7 : 4]); //Out[7:4] = G1及In0[0:1]輸入decoder_2_4
decoder_2_4 block2(G2 , In[1 : 0] , Out[3 : 0]); //Out[7:4] = G1及In0[0:1]輸入decoder_2_4
endmodule

module clkgen(clka, clkb, clka_out, clkb_out);
input clka, clkb;                                //宣告clka、clkb輸入埠
output clka_out, clkb_out;                       //宣告clka_out、clkb_out輸出埠
reg clka_out, clkb_out;                          //將clka_out、clkb_out連接暫存器
always @(clka) begin                             //當clka有變化時 clka_out = clka
    clka_out = clka;
end
always @(clkb) begin                             //當clkb有變化時 clkb_out = clkb
    clkb_out = clkb;
end
endmodule