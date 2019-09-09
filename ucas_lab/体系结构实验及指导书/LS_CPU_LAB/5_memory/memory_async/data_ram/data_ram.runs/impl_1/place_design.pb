
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
U
,Running DRC as a precondition to command %s
22*	vivadotcl2
place_designZ4-22
5
Running DRC with %s threads
24*drc2
2Z23-27
:

Starting %s Task
103*constraints2
PlacerZ18-103
B
%s*place23
1Effort Level for place_design : MEDIUM (Default)

_
BMultithreading enabled for place_design using a maximum of %s CPUs542*place2
2Z30-611
P

Phase %s%s
101*constraints2
1 2
Mandatory Logic OptimizationZ18-101
™
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Netlist sorting complete. 2
00:00:00.0112	
551.4532
0.000Z17-269
F
:Phase 1 Mandatory Logic Optimization | Checksum: cb00da3c
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.141 . Memory (MB): peak = 551.453 ; gain = 0.590
B

Phase %s%s
101*constraints2
2 2
Build SLR InfoZ18-101
8
,Phase 2 Build SLR Info | Checksum: cb00da3c
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.174 . Memory (MB): peak = 552.094 ; gain = 1.230
C

Phase %s%s
101*constraints2
3 2
Add ConstraintsZ18-101
9
-Phase 3 Add Constraints | Checksum: cb00da3c
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.179 . Memory (MB): peak = 552.094 ; gain = 1.230
@

Phase %s%s
101*constraints2
4 2
Build ShapesZ18-101
6
*Phase 4 Build Shapes | Checksum: 8d969920
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.333 . Memory (MB): peak = 553.328 ; gain = 2.465
T

Phase %s%s
101*constraints2
5 2"
 Implementation Feasibility checkZ18-101
J
>Phase 5 Implementation Feasibility check | Checksum: 8d969920
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.776 . Memory (MB): peak = 554.418 ; gain = 3.555
E

Phase %s%s
101*constraints2
6 2
PrePlace ElementsZ18-101
;
/Phase 6 PrePlace Elements | Checksum: 8d969920
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.787 . Memory (MB): peak = 554.418 ; gain = 3.555
I

Phase %s%s
101*constraints2
7 2
Placer InitializationZ18-101
L

Phase %s%s
101*constraints2
7.1 2
IO & Clk Placer & InitZ18-101
I

Phase %s%s
101*constraints2
7.1.1 2
IO / Clock PlacerZ18-101
K

Phase %s%s
101*constraints2
7.1.2 2
Build Placer DeviceZ18-101
K

Phase %s%s
101*constraints2

7.1.2.1 2
Place Init DeviceZ18-101
?
3Phase 7.1.1 IO / Clock Placer | Checksum: 8d969920
*common
b

%s
*constraints2K
ITime (s): elapsed = 00:00:01 . Memory (MB): peak = 557.625 ; gain = 6.762
A
5Phase 7.1.2.1 Place Init Device | Checksum: 8d969920
*common
b

%s
*constraints2K
ITime (s): elapsed = 00:00:01 . Memory (MB): peak = 559.160 ; gain = 8.297
A
5Phase 7.1.2 Build Placer Device | Checksum: 8d969920
*common
b

%s
*constraints2K
ITime (s): elapsed = 00:00:01 . Memory (MB): peak = 559.160 ; gain = 8.297
B
6Phase 7.1 IO & Clk Placer & Init | Checksum: 8d969920
*common
b

%s
*constraints2K
ITime (s): elapsed = 00:00:02 . Memory (MB): peak = 559.230 ; gain = 8.367
J

Phase %s%s
101*constraints2
7.2 2
Build Placer NetlistZ18-101
I

Phase %s%s
101*constraints2
7.2.1 2
Place Init DesignZ18-101
?
3Phase 7.2.1 Place Init Design | Checksum: b962d65a
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:03 . Memory (MB): peak = 566.586 ; gain = 15.723
@
4Phase 7.2 Build Placer Netlist | Checksum: b962d65a
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:03 . Memory (MB): peak = 566.586 ; gain = 15.723
F

Phase %s%s
101*constraints2
7.3 2
Constrain ClocksZ18-101
<
0Phase 7.3 Constrain Clocks | Checksum: b962d65a
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:03 . Memory (MB): peak = 566.586 ; gain = 15.723
?
3Phase 7 Placer Initialization | Checksum: b962d65a
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:03 . Memory (MB): peak = 566.586 ; gain = 15.723
D

Phase %s%s
101*constraints2
8 2
Global PlacementZ18-101
:
.Phase 8 Global Placement | Checksum: ef3181c0
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:08 . Memory (MB): peak = 577.840 ; gain = 26.977
D

Phase %s%s
101*constraints2
9 2
Detail PlacementZ18-101
P

Phase %s%s
101*constraints2
9.1 2
Commit Multi Column shapesZ18-101
F
:Phase 9.1 Commit Multi Column shapes | Checksum: ef3181c0
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:08 . Memory (MB): peak = 577.840 ; gain = 26.977
R

Phase %s%s
101*constraints2
9.2 2
Commit Most Shapes & LUTRAMsZ18-101
H
<Phase 9.2 Commit Most Shapes & LUTRAMs | Checksum: 67e8e83c
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:09 . Memory (MB): peak = 577.973 ; gain = 27.109
?

Phase %s%s
101*constraints2
9.3 2
	Area SwapZ18-101
5
)Phase 9.3 Area Swap | Checksum: aaa85098
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:09 . Memory (MB): peak = 577.973 ; gain = 27.109
D

Phase %s%s
101*constraints2
9.4 2
Path OptimizerZ18-101
:
.Phase 9.4 Path Optimizer | Checksum: aaa85098
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:09 . Memory (MB): peak = 577.973 ; gain = 27.109
I

Phase %s%s
101*constraints2
9.5 2
Commit Small ShapesZ18-101
?
3Phase 9.5 Commit Small Shapes | Checksum: 3cae2e71
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
:
.Phase 9 Detail Placement | Checksum: 3cae2e71
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
F

Phase %s%s
101*constraints2
10 2
PostPlace CleanupZ18-101
<
0Phase 10 PostPlace Cleanup | Checksum: 3cae2e71
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
E

Phase %s%s
101*constraints2
11 2
Placer ReportingZ18-101
;
/Phase 11 Placer Reporting | Checksum: 3cae2e71
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
<

Phase %s%s
101*constraints2
12 2	
CleanupZ18-101
2
&Phase 12 Cleanup | Checksum: 9687aeea
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
4
(Ending Placer Task | Checksum: fd7db598
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:10 . Memory (MB): peak = 580.297 ; gain = 29.434
?
Releasing license: %s
83*common2
ImplementationZ17-83
Š
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
place_design: 2

00:00:102	
580.2972
31.832Z17-269
L

DEBUG : %s144*timing2'
%Generate clock report | CPU: 0 secs 
Z38-163
n
breport_utilization: Time (s): elapsed = 00:00:00.022 . Memory (MB): peak = 580.297 ; gain = 0.000
*common
X

DEBUG : %s134*designutils2.
,Generate Control Sets report | CPU: 0 secs 
Z20-134
4
Writing XDEF routing.
211*designutilsZ20-211
A
#Writing XDEF routing logical nets.
209*designutilsZ20-209
A
#Writing XDEF routing special nets.
210*designutilsZ20-210
”
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Write XDEF Complete: 2
00:00:00.4292	
580.2972
0.000Z17-269


End Record