;----------------------------------------------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;----------------------------------------------------------------------
begin


 obs1 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig8/HAD-CRUT2m-obs1.txt",-1,"float")
 obs1!0         = "time"
 printVarSummary(obs1)
 
 
;*******************************************************************************
dir="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig8/"

 Mean1 = asciiread(dir+"PRECT-Hist-Fut-ICs-CT-Mean-CS2.0-new.txt",-1,"float")

 Mean1!0         = "time"
 printVarSummary(Mean1)
 ;print(Mean1)

 Mean2 = asciiread(dir+"PRECT-Hist-Fut-ICs-CT-Mean-CS2.5-new.txt",-1,"float")
 Mean2!0         = "time"
 printVarSummary(Mean2)
 
 
 
 Mean3 = asciiread(dir+"PRECT-Hist-Fut-ICs-CT-Mean-CS3.15-new.txt",-1,"float")
 Mean3!0         = "time"
 printVarSummary(Mean3)
 

 Mean4 = asciiread(dir+"PRECT-Hist-Fut-ICs-CT-Mean-CS4.5-new.txt",-1,"float")
 Mean4!0         = "time"
 printVarSummary(Mean4)
 
 
 Mean5 = asciiread(dir+"PRECT-Hist-Fut-ICs-CT-Mean-CS5.3-new.txt",-1,"float")
 Mean5!0         = "time"
 printVarSummary(Mean5)
 

;****************************************************************************


dir1="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig8/"

 Mean6 = asciiread(dir1+"T2m-Hist-Fut-ICs-CT-Mean-CS2.0-new.txt",-1,"float")

 Mean6!0         = "time"
 printVarSummary(Mean6)
 ;print(Mean6)

 Mean7 = asciiread(dir1+"T2m-Hist-Fut-ICs-CT-Mean-CS2.5-new.txt",-1,"float")
 Mean7!0         = "time"
 printVarSummary(Mean7)
 
 
 
 Mean8 = asciiread(dir1+"T2m-Hist-Fut-ICs-CT-Mean-CS3.15-new.txt",-1,"float")
 Mean8!0         = "time"
 printVarSummary(Mean8)
 

 Mean9 = asciiread(dir1+"T2m-Hist-Fut-ICs-CT-Mean-CS4.5-new.txt",-1,"float")
 Mean9!0         = "time"
 printVarSummary(Mean9)
 
 
 Mean10 = asciiread(dir1+"T2m-Hist-Fut-ICs-CT-Mean-CS5.3-new.txt",-1,"float")
 Mean10!0         = "time"
 printVarSummary(Mean10)
 
 
 
;***********************************PRECT HIST-MMM--WITHDFSUL  ICs STD********************************************

dir11="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig8/"

 Mean1s = asciiread(dir11+"PRECT-Hist-Fut-ICs-STD-DSUL-CS2.0.txt",-1,"float")

 Mean1s!0         = "time"
 printVarSummary(Mean1s)
 ;print(Mean1s)

 Mean2s = asciiread(dir11+"PRECT-Hist-Fut-ICs-STD-DSUL-CS2.5.txt",-1,"float")
 Mean2s!0         = "time"
 printVarSummary(Mean2s)
 
 
 
 Mean3s = asciiread(dir11+"PRECT-Hist-Fut-ICs-STD-Default-CS3.15.txt",-1,"float")
 Mean3s!0         = "time"
 printVarSummary(Mean3s)
 

 Mean4s = asciiread(dir11+"PRECT-Hist-Fut-ICs-STD-DSUL-CS4.5.txt",-1,"float")
 Mean4s!0         = "time"
 printVarSummary(Mean4s)
 
 
 Mean5s = asciiread(dir11+"PRECT-Hist-Fut-ICs-STD-DSUL-CS5.3.txt",-1,"float")
 Mean5s!0         = "time"
 printVarSummary(Mean5s)
 

