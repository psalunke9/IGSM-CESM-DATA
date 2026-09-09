;----------------------------------------------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;----------------------------------------------------------------------
; This is the main code
;----------------------------------------------------------------------
begin

;********************************************************************************
 Mean1 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/HAD-CRUT2m-obs-New.txt",20,"float")

 Mean1!0         = "time"
 printVarSummary(Mean1)
 ;print(Mean1)
 
 BMean1 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/Berkeley-New.txt",20,"float")

 BMean1!0         = "time"
 printVarSummary(BMean1)
 
 
 NMean1 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/NOAA-TEMP-Relative-1986-2005.txt",20,"float")

 NMean1!0         = "time"
 printVarSummary(NMean1)



 Mean2 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/T2m-Hist-CESM2-1d.txt",20,"float")
 Mean2!0         = "time"
 printVarSummary(Mean2)

 
 
 Mean3 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/T2m-Hist-1d.txt",20,"float")
 Mean3!0         = "time"
 printVarSummary(Mean3)
 
 Mean4 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/T2m-Hist-2d.txt",20,"float")
 Mean4!0         = "time"
 printVarSummary(Mean4)

 


;********************************************************************************
 Mean11 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/GPCP-ann.txt",20,"float")

 Mean11!0         = "time"
 printVarSummary(Mean11)
 ;print(Mean11)

 BMean11 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/Smith-ann-data.txt",20,"float")

 BMean11!0         = "time"



 Mean22 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/CESM2-PRECT-Hist-1d.txt",20,"float")
 Mean22!0         = "time"
 printVarSummary(Mean22)
 
 
 
 Mean33 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/PRECT-Hist-1d.txt",20,"float")
 Mean33!0         = "time"
 printVarSummary(Mean33)
 
 Mean44 = asciiread("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS1/PRECT-Hist-2d.txt",20,"float")
 Mean44!0         = "time"
 printVarSummary(Mean44)
 
 

time2=ispan(1986,2014,1)
time1=ispan(1986,2005,1)


;********************************************************************************

   wtype                = "pdf"
  ;wtype@wkPaperWidthF  = 10;42
  ;wtype@wkPaperHeightF = 9;48
   wtype@wkOrientation  = "landscape"
   wks = gsn_open_wks(wtype, "FigS1")
   plot = new(2,graphic)

;************************************************************************
pres1                     = True                   ; plot mods desired
pres1@gsnDraw             = False
pres1@gsnFrame            = False
pres1@vpWidthF         = 1.15      ; Change the aspect ratio, but
pres1@vpHeightF        = 0.62
pres1@txFont           = "times-bold"
pres1@tiMainFont      = "times-bold";
pres1@trYMinF          = -0.6         ; Set min/max of left X axis
pres1@trYMaxF          = 0.64

pres1@tmYRTickSpacingF= .1
 
pres1@trXMinF          = 1986      ; Set min/max of left X axis
pres1@trXMaxF          = 2006

pres1@tmXBTickStartF  = 1986
pres1@tmXBTickEndF    = 2006
pres1@tmXBMode       = "Manual";"Automatic"
pres1@tmXBMinorOn    = True
pres1@tmXBTickSpacingF = 4
pres1@tmXBMinorPerMajor =3
pres1@tmYLMinorPerMajor = 5


pres1@tmXBLabelAngleF = 45	

pres1@txFontHeightF = 0.024
pres1@tmXBLabelFont        = "Times-roman"
pres1@tiYAxisFont          = "Times-Bold"
pres1@tiXAxisFont          = "Times-Bold"
pres1@tmYLLabelFont        = "Times-roman"
pres1@tmXBMinorOn      = True
pres1@tmYROn           = False
pres1@tmYLMinorOn      = True
pres1@tmXTOn           = False
pres1@tmXBLabelFontHeightF = 0.022
pres1@tmYLLabelFontHeightF = 0.022
pres1@tiXAxisFontHeightF = 0.024
pres1@tiYAxisFontHeightF = 0.024
pres1@xyMarkLineMode = "Lines"
pres1@tiYAxisString          = "Relative to 1986-2005 (~S~o~N~C) " ;(~S~o~N~C)
pres1@tiXAxisString          = " "
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

pres1@gsnYRefLine=0
pres1@gsnYRefLineDashPattern = (/0/)
pres1@gsnYRefLineThicknessF=2.0

pres1@xyLineThicknessF=4.0
pres1@xyLineColor      = "Black"
plot1c = gsn_csm_xy(wks,time1,Mean1,pres1)

pres1@xyDashPattern = (/2/)
pres1@xyLineThicknessF=4.0
;pres1@xyLineColor      = "Grey40"
plot1bc = gsn_csm_xy(wks,time1,BMean1,pres1)


