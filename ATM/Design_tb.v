module Design_tb();
// Assertion begining


					 
//End of assertion
reg clk_tb,rst_tb;
integer I,s;
integer seed1= 1;
integer seed2 =2;
integer seed3 = 10;
reg
i_idle_tb, 
i_lang_tb,

i_with_tb,
i_bal_tb,

i_depConf_tb,i_withConf_tb,
i_transferConf_tb,

i_balNotEnough_tb,
i_balEnq_tb;
reg[3:0] i_passwd_tb;
reg[2:0] i_transactionMenu_tb;//options for transaction
reg[4:0] i_chooseBal_tb;
reg[4:0]i_addVal_tb; // add another value 
reg[4:0]i_transfer_tb;
reg[4:0]i_dep_tb;//takes you to transaction menu //withdraw another value  // 5 bits for Balance  
wire o_transferConf_tb,o_depConf_tb,o_withConf_tb,
o_balEnq_tb,o_balNotEnough_tb,o_pin_tb;

//Ask Mo3ed tmw 
//wire currentstate,nextstate;
//assign currentstate=4'b0000; //currenstate=idle
//assign nextstate=4'b0001;



localparam  [3:0]    IDLE = 4'b0000,
                     Lang = 4'b0001,
                     Pin = 4'b0010,
					 Transaction = 4'b0011,
					 Deposit = 4'b0100,
					 Withdraw = 4'b0101 ,
					 Balance_inq = 4'b0110 ,
					 Balance_notenough = 4'b0111 ,
					 Transfer = 4'b1000,
					 Transfer_confirm = 4'b1001 ,
					 Deposit_confirm = 4'b1010 ,
					 withdraw_confirm = 4'b1011 ,
					 with_another = 4'b1100 ;
					 
initial 
	begin
		
		
			//Initial Values
			//case1:test Pin with wrong pin

			clk_tb=1'b1;
			rst_tb=1'b0;
			#10
			rst_tb=1'b1;
i_idle_tb=1'b0;
i_lang_tb=1'b0;
i_dep_tb=1'b0;
i_with_tb=1'b0;
i_bal_tb=1'b0;
i_transfer_tb=1'b0;
i_depConf_tb=1'b0;
i_withConf_tb=1'b0;
i_transferConf_tb=1'b0;
i_chooseBal_tb=5'b00000;
i_addVal_tb=5'b00000;
i_balNotEnough_tb=1'b0;
i_balEnq_tb=1'b0;
i_passwd_tb=4'b0000;
i_transactionMenu_tb=3'b000;
//Directed flow 1st 
#10
i_idle_tb=1'b1;     //case deposit
#10
i_lang_tb=1'b0;
#10
i_lang_tb=1'b1;
#10
i_passwd_tb=4'b0000;
#10
i_passwd_tb=4'b1111;
#10
i_transactionMenu_tb=3'b000; //hanrg3 tany 3ashan george
#10
i_transactionMenu_tb=3'b001;
#10
i_dep_tb=5'b00000; // keep at deposit as dep=0
#10
i_dep_tb=5'b00010; // From here Balance =18 
#10
i_depConf_tb=1'b1; //Error @90
#10
i_transactionMenu_tb=3'b010; // Error
#10
i_with_tb=1'b1;
#10
i_chooseBal_tb=5'b01111; // Goes to withdraw confirmation in range <16
#10
i_withConf_tb=1'b1; //returns to Transaction
#10
i_transactionMenu_tb=3'b010;
#10
i_with_tb=1'b1;
#10
i_chooseBal_tb=5'b10001; //Goes to Balance not enough as 17>16
#10
i_balNotEnough_tb=1'b0;  // Return Back to Ideal 
#10
i_idle_tb=1'b0; // 
i_lang_tb=1'b0;
i_dep_tb=1'b0;
i_with_tb=1'b0;
i_bal_tb=1'b0;
i_transfer_tb=1'b0;
i_depConf_tb=1'b0;
i_withConf_tb=1'b0;
i_transferConf_tb=1'b0;
i_chooseBal_tb=5'b00000;
i_addVal_tb=5'b00000;
i_balNotEnough_tb=1'b0;
i_balEnq_tb=1'b0;
i_passwd_tb=4'b0000;
i_transactionMenu_tb=3'b000;
#10