;***********************************TEMP HIST-MMM-WITHDFSUL ICs STD********************************************
dir12="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig8/"

 Mean6s = asciiread(dir12+"T2m-Hist-Fut-ICs-STD-DSUL-CS2.0.txt",-1,"float")
 Mean6s!0         = "time"
 printVarSummary(Mean6s)
 ;print(Mean6s)

 Mean7s = asciiread(dir12+"T2m-Hist-Fut-ICs-STD-DSUL-CS2.5.txt",-1,"float")
 Mean7s!0         = "time"
 printVarSummary(Mean7s)
 
 
 
 Mean8s = asciiread(dir12+"T2m-Hist-Fut-ICs-STD-Default-CS3.15.txt",-1,"float")
 Mean8s!0         = "time"
 printVarSummary(Mean8s)
 

 Mean9s = asciiread(dir12+"T2m-Hist-Fut-ICs-STD-DSUL-CS4.5.txt",-1,"float")
 Mean9s!0         = "time"
 printVarSummary(Mean9s)
 
 
 Mean10s = asciiread(dir12+"T2m-Hist-Fut-ICs-STD-DSUL-CS5.3.txt",-1,"float")
 Mean10s!0         = "time"
 printVarSummary(Mean10s)
 
 

 
  
  
time11=ispan(1850,2025,1)
time1=ispan(1850,2100,1)



xa1    = new( (/504/), "float" )
ya1    = new( (/504/), "float" )

xa2    = new( (/504/), "float" )
ya2    = new( (/504/), "float" )

xa3    = new( (/504/), "float" )
ya3    = new( (/504/), "float" )

xa4    = new( (/504/), "float" )
ya4    = new( (/504/), "float" )

xa5    = new( (/504/), "float" )
ya5    = new( (/504/), "float" )



x01    = new( (/504/), "float" )
y01    = new( (/504/), "float" )

x02    = new( (/504/), "float" )
y02    = new( (/504/), "float" )

x03    = new( (/504/), "float" )
y03    = new( (/504/), "float" )

x04    = new( (/504/), "float" )
y04    = new( (/504/), "float" )

x05    = new( (/504/), "float" )
y05    = new( (/504/), "float" )


do k1=0,250
   ya1(k1)         = Mean1(k1)+Mean1s(k1)
   xa1(k1)         = time1(k1)
   xa1(2*251-1-k1)  = time1(k1)
   ya1(2*251-1-k1)  = Mean1(k1)-Mean1s(k1)
   
   ya2(k1)         = Mean2(k1)+Mean2s(k1)
   xa2(k1)         = time1(k1)
   xa2(2*251-1-k1)  = time1(k1)
   ya2(2*251-1-k1)  = Mean2(k1)-Mean2s(k1)
   
   ya3(k1)         = Mean3(k1)+Mean3s(k1)
   xa3(k1)         = time1(k1)
   xa3(2*251-1-k1)  = time1(k1)
   ya3(2*251-1-k1)  = Mean3(k1)-Mean3s(k1)
   
   ya4(k1)         = Mean4(k1)+Mean4s(k1)
   xa4(k1)         = time1(k1)
   xa4(2*251-1-k1)  = time1(k1)
   ya4(2*251-1-k1)  = Mean4(k1)-Mean4s(k1)
   
   ya5(k1)         = Mean5(k1)+Mean5s(k1)
   xa5(k1)         = time1(k1)
   xa5(2*251-1-k1)  = time1(k1)
   ya5(2*251-1-k1)  = Mean5(k1)-Mean5s(k1)
   
   
   
   y01(k1)         = Mean6(k1)+Mean6s(k1)
   x01(k1)         = time1(k1)
   x01(2*251-1-k1)  = time1(k1)
   y01(2*251-1-k1)  = Mean6(k1)-Mean6s(k1)
   
   y02(k1)         = Mean7(k1)+Mean7s(k1)
   x02(k1)         = time1(k1)
   x02(2*251-1-k1)  = time1(k1)
   y02(2*251-1-k1)  = Mean7(k1)-Mean7s(k1)
   
   
   y03(k1)         = Mean8(k1)+Mean8s(k1)
   x03(k1)         = time1(k1)
   x03(2*251-1-k1)  = time1(k1)
   y03(2*251-1-k1)  = Mean8(k1)-Mean8s(k1)
   
   
   y04(k1)         = Mean9(k1)+Mean9s(k1)
   x04(k1)         = time1(k1)
   x04(2*251-1-k1)  = time1(k1)
   y04(2*251-1-k1)  = Mean9(k1)-Mean9s(k1)
   
   
   y05(k1)         = Mean10(k1)+Mean10s(k1)
   x05(k1)         = time1(k1)
   x05(2*251-1-k1)  = time1(k1)
   y05(2*251-1-k1)  = Mean10(k1)-Mean10s(k1)

