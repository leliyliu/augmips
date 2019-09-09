
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
00:00:00.0042	
543.7852
0.008Z17-269
F
:Phase 1 Mandatory Logic Optimization | Checksum: 39beef82
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.060 . Memory (MB): peak = 543.789 ; gain = 0.488
B

Phase %s%s
101*constraints2
2 2
Build SLR InfoZ18-101
8
,Phase 2 Build SLR Info | Checksum: 39beef82
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.094 . Memory (MB): peak = 544.594 ; gain = 1.293
C

Phase %s%s
101*constraints2
3 2
Add ConstraintsZ18-101
9
-Phase 3 Add Constraints | Checksum: 39beef82
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.110 . Memory (MB): peak = 544.594 ; gain = 1.293
@

Phase %s%s
101*constraints2
4 2
Build ShapesZ18-101
6
*Phase 4 Build Shapes | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.151 . Memory (MB): peak = 546.066 ; gain = 2.766
T

Phase %s%s
101*constraints2
5 2"
 Implementation Feasibility checkZ18-101
J
>Phase 5 Implementation Feasibility check | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.277 . Memory (MB): peak = 546.570 ; gain = 3.270
E

Phase %s%s
101*constraints2
6 2
PrePlace ElementsZ18-101
;
/Phase 6 PrePlace Elements | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.298 . Memory (MB): peak = 546.570 ; gain = 3.270
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
K

Phase %s%s
101*constraints2
7.1.2 2
Build Placer DeviceZ18-101
I

Phase %s%s
101*constraints2
7.1.1 2
IO / Clock PlacerZ18-101
K

Phase %s%s
101*constraints2

7.1.2.1 2
Place Init DeviceZ18-101
?
3Phase 7.1.1 IO / Clock Placer | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.510 . Memory (MB): peak = 550.105 ; gain = 6.805
A
5Phase 7.1.2.1 Place Init Device | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.900 . Memory (MB): peak = 551.715 ; gain = 8.414
A
5Phase 7.1.2 Build Placer Device | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.902 . Memory (MB): peak = 551.715 ; gain = 8.414
B
6Phase 7.1 IO & Clk Placer & Init | Checksum: fa8e9d41
*common
f

%s
*constraints2O
MTime (s): elapsed = 00:00:00.939 . Memory (MB): peak = 551.781 ; gain = 8.480
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
3Phase 7.2.1 Place Init Design | Checksum: 8d958b0b
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:02 . Memory (MB): peak = 559.188 ; gain = 15.887
@
4Phase 7.2 Build Placer Netlist | Checksum: 8d958b0b
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:02 . Memory (MB): peak = 559.188 ; gain = 15.887
F

Phase %s%s
101*constraints2
7.3 2
Constrain ClocksZ18-101
<
0Phase 7.3 Constrain Clocks | Checksum: 8d958b0b
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:02 . Memory (MB): peak = 559.188 ; gain = 15.887
?
3Phase 7 Placer Initialization | Checksum: 8d958b0b
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:02 . Memory (MB): peak = 559.188 ; gain = 15.887
D

Phase %s%s
101*constraints2
8 2
Global PlacementZ18-101
:
.Phase 8 Global Placement | Checksum: 87f0efd2
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:04 . Memory (MB): peak = 567.234 ; gain = 23.934
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
:Phase 9.1 Commit Multi Column shapes | Checksum: 87f0efd2
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:04 . Memory (MB): peak = 567.234 ; gain = 23.934
R

Phase %s%s
101*constraints2
9.2 2
Commit Most Shapes & LUTRAMsZ18-101
H
<Phase 9.2 Commit Most Shapes & LUTRAMs | Checksum: ced51630
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:04 . Memory (MB): peak = 567.938 ; gain = 24.637
?

Phase %s%s
101*constraints2
9.3 2
	Area SwapZ18-101
5
)Phase 9.3 Area Swap | Checksum: 942d9392
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:04 . Memory (MB): peak = 567.938 ; gain = 24.637
D

Phase %s%s
101*constraints2
9.4 2
Path OptimizerZ18-101
:
.Phase 9.4 Path Optimizer | Checksum: 942d9392
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:04 . Memory (MB): peak = 567.938 ; gain = 24.637
I

Phase %s%s
101*constraints2
9.5 2
Commit Small ShapesZ18-101
?
3Phase 9.5 Commit Small Shapes | Checksum: 5542d2ff
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
:
.Phase 9 Detail Placement | Checksum: 5542d2ff
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
F

Phase %s%s
101*constraints2
10 2
PostPlace CleanupZ18-101
<
0Phase 10 PostPlace Cleanup | Checksum: 5542d2ff
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
E

Phase %s%s
101*constraints2
11 2
Placer ReportingZ18-101
;
/Phase 11 Placer Reporting | Checksum: 5542d2ff
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
<

Phase %s%s
101*constraints2
12 2	
CleanupZ18-101
2
&Phase 12 Cleanup | Checksum: 10bbdf48
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
4
(Ending Placer Task | Checksum: 8b50efe0
*common
c

%s
*constraints2L
JTime (s): elapsed = 00:00:05 . Memory (MB): peak = 569.375 ; gain = 26.074
?
Releasing license: %s
83*common2
ImplementationZ17-83
Š
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
place_design: 2

00:00:052	
569.3752
28.379Z17-269
L

DEBUG : %s144*timing2'
%Generate clock report | CPU: 0 secs 
Z38-163
n
breport_utilization: Time (s): elapsed = 00:00:00.012 . Memory (MB): peak = 569.375 ; gain = 0.000
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
00:00:00.1932	
569.3752
0.000Z17-269


End Record