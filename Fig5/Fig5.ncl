;----------------------------------------------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;----------------------------------------------------------------------
; This is the main code
;----------------------------------------------------------------------
begin

dir="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig5/"

;*****************************************************************************
 Mean1 = asciiread(dir+"CESM2.txt",-1,"float")

 Mean1!0         = "time"
 printVarSummary(Mean1)

 Mean2 = asciiread(dir+"CESM1-CS5.3.txt",-1,"float")
 Mean2!0         = "time"
 printVarSummary(Mean2)
 
 
 
 Mean3 = asciiread(dir+"CESM1.3.15Without.txt",-1,"float")
 Mean3!0         = "time"
 printVarSummary(Mean3)
 
 
time2=ispan(0,99,1)
time11=ispan(1850,2025,1)
time1=ispan(1850,2100,1)
;********************************************************************************

   wtype                = "pdf"
  ;wtype@wkPaperWidthF  = 10;42
  ;wtype@wkPaperHeightF = 9;48
   wtype@wkOrientation  = "landscape"
   wks = gsn_open_wks(wtype, "Fig5")
   plot = new(6,graphic)

;************************************************************************
pres1                     = True                   ; plot mods desired
pres1@gsnDraw             = False
pres1@gsnFrame            = False
pres1@vpWidthF         = 1.15      ; Change the aspect ratio, but
pres1@vpHeightF        = 0.62
pres1@txFont           = "times-bold"
pres1@tiMainFont      = "times-bold";
pres1@trYMinF          = -0.5           ; Set min/max of left X axis
pres1@trYMaxF          = 3.5
pres1@trXMinF          = 0;1850      ; Set min/max of left X axis
pres1@trXMaxF          = 100;2100

pres1@tmXBMode        = "Manual"
pres1@tmXBTickStartF  = 0
pres1@tmXBTickEndF    = 100
pres1@tmXBTickSpacingF= 5.
pres1@tmXBMinorPerMajor =4
pres1@tmYLMinorPerMajor = 4
pres1@tmXBLabelAngleF = 45	
pres1@txFontHeightF = 0.020
pres1@tmXBLabelFont        = "Times-roman"
pres1@tiYAxisFont          = "Times-Bold"
pres1@tiXAxisFont          = "Times-Bold"
pres1@tmYLLabelFont        = "Times-roman"
pres1@tmXBMinorOn      = True
pres1@tmYROn           = False
pres1@tmYLMinorOn      = True
pres1@tmXTOn           = False
pres1@tmXBLabelFontHeightF = 0.020
pres1@tmYLLabelFontHeightF = 0.020
pres1@tiXAxisFontHeightF = 0.022
pres1@tiYAxisFontHeightF = 0.022
pres1@xyMarkLineMode = "Lines"
pres1@tiYAxisString          = "Relative to piControl Run (~S~o~N~C) " ;(~S~o~N~C)
pres1@tiXAxisString          = " Years "
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
pres1@gsnXRefLine=2005
pres1@gsnXRefLineDashPattern = (/2/)
pres1@gsnXRefLineThicknessF=2.0

;pres1@gsnYRefLine=0
;pres1@gsnYRefLineDashPattern = (/2/)
pres1@gsnYRefLineThicknessF=2.0

pres1@gsnYRefLine=(/0.0, 1.5,2.0/)
pres1@gsnYRefLineColors =(/"Black", "skyblue", "skyblue"/)
pres1@gsnYRefLineDashPatterns = (/2,2,2/)




pres2                    =pres1     


pres2@xyDashPattern = (/0/)
pres2@xyLineThicknessF=2

pres2@tmYLMode        = "Manual"
pres2@tmYLTickSpacingF= 0.5

pres2@xyDashPattern = (/0/)
pres2@xyLineThicknessF=2
pres2@xyLineColor      = "Blue" 
plot1c = gsn_csm_xy(wks,time2,Mean1,pres2)


pres2@xyDashPattern = (/0/)
pres2@xyLineColor      = "Red"
plot01c = gsn_csm_xy(wks,time2,Mean2,pres2)

         
pres2@xyDashPattern = (/0/)
pres2@xyLineColor      = "Green4"
plot2c = gsn_csm_xy(wks,time2,Mean3,pres2)



overlay(plot1c,plot2c)
overlay(plot1c,plot01c)
plot(0)=plot1c



lgres1                    = True
lgres1@lgItemType         = "Markers"     ; draw markers onl
lgres1@lgAutoManage = False
lgres1@lgLineColors  = (/"Green4","red","Blue"/)
lgres1@pmLegendParallelPosF   = .2 
lgres1@lgLabelPosition	  = "Right"
lgres1@lgItemType         = "Lines"  
lgres1@lgLabelFontHeightF = .098           ; legend label font thickness
lgres1@lgLabelFont="Times-bold"   
lgres1@vpWidthF           = 0.30 ;0.18         ; width of legend (NDC)
lgres1@vpHeightF          = 0.18        ; height of legend (NDC)
lgres1@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
lgres1@lgPerimOn=False
lgres1@lgMonoLineThickness=False
lgres1@lgDashIndexes        = (/0,0,0,0,0,0/)
lgres1@lgLineThicknesses = (/4,4,4,4,4,4/)


labels1 =(/"  CESM1-CS= 3.15  ","  CESM1-CS= 5.3    ","  CESM2   "/)


nitems1 = dimsizes(labels1)                 ; number of legend items

lbid1 = gsn_create_legend(wks,nitems1,labels1,lgres1)


 amres1                  = True
 amres1@amJust           = "TopRight"    ; Use bottom right corner of box
 amres1@amParallelPosF   = -0.175           ; Move legend to right
 amres1@amOrthogonalPosF = -0.48       

 annoid1 = gsn_add_annotation(plot1c,lbid1,amres1)  ; add legend to plot


;************************************************************************************************
   resP                  = True
   resP@gsnFrame           = False                ; 
   resP@gsnMaximize      = True
   resP@gsnPanelXWhiteSpacePercent =1
   resP@gsnPanelYWhiteSpacePercent =0.1
    resP@gsnPanelFigureStringsPerimOn =False
    resP@amJust           = "TopRight" ;"BottomLeft"
    resP@gsnPanelFigureStringsFontHeightF=0.014
    resP@gsnPanelFigureStringsFontHeightF=0.0085
  gsn_panel(wks,(/plot/),(/1,1/),resP)


end