end do


;********************************************************************************

   wtype                = "pdf"
  ;wtype@wkPaperWidthF  = 10;42
  ;wtype@wkPaperHeightF = 9;48
   wtype@wkOrientation  = "landscape"
   wks = gsn_open_wks(wtype, "Fig8")
   plot = new(6,graphic)

;************************************************************************
pres1                     = True                   ; plot mods desired
pres1@gsnDraw             = False
pres1@gsnFrame            = False
pres1@vpWidthF         = 1.15      ; Change the aspect ratio, but
pres1@vpHeightF        = 0.62
pres1@txFont           = "times-bold"
pres1@tiMainFont      = "times-bold";

;pres1@trYMinF          = -0.05            ; Set min/max of left X axis
;pres1@trYMaxF          = 0.20
pres1@trXMinF          = 1850      ; Set min/max of left X axis
pres1@trXMaxF          = 2100
pres1@tmYRTickSpacingF= .5
pres1@tmYLMode        = "Manual"
pres1@tmXBTickStartF  =1850
pres1@tmXBTickEndF    = 2100
;pres1@tmXBTickSpacingF= 2
pres1@tmXBMinorPerMajor =4
pres1@tmYLMinorPerMajor = 4

pres1@tmXBMode       = "Manual";"Automatic"
pres1@tmXBMinorOn    = True
pres1@tmXBTickSpacingF = 10

pres1@tmXBMinorOn      = True
;pres1@tmYLTickSpacingF= 0.5
pres1@tmXBLabelAngleF = 45	

pres1@txFontHeightF = 0.020
pres1@tmXBLabelFont        = "Times-roman"
pres1@tiYAxisFont          = "Times-Bold"
pres1@tiXAxisFont          = "Times-Bold"
pres1@tmYLLabelFont        = "Times-roman"

pres1@tmYROn           = False
pres1@tmYLMinorOn      = True
pres1@tmXTOn           = False
pres1@tmXBLabelFontHeightF = 0.020
pres1@tmYLLabelFontHeightF = 0.020
pres1@tiXAxisFontHeightF = 0.022
pres1@tiYAxisFontHeightF = 0.022
pres1@xyMarkLineMode = "Lines"
;pres1@tiYAxisString          = "";"Relative to 1850-1900 (~S~o~N~C) " 
;pres1@tiXAxisString          = "";" Years "
;pres1@tmXBLabelAngleF= 30;90
pres1@tmYMajorGridLineColor = "LightGrey"
;;pres1@tmYMajorGrid                = True          ; implement y grid
pres1@tmYMajorGridThicknessF      = 1.0           ; 2.0 is default
pres1@tmYMajorGridLineDashPattern = 2             ; select short dash line
pres1@tmXMajorGridLineColor = "LightGrey"
;;pres1@tmXMajorGrid                = True          ; implement y grid
pres1@tmXMajorGridThicknessF      = 1.0           ; 2.0 is default
pres1@tmXMajorGridLineDashPattern = 2             ; select short dash line


pres1@gsnLeftStringOrthogonalPosF = 0.025
pres1@gsnLeftStringParallelPosF= 0.030
;;pres1@gsnXRefLine=2005
;;pres1@gsnXRefLineDashPattern = (/2/)
;;pres1@gsnXRefLineThicknessF=1.0

;pres1@gsnYRefLine=0
;pres1@gsnYRefLineDashPattern = (/2/)
pres1@gsnYRefLineThicknessF=1.0
pres1@tmXBMinorOn = True
pres1@gsnYRefLine=(/0.0, 1.5,2.0/)
pres1@gsnYRefLineColors =(/"Black", "skyblue", "skyblue"/)
pres1@gsnYRefLineDashPatterns = (/2,2,2/)




pres2                    =pres1     
pres2@tmYLMinorPerMajor = 4
pres2@trYMinF          = -0.05            
pres2@trYMaxF          = 0.20
pres2@tiYAxisString          = "Relative to 1850-1900 (mm day~S~-1~N~) "
pres2@tmYLTickSpacingF= 0.05
pres2@tiXAxisString          = "";" Years "

