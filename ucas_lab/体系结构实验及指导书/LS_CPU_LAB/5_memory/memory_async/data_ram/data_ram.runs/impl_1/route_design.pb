
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
00:00:00.0292	
590.9492
4.078Z17-269
C
7Phase 1.1 Build Netlist & NodeGraph (MT) | Checksum: 0
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:12 . Memory (MB): peak = 813.031 ; gain = 226.160
2
&Phase 1 Build RT Design | Checksum: 0
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 813.031 ; gain = 226.160
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
0.11Z35-23
S
5Estimated Global Horizontal Wire Utilization = %s %%
22*route2
0.23Z35-22
E

Phase %s%s
101*constraints2
2.1 2
Restore RoutingZ18-101
<
Design has %s routable nets.
92*route2
2327Z35-249
?
#Restored %s nets from the routeDb.
95*route2
0Z35-252
E
)Found %s nets with FIXED_ROUTE property.
94*route2
0Z35-251
;
/Phase 2.1 Restore Routing | Checksum: afd71c48
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 817.375 ; gain = 230.504
I

Phase %s%s
101*constraints2
2.2 2
Special Net RoutingZ18-101
?
3Phase 2.2 Special Net Routing | Checksum: 26ba7630
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 837.383 ; gain = 250.512
R

Phase %s%s
101*constraints2
2.3 2
Non Guided Clock Net RoutingZ18-101
H
<Phase 2.3 Non Guided Clock Net Routing | Checksum: 26ba7630
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 837.383 ; gain = 250.512
?
3Phase 2 Router Initialization | Checksum: 26ba7630
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 837.445 ; gain = 250.574
C

Phase %s%s
101*constraints2
3 2
Initial RoutingZ18-101
9
-Phase 3 Initial Routing | Checksum: d6466308
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:13 . Memory (MB): peak = 838.629 ; gain = 251.758
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
2Phase 4.1 Global Iteration 0 | Checksum: d78bc2a3
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:14 . Memory (MB): peak = 838.629 ; gain = 251.758
<
0Phase 4 Rip-up And Reroute | Checksum: d78bc2a3
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:14 . Memory (MB): peak = 838.629 ; gain = 251.758
A

Phase %s%s
101*constraints2
5 2
Post Hold FixZ18-101
7
+Phase 5 Post Hold Fix | Checksum: d78bc2a3
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:14 . Memory (MB): peak = 838.629 ; gain = 251.758
I

Phase %s%s
101*constraints2
6 2
Verifying routed netsZ18-101
?
3Phase 6 Verifying routed nets | Checksum: d78bc2a3
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:14 . Memory (MB): peak = 838.629 ; gain = 251.758
E

Phase %s%s
101*constraints2
7 2
Depositing RoutesZ18-101
;
/Phase 7 Depositing Routes | Checksum: 451ea736
*common
d

%s
*constraints2M
KTime (s): elapsed = 00:01:15 . Memory (MB): peak = 838.629 ; gain = 251.758
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
KTime (s): elapsed = 00:01:15 . Memory (MB): peak = 838.629 ; gain = 251.758
j
QWebTalk data collection is enabled (User setting is ON. Install Setting is ON.).
118*projectZ1-118
ã
†'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2d
bD:/test/a7/tixijieg/memory/memory_async/data_ram/data_ram.runs/impl_1/usage_statistics_webtalk.xml2
Tue Mar 07 16:24:10 20172?
=C:/Xilinx/14.3/ISE_DS/PlanAhead/doc/webtalk_introduction.htmlZ17-186
d

%s
*constraints2M
KTime (s): elapsed = 00:01:25 . Memory (MB): peak = 838.629 ; gain = 251.758
?
Releasing license: %s
83*common2
ImplementationZ17-83
‹
>%sTime (s): elapsed = %s . Memory (MB): peak = %s ; gain = %s
269*common2
route_design: 2

00:01:252	
838.6292	
258.332Z17-269
5
Running DRC with %s threads
24*drc2
2Z23-27
‘
#The results of DRC are in file %s.
168*coretcl2Ð
eD:/test/a7/tixijieg/memory/memory_async/data_ram/data_ram.runs/impl_1/data_ram_display_drc_routed.rpteD:/test/a7/tixijieg/memory/memory_async/data_ram/data_ram.runs/impl_1/data_ram_display_drc_routed.rpt8Z2-168
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
00:00:00.5412	
838.6292
0.000Z17-269


End Record