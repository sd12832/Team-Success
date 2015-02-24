
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name CortexM0 -dir "C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0/planAhead_run_1" -part xc6slx150tfgg900-2
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0/CORTEXM0DS.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0} }
set_property target_constrs_file "CORTEXM0DS.ucf" [current_fileset -constrset]
add_files [list {CORTEXM0DS.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0/CORTEXM0DS.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0/CORTEXM0DS.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/Carlos/Dropbox/University of Bristol/2 Semester/Embedded and Real-Time Systems/cortex/CortexM0/CORTEXM0DS.twx\": $eInfo"
}