pres2@xyDashPattern = (/0/)
pres2@xyLineThicknessF=2
pres2@xyLineColor      = "Blue" 
 pres2@tiXAxisString = "Years"
plot1c = gsn_csm_xy(wks,time1,Mean1,pres2)

pres2@tmXBMinorOn = True
pres2@xyDashPattern = (/0/)
pres2@xyLineColor      = "orange"

;pres2@xyDashPattern = (/5/)
plot01c = gsn_csm_xy(wks,time1,Mean2,pres2)

         
pres2@xyDashPattern = (/0/)
pres2@xyLineColor      = "Green4"
plot2c = gsn_csm_xy(wks,time1,Mean3,pres2)


 pres2@tiXAxisString = "Years"
pres2@xyLineColor      = "Red"
plot3c = gsn_csm_xy(wks,time1,Mean4,pres2)

pres2@gsnLeftString="b) Global Mean Precipitation Change (mm day~S~-1~N~) "
;pres2@gsnLeftString="a) GMST Change (~S~o~N~C) MEM "
pres2@xyLineColor      = "Brown" 
plot4c = gsn_csm_xy(wks,time1,Mean5,pres2)


gsres01                   = True                        ; poly res
gsres01@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres01@gsFillColor       =  "Blue"                ; color chosen
gsres01@gsFillOpacityF = 0.15
dummy01 = gsn_add_polygon(wks,plot1c,xa1,ya1,gsres01)


gsres02                   = True                        ; poly res
gsres02@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres02@gsFillColor       =  "orange"                ; color chosen
gsres02@gsFillOpacityF = 0.15
dummy02 = gsn_add_polygon(wks,plot01c,xa2,ya2,gsres02)


gsres03                   = True                        ; poly res
gsres03@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres03@gsFillColor       =  "Green4"                ; color chosen
gsres03@gsFillOpacityF = 0.15
dummy03 = gsn_add_polygon(wks,plot2c,xa3,ya3,gsres03)


gsres04                   = True                        ; poly res
gsres04@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres04@gsFillColor       =  "Red"                ; color chosen
gsres04@gsFillOpacityF = 0.15
dummy04 = gsn_add_polygon(wks,plot3c,xa4,ya4,gsres04)


gsres05                   = True                        ; poly res
gsres05@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres05@gsFillColor       =  "Brown"                 ; color chosen
gsres05@gsFillOpacityF = 0.15
dummy05 = gsn_add_polygon(wks,plot4c,xa5,ya5,gsres05)


;********************************************************************************

pres3                    =pres1  

pres3@xyDashPattern = (/0/)
pres3@xyLineThicknessF=2
pres3@xyLineColor      = "Black" 
plot1obs = gsn_csm_xy(wks,time11,obs1,pres3)
plot2obs = gsn_csm_xy(wks,time11,obs1,pres3)
plot3obs = gsn_csm_xy(wks,time11,obs1,pres3)
plot4obs = gsn_csm_xy(wks,time11,obs1,pres3)
plot5obs = gsn_csm_xy(wks,time11,obs1,pres3)
plot6obs = gsn_csm_xy(wks,time11,obs1,pres3)
pres3@tiYAxisString          = "Relative to 1850-1900 (~S~o~N~C) " ;(~S~o~N~C)


pres3@tmYLTickSpacingF= 0.5
pres3@trYMinF          = -0.5           ; Set min/max of left X axis
pres3@trYMaxF          = 3.5  
pres3@tiYAxisString          = "Relative to 1850-1900 (~S~o~N~C) " ;(~S~o~N~C)
pres3@xyDashPattern = (/0/)
pres3@xyLineThicknessF= 2

pres3@xyLineColor      = "Blue" 
plot6c = gsn_csm_xy(wks,time1,Mean6,pres3)


pres3@xyDashPattern = (/0/)
pres3@xyLineColor      = "orange"

;pres3@xyDashPattern = (/2/)
plot7c = gsn_csm_xy(wks,time1,Mean7,pres3)


         
pres3@xyDashPattern = (/0/)
pres3@xyLineColor      = "Green4"
plot8c = gsn_csm_xy(wks,time1,Mean8,pres3)



