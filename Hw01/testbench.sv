// Code your testbench here
// or browse Examples
module decoder_3_8_tb;
reg E_tb;                                        //宣告暫存器E_tb
reg clka,clkb;                                  //宣告暫存器clka、clkb
reg [2:0] In_tb;                                 //宣告暫存器In_tb[0]~In_tb[2]
wire [7:0] Out_tb;                               //宣告暫存器Out_tb[0]~Out_tb[7]
wire clka_out, clkb_out;                         //宣告連接線clka_out、clkb_out
decoder_3_8 decoder_1(.E(E_tb), .In(In_tb), .Out(Out_tb));//宣告decoder_1為三對八解碼器並傳入變數(致能輸入、輸入、輸出)
clkgen clkgen_1(.clka(clka), .clkb(clkb), .clka_out(clka_out), .clkb_out(clkb_out));//宣告clkgen_1為時脈產生器並傳入變數(時脈產生A輸入及輸出、時脈產生B輸入及輸出)
initial begin                                    //在一開始初始化的時後，可以透過 initial 設定初值
clka = 1'b0; clkb = 1'b0;                        //預設clka、clkb為1位元的0
end
always begin                                     
#10 clka = ~clka;                                //延遲10秒後clka=NOT(clka)
end
always begin
#20 clkb = ~clkb;                                //延遲10秒後clkb=NOT(clkb)
end
    
initial begin                                    
#0 E_tb = 0; In_tb = 3'b000;                     //預設致能為0，三個輸入為000
#10 E_tb = 1; In_tb = 3'b000;                    //延遲10後致能為1，三個輸入為000
#10 E_tb = 1; In_tb = 3'b001;                    //延遲10後致能為1，三個輸入為001
#10 E_tb = 1; In_tb = 3'b010;                    //延遲10後致能為1，三個輸入為010
#10 E_tb = 1; In_tb = 3'b011;                    //延遲10後致能為1，三個輸入為011
#10 E_tb = 1; In_tb = 3'b100;                    //延遲10後致能為1，三個輸入為100
#10 E_tb = 1; In_tb = 3'b101;                    //延遲10後致能為1，三個輸入為101
#10 E_tb = 1; In_tb = 3'b110;                    //延遲10後致能為1，三個輸入為110
#10 E_tb = 1; In_tb = 3'b111;                    //延遲10後致能為1，三個輸入為111
#10 $finish;
end
initial begin
$dumpfile("decoder.vcd");                        //將輸出訊號紀錄到decoder.vcd
$dumpvars(0, decoder_1);                         //紀錄decoder_1產生的訊號
$dumpvars(0, clkgen_1);                          //紀錄clkgen_1產生的訊號                                    
end
endmodule