pres1@xyDashPattern = (/0/)
pres1@xyLineThicknessF=4.0
pres1@xyLineColor      = "Grey49"
plot1Nc = gsn_csm_xy(wks,time1,NMean1,pres1)





pres1@xyLineColor      = "Blue"

;pres1@xyDashPattern = (/2/)
plot01c = gsn_csm_xy(wks,time1,Mean2,pres1)


pres1@xyLineColor      = "Brown" 
plot2c = gsn_csm_xy(wks,time1,Mean3,pres1)

pres1@xyLineColor      = "Red" 
pres1@gsnLeftString="a) Global Mean Surface Temperature Change (~S~o~N~C) "

plot3c = gsn_csm_xy(wks,time1,Mean4,pres1)



               		 
		 	
overlay(plot1c,plot1Nc)
overlay(plot1c,plot1bc)
overlay(plot1c,plot01c)
overlay(plot1c,plot2c)
overlay(plot1c,plot3c)


plot(0)=plot1c


pres11                     = True                   ; plot mods desired
pres11@gsnDraw             = False
pres11@gsnFrame            = False
pres11@vpWidthF         = 1.15      ; Change the aspect ratio, but
pres11@vpHeightF        = 0.62
pres11@txFont           = "times-bold"
pres11@tiMainFont      = "times-bold";
pres11@trYMinF          = -0.12        ; Set min/max of left X axis
pres11@trYMaxF          = 0.12
pres11@tmYRTickSpacingF= .05
pres11@tmYRMode        = "Manual"
pres11@trXMinF          = 1986      ; Set min/max of left X axis
pres11@trXMaxF          = 2006

pres11@tmXBTickStartF  =1986
pres11@tmXBTickEndF    = 2006
pres11@tmXBMode       = "Manual";"Automatic"
pres11@tmXBMinorOn    = True
pres11@tmXBTickSpacingF =4

pres11@tmXBMinorPerMajor =3
pres11@tmYLMinorPerMajor = 3

;pres11@tmXBMode        = "Manual"
;pres11@tmXBTickStartF  = 0
;pres11@tmXBTickEndF    = 99

pres11@tmXBLabelAngleF = 45	
;pres11@tmXBMode        = "Explicit"
;pres11@tmXBValues      = (/1986,1990,1995,2000,2005/)
;pres11@tmXBLabels      = (/"1986","1990","1995","2000","2005"/)

pres11@txFontHeightF = 0.024
pres11@tmXBLabelFont        = "Times-roman"
pres11@tiYAxisFont          = "Times-Bold"
pres11@tiXAxisFont          = "Times-Bold"
pres11@tmYLLabelFont        = "Times-roman"
pres11@tmXBMinorOn      = True
pres11@tmYROn           = False
pres11@tmYLMinorOn      = True
pres11@tmXTOn           = False
pres11@tmXBLabelFontHeightF = 0.022
pres11@tmYLLabelFontHeightF = 0.022
pres11@tiXAxisFontHeightF = 0.024
pres11@tiYAxisFontHeightF = 0.024
pres11@xyMarkLineMode = "Lines"
pres11@tiYAxisString          = "Relative to 1986-2005 (mm day~S~-1~N~) " ;(~S~o~N~C)
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
;pres11@gsnXRefLine=2005
;pres11@gsnXRefLineDashPattern = (/2/)
;pres11@gsnXRefLineThicknessF=3.0

pres11@gsnYRefLine=0
pres11@gsnYRefLineDashPattern = (/0/)
pres11@gsnYRefLineThicknessF=2.0

pres11@xyLineThicknessF=4.0
pres11@xyLineColor      = "Black"
plot11c = gsn_csm_xy(wks,time1,Mean11,pres11)

pres11@xyLineThicknessF=4.0
pres11@xyLineColor      = "Grey40"
plot11sc = gsn_csm_xy(wks,time1,BMean11,pres11)



pres11@xyLineColor      = "Blue"

;pres11@xyDashPattern = (/2/)
plot011c = gsn_csm_xy(wks,time1,Mean22,pres11)


pres11@xyLineColor      = "Brown" 
plot22c = gsn_csm_xy(wks,time1,Mean33,pres11)

pres11@xyLineColor      = "Red" 
pres11@gsnLeftString="b) Global Mean Precipitation Change (mm day~S~-1~N~) "

plot33c = gsn_csm_xy(wks,time1,Mean44,pres11)



;****************************************************************

overlay(plot11c,plot11sc)
overlay(plot11c,plot011c)
overlay(plot11c,plot22c)
overlay(plot11c,plot33c)