pres3@xyLineColor      = "Red"
plot9c = gsn_csm_xy(wks,time1,Mean9,pres3)


pres3@gsnLeftString="a) Global Mean Surface Temperature Change (~S~o~N~C) "

pres3@xyLineColor      = "Brown" 
plot10c = gsn_csm_xy(wks,time1,Mean10,pres3)

gsres1                   = True                        ; poly res
gsres1@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres1@gsFillColor       =  "Blue"                ; color chosen
gsres1@gsFillOpacityF = 0.15
dummy1 = gsn_add_polygon(wks,plot6c,x01,y01,gsres1)


gsres2                   = True                        ; poly res
gsres2@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres2@gsFillColor       =  "orange"               ; color chosen
gsres2@gsFillOpacityF = 0.15
dummy2 = gsn_add_polygon(wks,plot7c,x02,y02,gsres2)


gsres3                   = True                        ; poly res
gsres3@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres3@gsFillColor       =  "Green4"              ; color chosen
gsres3@gsFillOpacityF = 0.15
dummy3 = gsn_add_polygon(wks,plot8c,x03,y03,gsres3)


gsres4                   = True                        ; poly res
gsres4@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres4@gsFillColor       =  "Red"               ; color chosen
gsres4@gsFillOpacityF = 0.15
dummy4 = gsn_add_polygon(wks,plot9c,x04,y04,gsres4)


gsres5                   = True                        ; poly res
gsres5@tfPolyDrawOrder   = "Predraw"                   ; draw this first
gsres5@gsFillColor       =  "Brown"             ; color chosen
gsres5@gsFillOpacityF = 0.15
dummy5 = gsn_add_polygon(wks,plot10c,x05,y05,gsres5)


 ;***************Bacgground colour*****************************************************************
  ;xptr  = (/xmin,xmax,xmax,xmin,xmin/)
  ;yptr  = (/ymin,ymin,ymax,ymax,ymin/)
 
   x = (/2021, 2040., 2040, 2021, 2021/)
   y = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres                        =  True
   pgres@gsFillColor            = "Lightgrey"      ;-- fill color
   pgres@gsFillOpacityF         =  0.3        ;-- set opacity of polygon
    pgres@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_1 = gsn_add_polygon(wks,plot6c, x, y, pgres)
                 
		 
   x1 = (/2041, 2060., 2060, 2041, 2041/)
   y1 = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres1                        =  True
   pgres1@gsFillColor            = "green4"      ;-- fill color
   pgres1@gsFillOpacityF         =  0.05         ;-- set opacity of polygon
    pgres1@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_2 = gsn_add_polygon(wks,plot6c, x1, y1, pgres1)
                 		 
   x2 = (/2081, 2100., 2100, 2081, 2081/)
   y2 = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres2                        =  True
   pgres2@gsFillColor            = "Lightpink"      ;-- fill color
   pgres2@gsFillOpacityF         =  0.3         ;-- set opacity of polygon
    pgres2@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_3 = gsn_add_polygon(wks,plot6c, x2, y2, pgres2)
                 		 
 
 
 ;***************Bacgground colour*****************************************************************
  ;xptr  = (/xmin,xmax,xmax,xmin,xmin/)
  ;yptr  = (/ymin,ymin,ymax,ymax,ymin/)
 
   x11 = (/2021, 2040., 2040, 2021, 2021/)
   y11 = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres111                        =  True
   pgres111@gsFillColor            = "Lightgrey"      ;-- fill color
   pgres111@gsFillOpacityF         =  0.3        ;-- set opacity of polygon
   pgres111@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_11 = gsn_add_polygon(wks,plot1c, x11, y11, pgres111)
                 
		 
   x12 = (/2041, 2060., 2060, 2041, 2041/)
   y12 = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres11                        =  True
   pgres11@gsFillColor            = "green4"      ;-- fill color
   pgres11@gsFillOpacityF         =  0.05         ;-- set opacity of polygon
   pgres11@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_12 = gsn_add_polygon(wks,plot1c, x12, y12, pgres11)
                 		 
   x23 = (/2081, 2100., 2100, 2081, 2081/)
   y23 = (/5.5, 5.5, -40, -40, 5.5/)
  
 ;-- polygon resources
   pgres12                        =  True
   pgres12@gsFillColor            = "Lightpink"      ;-- fill color
   pgres12@gsFillOpacityF         =  0.3         ;-- set opacity of polygon
   pgres12@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
   gon_13 = gsn_add_polygon(wks,plot1c, x23, y23, pgres12)
   
 

