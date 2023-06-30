module digit_decoder(
    input logic keystrobe, clk, nrst,
    input logic [3:0] keycode,
    output logic isdig,
    output logic [3:0] digitCode
 );
  logic [3:0] next_digitCode;

  always_ff @(posedge clk, negedge nrst) begin
    if(nrst == 0) begin
      digitCode <= 0;
    end
    else begin
      digitCode <= next_digitCode;
    end
  end
 always_comb begin
    if(keystrobe && keycode < 4'b1010) begin
        next_digitCode = keycode;
        isdig = 1;
    end
    else begin
        next_digitCode = digitCode;
        isdig = 0;
    end
 end
endmodule