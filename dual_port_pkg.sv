
//
//
// --------- PACKAGE FILE  ---------
//
// --It contains all the necssory file initlizations and the Defined parameter
//
//
//

  `ifndef DUAL_PCK
  `define DUAL_PKG


   package dual_port_pkg;
     parameter DATA_WIDTH = 8, ADDR_WIDTH =3,  READ_LATENCY =3, WRITE_LATENCY =3,TIME_PERIOD=10;

        `include "transction.sv"
	`include "generator.sv"
	`include "drivers.sv"
	`include "monitor.sv"
	`include "scoreboard.sv"
	`include "evironment.sv"

   endpackage

   `endif // DUAL_PKG

