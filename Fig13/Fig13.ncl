;************************************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;************************************************************************

begin

    fout1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS2.0-0.1DSULF-Diff-FAdjusted.nc", "r")
    MOC1_26N = fout1->moc_dif 
    
    fout2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS2.5-0.5DSULF-Diff-FAdjusted.nc", "r")
    MOC2_26N = fout2->moc_dif 
    
    fout3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS3.15-Default-Diff.nc", "r")
    MOC3_26N = fout3->moc_dif


    fout4 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS4.5-2.25DSULF-Diff-FAdjusted.nc", "r")
    MOC4_26N = fout4->moc_dif 
    
    fout5 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS5.3-2.5DSULF-Diff-FAdjusted.nc", "r")
    MOC5_26N  = fout5->moc_dif
    
    
;***********************Unadjusted *******************************************


    fou1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS2.0-0.1DSULF-Diff-UnAdjusted.nc", "r")
    MOC11_26N = fou1->moc_dif 
    
    fou2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS2.5-0.5DSULF-Diff-UnAdjusted.nc", "r")
    MOC22_26N = fou2->moc_dif
    
    fou3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS3.15-Default-Diff1.nc", "r")
    MOC33_26N = fou3->moc_dif  


    fou4 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS4.5-2.25DSULF-Diff-UnAdjusted.nc", "r")
    MOC44_26N= fou4->moc_dif  
    
    fou5 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/MOC-26N-Ensmean-CS5.3-2.5DSULF-Diff-UnAdjusted.nc", "r")
    MOC55_26N = fou5->moc_dif 
    

  ;********************Observation***********************************************
  f66 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig13/moc_transports-YM.nc", "r")
  Obs1     = f66->moc_mar_hc10   

  ;************************************************************************
  
  time1 = ispan(1850, 2100, 1)
  time2 = ispan(2004, 2023, 1)
  ;************************************************************************
  
  wtype                = "pdf"
  wtype@wkOrientation  = "landscape"
  wks = gsn_open_wks(wtype, "Fig13")
  plot = new(2,graphic)
