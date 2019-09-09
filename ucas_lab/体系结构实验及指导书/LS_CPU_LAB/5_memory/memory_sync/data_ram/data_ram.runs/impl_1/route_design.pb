
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
route_designZ4-22
5
Running DRC with %s threads
24*drc2
2Z23-27
;

Starting %s Task
103*constraints2	
RoutingZ18-103
^
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
2Z35-254
9

Starting %s Task
103*constraints2
RouteZ18-103
C

Phase %s%s
101*constraints2
1 2
Build RT DesignZ18-101
T

Phase %s%s
101*constraints2
1.1 2 
Build Netlist & NodeGraph (MT)Z18-101
™
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
Netlist sorting complete. 2
00:00:00.0052	
578.4842
0.000Z17-269
C
7Phase 1.1 Build Netlist & NodeGraph (MT) | Checksum: 0
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 803.391 ; gain = 224.906
2
&Phase 1 Build RT Design | Checksum: 0
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 803.391 ; gain = 224.906
I

Phase %s%s
101*constraints2
2 2
Router InitializationZ18-101
r
\No timing constraints were detected. The router will operate in resource-optimization mode.
64*routeZ35-64
Q
3Estimated Global Vertical Wire Utilization = %s %%
23*route2
0.06Z35-23
S
5Estimated Global Horizontal Wire Utilization = %s %%
22*route2
0.11Z35-22
E

Phase %s%s
101*constraints2
2.1 2
Restore RoutingZ18-101
;
Design has %s routable nets.
92*route2
960Z35-249
?
#Restored %s nets from the routeDb.
95*route2
0Z35-252
E
)Found %s nets with FIXED_ROUTE property.
94*route2
0Z35-251
;
/Phase 2.1 Restore Routing | Checksum: e2188dc9
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 807.773 ; gain = 229.289
I

Phase %s%s
101*constraints2
2.2 2
Special Net RoutingZ18-101
?
3Phase 2.2 Special Net Routing | Checksum: dc8483e1
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 810.566 ; gain = 232.082
R

Phase %s%s
101*constraints2
2.3 2
Non Guided Clock Net RoutingZ18-101
H
<Phase 2.3 Non Guided Clock Net Routing | Checksum: dc8483e1
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 810.566 ; gain = 232.082
?
3Phase 2 Router Initialization | Checksum: dc8483e1
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 811.316 ; gain = 232.832
C

Phase %s%s
101*constraints2
3 2
Initial RoutingZ18-101
9
-Phase 3 Initial Routing | Checksum: 53728c7b
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 812.617 ; gain = 234.133
F

Phase %s%s
101*constraints2
4 2
Rip-up And RerouteZ18-101
H

Phase %s%s
101*constraints2
4.1 2
Global Iteration 0Z18-101
>
2Phase 4.1 Global Iteration 0 | Checksum: d410e459
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 812.617 ; gain = 234.133
<
0Phase 4 Rip-up And Reroute | Checksum: d410e459
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 812.617 ; gain = 234.133
A

Phase %s%s
101*constraints2
5 2
Post Hold FixZ18-101
7
+Phase 5 Post Hold Fix | Checksum: d410e459
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 812.617 ; gain = 234.133
I

Phase %s%s
101*constraints2
6 2
Verifying routed netsZ18-101
?
3Phase 6 Verifying routed nets | Checksum: d410e459
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:10 . Memory (MB): peak = 814.453 ; gain = 235.969
E

Phase %s%s
101*constraints2
7 2
Depositing RoutesZ18-101
;
/Phase 7 Depositing Routes | Checksum: 3d26fa6e
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:11 . Memory (MB): peak = 814.453 ; gain = 235.969
4
Router Completed Successfully
16*routeZ35-16
,
 Ending Route Task | Checksum: 0
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:11 . Memory (MB): peak = 814.453 ; gain = 235.969
j
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118
s
ZWebTalk report has not been sent to Xilinx. Please check your network and proxy settings.
185*commonZ17-185
d

%s
*constraints2M
KTime (s): elapsed = 00:01:23 . Memory (MB): peak = 814.453 ; gain = 235.969
?
Releasing license: %s
83*common2
ImplementationZ17-83
‹
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
route_design: 2

00:01:232	
814.4532	
242.313Z17-269
5
Running DRC with %s threads
24*drc2
2Z23-27

#The results of DRC are in file %s.
168*coretcl2Î
dD:/test/a7/tixijieg/memory/memory_sync/data_ram/data_ram.runs/impl_1/data_ram_display_drc_routed.rptdD:/test/a7/tixijieg/memory/memory_sync/data_ram/data_ram.runs/impl_1/data_ram_display_drc_routed.rpt8Z2-168
B
,Running Vector-less Activity Propagation...
51*powerZ33-51
G
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1
n
UpdateTimingParams:%s.
91*timing2>
< Speed grade: -2, Delay Type: min_max, Constraints type: SDCZ38-91
a
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191
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
00:00:00.2352	
814.4532
0.000Z17-269


End Record