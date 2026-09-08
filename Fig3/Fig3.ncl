;----------------------------------------------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;----------------------------------------------------------------------
; This is the main code
;----------------------------------------------------------------------
begin

dir="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig3/"

 obs1 = asciiread(dir+"HAD-CRUT2m-obs.txt",-1,"float")
 obs1!0         = "time"
 
 xavg1 = runave (obs1, 11, 0)
 
 ;print( xavg1)
 printVarSummary(obs1)
 
 
 Nobs1 = asciiread(dir+"NOAA-TEMP-Relative-1850-1900.txt",-1,"float")
 Nobs1!0         = "time"
 
 Nxavg1 = runave (Nobs1, 11, 0)

 printVarSummary(Nobs1)
 
  
 Bobs2 = asciiread(dir+"Berkeley-TEMP-Relative-1850-1900.txt",-1,"float")
 Bobs2!0         = "time"
 Bavg2 = runave (Bobs2, 11, 0)
 
 printVarSummary(Bobs2)
 
 ;******************************************************************************
  Mean1 = asciiread(dir+"GMST-Hist-2d-Relative-1850-1900.txt",-1,"float")
  Mean1 = Mean1(0:155)
  Mean1!0         = "time"
  printVarSummary(Mean1)
  ;print(Mean1)

  xavg2 = runave (Mean1, 11, 0)
 
  Mean2 = asciiread(dir+"GMST-Hist-1d-Relative-1850-1900.txt",-1,"float")
  Mean2!0         = "time"

  printVarSummary(Mean2)
  xavg3 = runave (Mean2, 11, 0)
 
  Mean3 = asciiread(dir+"CESM2-tas.txt",-1,"float")
  Mean3!0         = "time"
  xavg4 = runave (Mean3, 11, 0)
  printVarSummary(Mean3)
 

   ;********************************************************************************
   dir2="/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig3/"
  
    Mean01 = asciiread(dir2+"PRECT-Hist-2d-Relative-1901-1920.txt",-1,"float")

    Mean01!0         = "time"
    printVarSummary(Mean01)
    ;print(Mean01)
  xavg5 = runave ( Mean01, 11, 0)

    Mean02 = asciiread(dir2+"PRECT-Hist-1d-Relative-1901-1920.txt",-1,"float")
    Mean02!0         = "time"
    printVarSummary(Mean02)
   xavg6 = runave ( Mean02, 11, 0)
 
    Mean03 = asciiread(dir2+"CESM2-pr-Relative-1901-1920.txt",-1,"float")
    Mean03!0         = "time"
    printVarSummary(Mean03)
   xavg7 = runave ( Mean03, 11, 0)

 
 
   Mean04 = asciiread(dir2+"SMITH-PRECT-Relative-1901-1920.txt",-1,"float")
   Mean04!0         = "time"
   printVarSummary(Mean04)
  xavg8 = runave ( Mean04, 11, 0)
 

 time2=ispan(0,99,1)
 time11=ispan(1850,2005,1)
   time12=ispan(1900,2005,1)
 time1=ispan(1850,2100,1)


 ;********************************************************************************

    wtype                = "pdf"
   ;wtype@wkPaperWidthF  = 10;42
   ;wtype@wkPaperHeightF = 9;48
    wtype@wkOrientation  = "landscape"
    wks = gsn_open_wks(wtype, "Fig3")
    plot = new(6,graphic)

 ;************************************************************************
 pres1                     = True                   ; plot mods desired
 pres1@gsnDraw             = False
 pres1@gsnFrame            = False
 pres1@vpWidthF         = 1.15      ; Change the aspect ratio, but
 pres1@vpHeightF        = 0.62
 pres1@txFont           = "times-bold"
 pres1@tiMainFont      = "times-bold";
 pres1@trXMinF          = 1850      ; Set min/max of left X axis
 pres1@trXMaxF          = 2005
 pres1@tmXBTickStartF  =1850
 pres1@tmXBTickEndF    = 2005
 ;pres1@tmXBTickSpacingF= 2
 pres1@tmXBMode       = "Manual";"Automatic"
 pres1@tmXBMinorOn    = True
 pres1@tmXBTickSpacingF = 10
 pres1@tmXBMinorPerMajor =4
 pres1@tmYLMinorPerMajor = 3
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
 pres1@tiYAxisString          = "Relative to 1850-1900 (~S~o~N~C) " ;(~S~o~N~C)
 pres1@tiXAxisString          = "  "
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
 ;pres1@gsnXRefLine=2005
 pres1@gsnXRefLineDashPattern = (/2/)
 pres1@gsnXRefLineThicknessF=2.0

 pres1@gsnYRefLine=0
 pres1@gsnYRefLineDashPattern = (/2/)
 pres1@gsnYRefLineThicknessF=2.0




 pres2                    =pres1     
 pres2@tmYLTickSpacingF= 0.3
 pres2@trYMinF          = -1.0        ; Set min/max of left X axis
 pres2@trYMaxF          = 1.6

 pres2@xyDashPattern = (/0/)
 pres2@xyLineThicknessF=2.5
 pres2@xyLineColor      = "Black" 
 pres2@xyLineThicknessF=3
 plot1obs = gsn_csm_xy(wks,time11,xavg1,pres2)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot11obs = gsn_csm_xy(wks,time11,obs1,pres2)
 

 pres2@xyLineColor      = "Black" 
 pres2@xyLineThicknessF=3
 pres2@xyDashPattern = (/2/)
 pres2@xyLineOpacityF   = 1.0
 plot3obs = gsn_csm_xy(wks,time11, Bavg2 ,pres2)
 
 pres2@xyDashPattern = (/2/)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot11Bobs = gsn_csm_xy(wks,time11,Bobs2,pres2)

 
 
 pres2@xyLineColor      = "Gray49"
 pres2@xyDashPattern = (/0/)
 pres2@xyLineThicknessF=3
 pres2@xyLineOpacityF   = 1.0
 plot3Nobs = gsn_csm_xy(wks,time11,  Nxavg1 ,pres2)
 
 
 pres2@xyLineColor      = "Gray19"
 pres2@xyDashPattern = (/0/)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot11Nobs = gsn_csm_xy(wks,time11, Nobs1,pres2)





 pres2@xyDashPattern = (/0/)
 pres2@xyLineThicknessF=2.5
 pres2@xyLineColor      = "red"
 pres2@xyLineOpacityF   = 1.0
 pres2@xyLineThicknessF=3
 plot1c = gsn_csm_xy(wks,time11,xavg2,pres2)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot1c1 = gsn_csm_xy(wks,time11,Mean1,pres2)


 pres2@xyDashPattern = (/0/)
 pres2@xyLineColor      = "Brown" 
 pres2@xyLineOpacityF   = 1.0
 ;pres2@xyDashPattern = (/0/)
 pres2@xyLineThicknessF=3
 plot01c = gsn_csm_xy(wks,time11,xavg3,pres2)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot01c1 = gsn_csm_xy(wks,time11,Mean2,pres2)


 pres2@gsnLeftString="a) Global Mean Surface Temperature Change (~S~o~N~C) "     

 pres2@xyDashPattern = (/0/)
 ;pres2@xyLineThicknessF=3.0
 pres2@xyLineColor      = "Blue"
 pres2@xyLineThicknessF=3
 pres2@xyLineOpacityF   = 1.0
 plot2c = gsn_csm_xy(wks,time11,xavg4,pres2)
 pres2@xyLineThicknessF=1.5
 pres2@xyLineOpacityF   = 0.3
 plot2c1 = gsn_csm_xy(wks,time11,Mean3,pres2)

 overlay(plot1c,plot11Nobs)
 overlay(plot1c,plot11Bobs)
 overlay(plot1c,plot11obs)
 overlay(plot1c,plot2c1)
 overlay(plot1c,plot01c1)
 overlay(plot1c,plot1c1)

 overlay(plot1c,plot3Nobs)
 overlay(plot1c,plot3obs)
 overlay(plot1c,plot1obs)
 overlay(plot1c,plot2c)
 overlay(plot1c,plot01c)
 plot(0)=plot1c



 pres11                     = True                   ; plot mods desired
 pres11@gsnDraw             = False
 pres11@gsnFrame            = False
 pres11@vpWidthF         = 1.15      ; Change the aspect ratio, but
 pres11@vpHeightF        = 0.62
 pres11@txFont           = "times-bold"
 pres11@tiMainFont      = "times-bold";
 pres11@trYMinF          = -0.06         ; Set min/max of left X axis
 pres11@trYMaxF          = 0.09
 
 pres11@trXMinF          = 1900      ; Set min/max of left X axis
 pres11@trXMaxF          = 2005
 pres11@tmXBTickStartF  =1900
 pres11@tmXBTickEndF    = 2005

 pres11@tmXBMode       = "Manual";"Automatic"
 pres11@tmXBMinorOn    = True
 pres11@tmXBTickSpacingF = 10
 pres11@tmXBMinorPerMajor =4
 pres11@tmYLMinorPerMajor = 5

 pres11@tmXBLabelAngleF = 45	
 pres11@txFontHeightF = 0.020
 pres11@tmXBLabelFont        = "Times-roman"
 pres11@tiYAxisFont          = "Times-Bold"
 pres11@tiXAxisFont          = "Times-Bold"
 pres11@tmYLLabelFont        = "Times-roman"
 pres11@tmXBMinorOn      = True
 pres11@tmYROn           = False
 pres11@tmYLMinorOn      = True
 pres11@tmXTOn           = False
 pres11@tmXBLabelFontHeightF = 0.020
 pres11@tmYLLabelFontHeightF = 0.020
 pres11@tiXAxisFontHeightF = 0.022
 pres11@tiYAxisFontHeightF = 0.022
 pres11@xyMarkLineMode = "Lines"
 pres11@tiYAxisString          = "Relative to 1901-1920 (mm day~S~-1~N~)  " ;(~S~o~N~C)
 pres11@tiXAxisString          = " Years "
 ;pres11@tmXBLabelAngleF= 30;90
 pres11@tmYMajorGridLineColor = "LightGrey"
 ;;pres11@tmYMajorGrid                = True          ; implement y grid
 pres11@tmYMajorGridThicknessF      = 1.0           ; 2.0 is default
 pres11@tmYMajorGridLineDashPattern = 2             ; select short dash line
 pres11@tmXMajorGridLineColor = "LightGrey"
 ;;pres11@tmXMajorGrid                = True          ; implement y grid
 pres11@tmXMajorGridThicknessF      = 1.0           ; 2.0 is default
 pres11@tmXMajorGridLineDashPattern = 2             ; select short dash line


 pres11@gsnLeftStringOrthogonalPosF = 0.025
 pres11@gsnLeftStringParallelPosF= 0.030
 pres11@gsnXRefLine=2005
 pres11@gsnXRefLineDashPattern = (/2/)
 pres11@gsnXRefLineThicknessF=1.0

 pres11@xyLineThicknessF=3.5
 pres11@xyLineColor      = "Black" 

 pres11@gsnYRefLine=0
 pres11@gsnYRefLineDashPattern = (/2/)
 pres11@gsnYRefLineThicknessF=1.0
 pres11@xyDashPattern = (/0/)
 pres11@xyLineThicknessF=3
 pres11@xyLineOpacityF   = 1.0
 pres11@xyLineColor      ="Red"
 plot1p = gsn_csm_xy(wks,time12,xavg5,pres11)
 
 pres11@xyLineThicknessF=1.5
 pres11@xyLineOpacityF   = 0.3
 plot1p1 = gsn_csm_xy(wks,time12,Mean01,pres11)

 pres11@xyLineColor      = "Brown" 
 pres11@gsnLeftString="b) Global Mean Precipitation Change (mm day~S~-1~N~) "

 pres11@xyDashPattern = (/0/)
 pres11@xyLineOpacityF   = 1.0
 pres11@xyLineThicknessF=3
 plot01p = gsn_csm_xy(wks,time12,xavg6,pres11)
 pres11@xyLineThicknessF=1.5
 pres11@xyLineOpacityF   = 0.3
 plot01p1 = gsn_csm_xy(wks,time12,Mean02,pres11)

 pres11@xyLineColor      = "Blue" 
 pres11@xyDashPattern = (/0/)
 pres11@xyLineThicknessF=3
 pres11@xyLineOpacityF   = 1.0
 plot02p = gsn_csm_xy(wks,time12,xavg7,pres11)
 pres11@xyLineThicknessF=1.5
 pres11@xyLineOpacityF   = 0.3
 plot02p1 = gsn_csm_xy(wks,time12,Mean03,pres11)

 pres11@xyLineColor      = "Black" 
 pres11@xyDashPattern = (/0/)
 pres11@xyLineThicknessF=3
 pres11@xyLineOpacityF   = 1.0
 plot02p12 = gsn_csm_xy(wks,time12,xavg8,pres11)
 pres11@xyLineThicknessF=1.5
 pres11@xyLineOpacityF   = 0.3
 plot02p2 = gsn_csm_xy(wks,time12,Mean04,pres11)
 


 overlay(plot1p, plot02p12)
 overlay(plot1p,plot02p2)
 overlay(plot1p,plot01p1)
 overlay(plot1p,plot02p1)
 overlay(plot1p,plot1p1)

 overlay(plot1p,plot01p)
 overlay(plot1p,plot02p)
 plot(1)=plot1p




 lgres1                    = True
 lgres1@lgItemType         = "Markers"     ; draw markers onl
 lgres1@lgAutoManage = False
 lgres1@lgLineColors  = (/"red","Brown","Blue","Gray49","Black","Black"/)
 lgres1@pmLegendParallelPosF   = .2 
 lgres1@lgLabelPosition	  = "Right"
 lgres1@lgItemType         = "Lines"  
 lgres1@lgLabelFontHeightF = .074           ; legend label font thickness
 lgres1@lgLabelFont="Times-bold"   
 lgres1@vpWidthF           = 0.28 ;0.18         ; width of legend (NDC)
 lgres1@vpHeightF          = 0.20       ; height of legend (NDC)
 lgres1@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
 lgres1@lgPerimOn=False
 lgres1@lgMonoLineThickness=False
 lgres1@lgDashIndexes        = (/0,0,0,0,2,0/)
 lgres1@lgLineThicknesses = (/4,4,4,4,4,4/)


 labels1 =(/"  CESM1 (2~S~o~N~)  ","  CESM1 (1~S~o~N~)    ","  CESM2 (1~S~o~N~)    ","  NOAA    ","  Berkeley   ","  HadCRUT5   "/)
 
 nitems1 = dimsizes(labels1)                 ; number of legend items

 lbid1 = gsn_create_legend(wks,nitems1,labels1,lgres1)


  amres1                  = True
  amres1@amJust           = "TopRight"    ; Use bottom right corner of box
  amres1@amParallelPosF   = -0.175           ; Move legend to right
  amres1@amOrthogonalPosF = -0.48       

  annoid1 = gsn_add_annotation(plot1c,lbid1,amres1)  ; add legend to plot
 lgres2                    = True
 lgres2@lgItemType         = "Markers"     ; draw markers onl
 lgres2@lgAutoManage = False
 lgres2@lgLineColors  =  (/"red","Brown","Blue","Black"/)
 lgres2@pmLegendParallelPosF   = .2 
 lgres2@lgLabelPosition	  = "Right"
 lgres2@lgItemType         = "Lines"  
 lgres2@lgLabelFontHeightF = .088           ; legend label font thickness
 lgres2@lgLabelFont="Times-bold"   
 lgres2@vpWidthF           = 0.28 ;0.18         ; width of legend (NDC)
 lgres2@vpHeightF          = 0.16       ; height of legend (NDC)
 lgres2@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
 lgres2@lgPerimOn=False
 lgres2@lgMonoLineThickness=False
 lgres2@lgDashIndexes        = (/0,0,0,0/)
 lgres2@lgLineThicknesses = (/5.,5.,5,5/)
 labels2 =(/"  CESM1 (2~S~o~N~)    ","  CESM1 (1~S~o~N~)  ","  CESM2 (1~S~o~N~)    ","  Smith et al. (2012)   "/)



 nitems2 = dimsizes(labels2)                 ; number of legend items

 lbid2 = gsn_create_legend(wks,nitems2,labels2,lgres2)

  amres2                  = True
  amres2@amJust           = "TopRight"    ; Use bottom right corner of box
  amres2@amParallelPosF   = -0.175           ; Move legend to right
  amres2@amOrthogonalPosF = -0.48        

 annoid2 = gsn_add_annotation(plot1p,lbid2,amres2)  ; add legend to plot

 ;************************************************************************************************
    resP                  = True
    resP@gsnFrame           = False                ; 
    resP@gsnMaximize      = True
    resP@gsnPanelXWhiteSpacePercent =1
    resP@gsnPanelYWhiteSpacePercent =0.1
   resP@gsnPanelBottom   = 0.02
     resP@gsnPanelFigureStringsPerimOn =False
     resP@amJust           = "TopRight" ;"BottomLeft"
     resP@gsnPanelFigureStringsFontHeightF=0.014
     resP@gsnPanelFigureStringsFontHeightF=0.0085
   gsn_panel(wks,(/plot/),(/2,1/),resP)



 
 end