overlay(plot1c,plot2c)
overlay(plot1c,plot3c)
overlay(plot1c,plot4c)
overlay(plot1c,plot01c)
;overlay(plot1c,plot1obs)
plot(1)=plot1c

;overlay(plot1c,plot6c)
overlay(plot6c,plot7c)
overlay(plot6c,plot8c)
overlay(plot6c,plot9c)
overlay(plot6c,plot10c)
overlay(plot6c,plot2obs)
plot(0)=plot6c






lgres1                    = True
lgres1@lgItemType         = "Markers"     ; draw markers onl
lgres1@lgAutoManage = False
lgres1@lgLineColors  = (/"Brown","Red","Green4","orange","Blue","Black"/)
lgres1@pmLegendParallelPosF   = .2 
lgres1@lgLabelPosition	  = "Right"
lgres1@lgItemType         = "Lines"  
lgres1@lgLabelFontHeightF = .085           ; legend label font thickness
lgres1@lgLabelFont="Times-bold"   
lgres1@vpWidthF           = 0.30 ;0.18         ; width of legend (NDC)
lgres1@vpHeightF          = 0.20        ; height of legend (NDC)
lgres1@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
lgres1@lgPerimOn=False
lgres1@lgMonoLineThickness=False
lgres1@lgDashIndexes        = (/0,0,0,0,0,0/)
lgres1@lgLineThicknesses = (/4,4,4,4,4,4/)

labels1 =(/"   CS= 5.3, FA= -1.24      ", "   CS= 4.5, FA= -1.08    ", "   CS= 3.15, FA= -0.64    ","   CS= 2.5, FA= -0.40  ","   CS= 2.0, FA= -0.16   ", "  HadCRUT5    "/)


nitems1 = dimsizes(labels1)                 ; number of legend items

lbid1 = gsn_create_legend(wks,nitems1,labels1,lgres1)


 amres1                  = True
 amres1@amJust           = "TopRight"    ; Use bottom right corner of box
 amres1@amParallelPosF   = -0.175           ; Move legend to right
 amres1@amOrthogonalPosF = -0.48       

 annoid1 = gsn_add_annotation(plot6c,lbid1,amres1)  ; add legend to plot

lgres2                    = lgres1 
lgres2@lgLabelFontHeightF = .085           ; legend label font thickness
lgres2@lgLabelFont="Times-bold"   
lgres2@vpWidthF           = 0.30 ;0.18         ; width of legend (NDC)
lgres2@vpHeightF          = 0.20        ; height of legend (NDC)
lgres2@lgPerimThicknessF  = 1.5 
labels2 =(/"   CS= 5.3, FA= -1.24      ", "   CS= 4.5, FA= -1.08    ", "   CS= 3.15, FA= -0.64    ","   CS= 2.5, FA= -0.40  ","   CS= 2.0, FA= -0.16   "/)


nitems2 = dimsizes(labels2)                 ; number of legend items

lbid2 = gsn_create_legend(wks,nitems2,labels2,lgres2)


 amres2                  = True
 amres2@amJust           = "TopRight"    ; Use bottom right corner of box
 amres2@amParallelPosF   = -0.175           ; Move legend to right
 amres2@amOrthogonalPosF = -0.48       

 annoid2 = gsn_add_annotation(plot1c,lbid2,amres2)  ; add legend to plot





;************************************************************************************************
   resP                  = True
   resP@gsnFrame           = False                ; 
   resP@gsnMaximize      = True
   resP@gsnPanelXWhiteSpacePercent =2
   resP@gsnPanelYWhiteSpacePercent =2.1
   resP@gsnPanelBottom   = 0.028
    resP@gsnPanelFigureStringsPerimOn =False
    resP@amJust           = "TopRight" ;"BottomLeft"
    resP@gsnPanelFigureStringsFontHeightF=0.014
    resP@gsnPanelFigureStringsFontHeightF=0.0085
  gsn_panel(wks,(/plot/),(/2,1/),resP)


end