//Second Directed flow 
i_idle_tb=1'b1;
#10
i_lang_tb=1'b1;
#10
i_passwd_tb=4'b1111;
#10
i_transactionMenu_tb=3'b100; // Goes to Transfer state
#10 
i_transfer_tb=5'b00101;  // as transfer =5 less than balance Goes to Transfer and transfer confirm
#10
i_transferConf_tb=1'b1; // Goes to Transaction 
#10
i_transactionMenu_tb=3'b100;
#10
i_transfer_tb=5'b11111;  // 31 should go to balance not enough
#10
i_balNotEnough_tb=1'b0; //should go to ideal 
#10
i_idle_tb=1'b0;
i_lang_tb=1'b0;
i_dep_tb=1'b0;
i_with_tb=1'b0;
i_bal_tb=1'b0;
i_transfer_tb=1'b0;
i_depConf_tb=1'b0;
i_withConf_tb=1'b0;
i_transferConf_tb=1'b0;
i_chooseBal_tb=5'b00000;
i_addVal_tb=5'b00000;
i_balNotEnough_tb=1'b0;
i_balEnq_tb=1'b0;
i_passwd_tb=4'b0000;
i_transactionMenu_tb=3'b000;
#10
// 3rd Directedflow 
i_idle_tb=1'b0;
#10
i_idle_tb=1'b1;
#10
i_lang_tb=1'b1;
#10
i_passwd_tb=4'b1111; //correct pass 
#10
i_transactionMenu_tb=3'b011; // goes to Balance inquiry
 //$display("The Balance is ",balance);
#10
i_balEnq_tb=1'b0; //Goes to ideal 
#10
i_idle_tb=1'b0;
i_lang_tb=1'b0;
i_dep_tb=1'b0;
i_with_tb=1'b0;
i_bal_tb=1'b0;
i_transfer_tb=1'b0;
i_depConf_tb=1'b0;
i_withConf_tb=1'b0;
i_transferConf_tb=1'b0;
i_chooseBal_tb=5'b00000;
i_addVal_tb=5'b00000;
i_balNotEnough_tb=1'b0;
i_balEnq_tb=1'b0;
i_passwd_tb=4'b0000;
i_transactionMenu_tb=3'b000; //Ends here at 370
s=1'd5;
for(I=0;I<10000;I=I+1)
begin
@(posedge clk_tb)
i_idle_tb=$random(seed1);
i_lang_tb=$random(seed1);
i_dep_tb=$random(seed1);
i_with_tb=$random(seed1);
i_bal_tb=$random(seed1);
i_transfer_tb=$random(seed1);
i_depConf_tb=$random(seed1);
i_withConf_tb=$random(seed1);
i_transferConf_tb=$random(seed1);
i_chooseBal_tb=$random(seed1);
i_addVal_tb=$random(seed1);
i_balNotEnough_tb=$random(seed1);
i_balEnq_tb=$random(seed1);
i_passwd_tb=$random(seed1);
i_transactionMenu_tb=$random(seed1);


end 
#100


// $finish;
//end

i_balEnq_tb=1'b0; //Goes to ideal 
#10
i_idle_tb=1'b0;
i_lang_tb=1'b0;
i_dep_tb=1'b0;
i_with_tb=1'b0;
i_bal_tb=1'b0;
i_transfer_tb=1'b0;
i_depConf_tb=1'b0;
i_withConf_tb=1'b0;
i_transferConf_tb=1'b0;
i_chooseBal_tb=5'b00000;
i_addVal_tb=5'b00000;
i_balNotEnough_tb=1'b0;
i_balEnq_tb=1'b0;
i_passwd_tb=4'b0000;
i_transactionMenu_tb=3'b000;

$finish;
end
	always #5 clk_tb = !clk_tb;// Clock Generator

// instaniate design instance 
  Design DUT (
	
  //input instaniation
	.rst(rst_tb),
	.clk(clk_tb),
    .i_idle(i_idle_tb), 		
    .i_lang(i_lang_tb),
    .i_dep(i_dep_tb),
	.i_with(i_with_tb), 
	.i_bal(i_bal_tb), 
	.i_transfer(i_transfer_tb), 
	.i_depConf(i_depConf_tb), 
	.i_withConf(i_withConf_tb), 
	.i_transferConf(i_transferConf_tb), 
	.i_chooseBal(i_chooseBal_tb), 
	.i_addVal(i_addVal_tb), 
	.i_balNotEnough(i_balNotEnough_tb), 
	.i_balEnq(i_balEnq_tb),
	.i_passwd(i_passwd_tb),
	.i_transactionMenu(i_transactionMenu_tb),
	// output
	.o_transferConf(o_transferConf_tb),
	.o_depConf(o_depConf_tb),
	.o_withConf(o_withConf_tb),
	.o_balEnq(o_balEnq_tb),
	.o_balNotEnough(o_balNotEnough_tb),
	.o_pin(o_pin_tb)
	 );
endmodule