plot(1)=plot11c

;****************************************************************


lgres1                    = True
lgres1@lgItemType         = "Markers"     ; draw markers onl
lgres1@lgAutoManage = False
lgres1@lgLineColors  = (/"Red","Brown","Blue","Grey40","Black","Black"/)
lgres1@pmLegendParallelPosF   = .2 
lgres1@lgLabelPosition	  = "Right"
lgres1@lgItemType         = "Lines"  
lgres1@lgLabelFontHeightF = .060           ; legend label font thickness
lgres1@lgLabelFont="Times-bold"   
lgres1@vpWidthF           = 0.33 ;0.18         ; width of legend (NDC)
lgres1@vpHeightF          = 0.23        ; height of legend (NDC)
lgres1@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
lgres1@lgPerimOn=False
lgres1@lgMonoLineThickness=False
lgres1@lgDashIndexes        = (/0,0,0,0,2,0/)
lgres1@lgLineThicknesses = (/5,5.,5.,5.,5.,5/)
labels1 =(/"  CESM1 (2~S~o~N~)   " ,"  CESM1 (1~S~o~N~)  ","  CESM2 (1~S~o~N~)   ","  NOAA    ","  Berkeley    ","  HadCRUT5 "/)



nitems1 = dimsizes(labels1)                 ; number of legend items
lbid1 = gsn_create_legend(wks,nitems1,labels1,lgres1)


 amres1                  = True
 amres1@amJust           = "TopRight"    ; Use bottom right corner of box
 amres1@amParallelPosF   = -0.12           ; Move legend to right
 amres1@amOrthogonalPosF = -0.48       

 annoid1 = gsn_add_annotation(plot1c,lbid1,amres1)  ; add legend to plot

;************************************************************************************************


lgres11                    = True
lgres11@lgItemType         = "Markers"     ; draw markers onl
lgres11@lgAutoManage = False
lgres11@lgLineColors  = (/"Red","Brown","Blue","Grey40","Black"/)
lgres11@pmLegendParallelPosF   = .2 
lgres11@lgLabelPosition	  = "Right"
lgres11@lgItemType         = "Lines"  
lgres11@lgLabelFontHeightF = .060           ; legend label font thickness
lgres11@lgLabelFont="Times-bold"   
lgres11@vpWidthF           = 0.33 ;0.18         ; width of legend (NDC)
lgres11@vpHeightF          = 0.22        ; height of legend (NDC)
lgres11@lgPerimThicknessF  = 1.5           ; thicken the box perimeter
lgres11@lgPerimOn=False
lgres11@lgMonoLineThickness=False
lgres11@lgDashIndexes        = (/0,0,0,0,0/)
lgres11@lgLineThicknesses = (/5,5.,5.,5.,5./)
labels11 =(/"  CESM1 (2~S~o~N~)   " ,"  CESM1 (1~S~o~N~)  ","  CESM2 (1~S~o~N~)   ","  Smith et. al. (2012)   ","  GPCP "/)



nitems11 = dimsizes(labels11)                 ; number of legend items
lbid11 = gsn_create_legend(wks,nitems11,labels11,lgres11)


 amres11                  = True
 amres11@amJust           = "TopRight"    ; Use bottom right corner of box
 amres11@amParallelPosF   = -0.12           ; Move legend to right
 amres11@amOrthogonalPosF = -0.48       

 annoid11 = gsn_add_annotation(plot11c,lbid11,amres11)  ; add legend to plot
;************************************************************************************************
    resP                  = True
   resP@gsnFrame           = False                  ; don't advance frame
   resP@gsnMaximize      = True

   resP@gsnPanelXWhiteSpacePercent =4
   resP@gsnPanelYWhiteSpacePercent =2
  ; pres@gsnPanelCenter = True
  ;resP@gsnPanelBottom   = 0.02
  ; pres@gsnPanelRight    = 0.95
  ; resP@gsnPanelRowSpec    = True
    resP@gsnPanelFigureStringsPerimOn =False
    resP@amJust           = "TopRight" ;"BottomLeft"
    resP@gsnPanelFigureStringsFontHeightF=0.014
   ; resP@gsnPanelFigureStrings = (/"","","~F26~ IMD (Obs.)","~F26~MMM (CMIP5)","~F26~MMM (NEX-GDDP)","~F26~MMM (CORDEX)","~F26~ IMD (Obs.)","~F26~MMM (CMIP5)","~F26~MMM (NEX-GDDP)","~F26~MMM (CORDEX)"/)
    resP@gsnPanelFigureStringsFontHeightF=0.0085
  gsn_panel(wks,(/plot/),(/2,1/),resP)


end


