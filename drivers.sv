//
//
//
//-----------------CLASS DRIVERS----------------
//
//
//
//
//
//
//Class  Drivers are Responsible for Recieving the data from the generator and send the data to the DUT through virutual interface
//
//   ---- Version 0.5 ----



`ifndef  DRIVERS
`define  DRIVERS

import  dual_port_pkg ::*;


class  drivers;
 
  transction t;
  virtual  dual_inf vif ;

  mailbox #(transction)mbx;
  event done;
  function new(mailbox #(transction) mbx);
   this.mbx    = mbx;
  endfunction 

  task run ();
    t=new();
    forever begin
	  mbx.get(t);
	  vif.dina  = t.dina;
      vif.addra = t.addra;
      vif.ena   = t.ena;
      vif.wea   = t.wea;
      vif.dinb  = t.dinb;
      vif.addrb = t.addrb;
      vif.enb   = t.enb;
      vif.web   = t.web;
    //  $display(" [DRV]: Recieved the Randoamized Value are i_dina:%0d ,i_addra: %0d,i_ena:%0d ,i_wea: %0d,i_dinb:%0d ,i_addrb: %0d ",t.i_dina, t.i_addra, t.i_ena, t.i_wea, t.i_dinb, t.i_addrb); 
      //$display("[DRV] :Value recieved form the Randoamized Value are i_enb:%0d ,i_web: %0d" ,t.i_enb, t.i_web); 


      $display("[DRV]:Triggered Interface"); 
	  ->done;
	  repeat(4) @(posedge vif.clka);
	 // #20;
	end
  endtask 

endclass

`endif // DRIVERS