;**************************************************************************

  pres1               = True
  pres1@gsnDraw       = False
  pres1@gsnFrame      = False
  pres1@trYMinF          =12           ; Set min/max of left X axis
  pres1@trYMaxF          = 22
  pres1@vpWidthF         = 1.15       ; Change the aspect ratio, but
  pres1@vpHeightF        = 0.62
  pres1@xyLineThicknessF = 2.0
  pres1@txFont           = "Times-Bold"
  pres1@tiMainFont      = "Times-Bold"
  pres1@tiYAxisString = "AMOC Strength (Sv)"
  pres1@trXMinF       = 1850
  pres1@trXMaxF       = 2100
  pres1@tmYRTickSpacingF= .5
  pres1@tmXBTickStartF  =1850
  pres1@tmXBTickEndF    = 2100
  ;pres1@tmXBTickSpacingF= 2
  pres1@tmXBMode       = "Manual";"Automatic"
  pres1@tmXBMinorOn    = True
  pres1@tmXBTickSpacingF = 10
  pres1@tmXBMinorPerMajor =4
 ;pres1@tmYLMinorPerMajor = 5
  pres1@tmXBLabelAngleF = 45
  pres1@txFontHeightF = 0.018
  pres1@tmXBLabelFont        = "Times-roman"
  pres1@tiYAxisFont          = "Times-Bold"
  pres1@tiXAxisFont          = "Times-Bold"
  pres1@tmYLLabelFont        = "Times-roman"
  pres1@tmXBMinorOn      = True
  pres1@tmYROn           = False
  pres1@tmYLMinorOn      = True
  pres1@tmXTOn           = False
  pres1@tmXBLabelFontHeightF = 0.016
  pres1@tmYLLabelFontHeightF = 0.016
  pres1@tiXAxisFontHeightF = 0.020
  pres1@tiYAxisFontHeightF = 0.020
  pres1@tmYMajorGridLineColor = "LightGrey"
  pres1@tmYMajorGrid                = True          ; implement y grid
  pres1@tmYMajorGridThicknessF      = 1.0           ; 2.0 is default
  pres1@tmYMajorGridLineDashPattern = 2             ; select short dash line
  pres1@tmXMajorGridLineColor = "LightGrey"
  pres1@tmXMajorGrid                = True          ; implement y grid
  pres1@tmXMajorGridThicknessF      = 1.0           ; 2.0 is default
  pres1@tmXMajorGridLineDashPattern = 2             ; select short dash line
  pres1@gsnLeftStringFontHeightF = 0.020
  pres1@gsnLeftStringOrthogonalPosF = 0.025
  pres1@gsnLeftStringParallelPosF= 0.030
  pres1@xyLineThicknessF=2.0
 
  
  pres11=pres1 
  pres11@xyLineColor      = "Blue"
  plot1 = gsn_csm_xy(wks, time1, MOC1_26N, pres11)
 
  pres11@tiXAxisString = ""
  pres11@xyLineColor      = "Orange"
  plot2 = gsn_csm_xy(wks, time1, MOC2_26N, pres11)
  
  pres11@xyLineColor      = "Green4"
  plot3 = gsn_csm_xy(wks, time1, MOC3_26N, pres11)
  
  pres11@xyLineColor      = "Red"
  plot4 = gsn_csm_xy(wks, time1, MOC4_26N, pres11)
  
  pres11@xyLineColor      = "Brown"
  plot5 = gsn_csm_xy(wks, time1, MOC5_26N, pres11)
  
  pres11@gsnLeftString = "a) Atlantic MOC at 26N (Adjusted aerosol)"
  pres11@xyLineColor      = "Black"
  pres11@txFont           = "Times-Bold"
  plot6 = gsn_csm_xy(wks, time2,  Obs1 , pres11)
  
  
  pres2=pres1
  pres2@tiXAxisString = "Years"
  pres2@xyLineColor      = "Blue"
  plot11 = gsn_csm_xy(wks, time1, MOC11_26N, pres2)
   
  pres2@xyLineColor      = "Orange"
  plot22 = gsn_csm_xy(wks, time1, MOC22_26N, pres2)
    
  pres2@xyLineColor      = "Green4"
  plot33 = gsn_csm_xy(wks, time1, MOC33_26N, pres2)
  
  pres2@xyLineColor      = "Red"
  plot44 = gsn_csm_xy(wks, time1, MOC44_26N, pres2)

  pres2@xyLineColor      = "Brown"
  plot55 = gsn_csm_xy(wks, time1, MOC55_26N, pres2)
    
  pres2@gsnLeftString = "b) Atlantic MOC at 26N (Unadjusted aerosol)"
  pres2@xyLineColor      = "Black"
  pres2@txFont           = "Times-Bold"
  plot66 = gsn_csm_xy(wks, time2,  Obs1 , pres2)
   
   
  ; ***************Bacgground colour****************************************
 
     x = (/2021, 2040., 2040, 2021, 2021/)
     y = (/27.5, 27.5, -40, -40, 27.5/)
 
     pgres                        =  True
     pgres@gsFillColor            = "Lightgrey"      ;-- fill color
     pgres@gsFillOpacityF         =  0.3       ;-- set opacity of polygon
     pgres@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_1 = gsn_add_polygon(wks,plot1, x, y, pgres)
                 	 
     x1 = (/2041, 2060., 2060, 2041, 2041/)
     y1 = (/27.5, 27.5, -40, -40, 27.5/)
  
     pgres1                        =  True
     pgres1@gsFillColor            = "green4"      ;-- fill color
     pgres1@gsFillOpacityF         =  0.05         ;-- set opacity of polygon
     pgres1@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_2 = gsn_add_polygon(wks,plot1, x1, y1, pgres1)
                 		 
     x2 = (/2081, 2100., 2100, 2081, 2081/)
     y2 = (/27.5, 27.5, -40, -40, 27.5/)
  
     pgres2                        =  True
     pgres2@gsFillColor            = "Lightpink"      ;-- fill color
     pgres2@gsFillOpacityF         =  0.3        ;-- set opacity of polygon
     pgres2@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_3 = gsn_add_polygon(wks,plot1, x2, y2, pgres2)
   
   
     x11 = (/2021, 2040., 2040, 2021, 2021/)
     y11 = (/27.5, 27.5, -40, -40, 27.5/)
  
     pgres11                        =  True
     pgres11@gsFillColor            = "Lightgrey"      ;-- fill color
     pgres11@gsFillOpacityF         =  0.3       ;-- set opacity of polygon
     pgres11@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_11 = gsn_add_polygon(wks,plot11, x11, y11, pgres11)
                 

     x12 = (/2041, 2060., 2060, 2041, 2041/)
     y12 = (/27.5, 27.5, -40, -40, 27.5/)
  
     pgres12                        =  True
     pgres12@gsFillColor            = "green4"      ;-- fill color
     pgres12@gsFillOpacityF         =  0.05         ;-- set opacity of polygon
     pgres12@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_22 = gsn_add_polygon(wks,plot11, x12, y12, pgres12)
                 		 
     x22 = (/2081, 2100., 2100, 2081, 2081/)
     y22 = (/27.5, 27.5, -40, -40, 27.5/)
 
     pgres22                        =  True
     pgres22@gsFillColor            = "Lightpink"      ;-- fill color
     pgres22@gsFillOpacityF         =  0.3        ;-- set opacity of polygon
     pgres22@tfPolyDrawOrder       = "PreDraw" ;background PostDraw; infornt
     gon_33 = gsn_add_polygon(wks,plot11, x22, y22, pgres22)
   
   
   

