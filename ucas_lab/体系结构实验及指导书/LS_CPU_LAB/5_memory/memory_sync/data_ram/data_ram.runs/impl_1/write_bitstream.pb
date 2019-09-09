
J
-Analyzing %s Unisim elements for replacement
17*netlist2
4Z29-17
O
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28
‘
Loading clock regions from %s
13*device2Z
XC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/artix7/artix7/xc7a200t/ClockRegion.xmlZ21-13
’
Loading clock buffers from %s
11*device2[
YC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/artix7/artix7/xc7a200t/ClockBuffers.xmlZ21-11

&Loading clock placement rules from %s
318*place2O
MC:/Xilinx/14.3/ISE_DS/PlanAhead/data/parts/xilinx/artix7/ClockPlacerRules.xmlZ30-318

)Loading package pin functions from %s...
17*device2K
IC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/artix7/PinFunctions.xmlZ21-17
Ž
Loading package from %s
16*device2]
[C:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/artix7/artix7/xc7a200t/fbg676/Package.xmlZ21-16
‚
Loading io standards from %s
15*device2L
JC:/Xilinx/14.3/ISE_DS/PlanAhead/data\./parts/xilinx/artix7/IOStandards.xmlZ21-15
Ž
+Loading device configuration modes from %s
14*device2J
HC:/Xilinx/14.3/ISE_DS/PlanAhead/data\parts/xilinx/artix7/ConfigModes.xmlZ21-14
‰
/Loading list of drcs for the architecture : %s
17*drc2D
BC:/Xilinx/14.3/ISE_DS/PlanAhead/data\./parts/xilinx/artix7/drc.xmlZ23-17
®
Parsing XDC File [%s]
179*designutils2x
vD:/test/a7/tixijieg/memory/memory_sync/data_ram/data_ram.runs/impl_1/.Xil/Vivado-6148-/dcp/data_ram_display_routed.xdcZ20-179
·
Finished Parsing XDC File [%s]
178*designutils2x
vD:/test/a7/tixijieg/memory/memory_sync/data_ram/data_ram.runs/impl_1/.Xil/Vivado-6148-/dcp/data_ram_display_routed.xdcZ20-178
6
Reading XDEF placement.
206*designutilsZ20-206
4
Reading XDEF routing.
207*designutilsZ20-207

>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Read XDEF File: 2
00:00:00.0642	
485.6802
0.688Z17-269
3
Restoring placement.
754*designutilsZ20-754
“
ORestored %s out of %s XDEF sites from archive | CPU: %s secs | Memory: %s MB |
403*designutils2
3042
3042

0.0000002

0.000000Z20-403
Ð
!Unisim Transformation Summary:
%s111*project2“
  A total of 106 instances were transformed.
  FD => FDCE: 61 instances
  FDR => FDRE: 43 instances
  IOBUF => IOBUF (OBUFT, IBUF): 2 instances
Z1-111
1
%Phase 0 | Netlist Checksum: 60e71bdd
*common
Ž
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
read_checkpoint: 2

00:00:152	
486.2422	
358.012Z17-269
w
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2

xc7a200tZ17-347
g
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2

xc7a200tZ17-349
]
,Running DRC as a precondition to command %s
1349*	planAhead2
write_bitstreamZ12-1349
5
Running DRC with %s threads
24*drc2
2Z23-27
4
Loading data files...
1165*	planAheadZ12-1165
3
Loading site data...
1167*	planAheadZ12-1167
4
Loading route data...
1166*	planAheadZ12-1166
4
Processing options...
1514*	planAheadZ12-1514
1
Creating bitmap...
1141*	planAheadZ12-1141
.
Creating bitstream...
7*	bitstreamZ40-7
L
Writing bitstream %s...
11*	bitstream2
./data_ram_display.bitZ40-11
=
Bitgen Completed Successfully.
1606*	planAheadZ12-1842
?
Releasing license: %s
83*common2
ImplementationZ17-83
Ž
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
write_bitstream: 2

00:00:552	
788.0122	
301.770Z17-269


End Record