overlay(plot1,plot2)
overlay(plot1,plot3)
overlay(plot1,plot4)
overlay(plot1,plot5)
overlay(plot1,plot6)
plot(0)=plot1

overlay(plot11,plot22)
overlay(plot11,plot33)
overlay(plot11,plot44)
overlay(plot11,plot55)
overlay(plot11,plot66)
plot(1)=plot11


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

labels1 =(/"   CS= 5.3, FA= -1.24      ", "   CS= 4.5, FA= -1.08    ", "   CS= 3.15, FA= -0.64    ","   CS= 2.5, FA= -0.40  ","   CS= 2.0, FA= -0.16   ", "  Obs.   "/)


nitems1 = dimsizes(labels1)                 ; number of legend items
lbid1 = gsn_create_legend(wks,nitems1,labels1,lgres1)

 amres1                  = True
 amres1@amJust           = "TopRight"    ; Use bottom right corner of box
 amres1@amParallelPosF   = -0.20          ; Move legend to right
 amres1@amOrthogonalPosF = -0.15       

 annoid1 = gsn_add_annotation(plot1,lbid1,amres1)  ; add legend to plot


lgres2                   = lgres1  
lgres2@lgLabelFontHeightF = .085           ; legend label font thickness
labels2 =(/"   CS= 5.3      ", "   CS= 4.5    ", "   CS= 3.15    ","   CS= 2.5 ","   CS= 2.0   ", "  Obs.   "/)
lgres2@vpWidthF           = 0.22 ;0.18         ; width of legend (NDC)
lgres2@vpHeightF          = 0.16       ; height of legend (NDC)
lgres2@lgPerimThicknessF  = 1.5   
nitems2 = dimsizes(labels2)                 ; number of legend items

lbid2 = gsn_create_legend(wks,nitems2,labels2,lgres2)

 amres2                  = True
 amres2@amJust           = "TopRight"    ; Use bottom right corner of box
 amres2@amParallelPosF   = -0.26          ; Move legend to right
 amres2@amOrthogonalPosF = -0.15       
 
 annoid2 = gsn_add_annotation(plot11,lbid2,amres2)  ; add legend to plot

;************************************************************************************************
   resP                  = True
   resP@gsnFrame           = False                  
   resP@gsnMaximize      = True
   resP@gsnPanelXWhiteSpacePercent =1.5
   resP@gsnPanelYWhiteSpacePercent =2.1
   resP@gsnPanelBottom   = 0.05
  gsn_panel(wks,(/plot/),(/2,1/),resP)


end