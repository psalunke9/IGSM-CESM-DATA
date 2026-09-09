; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
    dir="/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS8/"
    
    fout1 = addfile(dir+"MOC-Ensmean-CS2.0-0.1DSULF-Nearterm.nc", "r")
    Mean1 = fout1->moc_dif 
    depth= fout1->depth
    lat    = fout1->lat
   
  
    
    fout2 = addfile(dir+"MOC-Ensmean-CS3.15-Default-Nearterm.nc", "r")
    Mean2 = fout2->moc_dif 
    
    fout3 = addfile(dir+"MOC-Ensmean-CS5.3-2.5DSULF-Nearterm.nc", "r")
    Mean3 = fout3->moc_dif 
    
    
    
    
    fout4 = addfile(dir+"MOC-Ensmean-CS2.0-0.1DSULF-Midterm.nc", "r")
    Mean4 = fout4->moc_dif 
    
    fout5 = addfile(dir+"MOC-Ensmean-CS3.15-Default-Midterm.nc", "r")
    Mean5 = fout5->moc_dif 
    
    fout6 = addfile(dir+"MOC-Ensmean-CS5.3-2.5DSULF-Midrterm.nc", "r")
    Mean6 = fout6->moc_dif 
    
    
    
    
       
       fout7 = addfile(dir+"MOC-Ensmean-CS2.0-0.1DSULF-Farterm.nc", "r")
       Mean7 = fout7->moc_dif 
    
       fout8 = addfile(dir+"MOC-Ensmean-CS3.15-Default-Farterm.nc", "r")
       Mean8 = fout8->moc_dif
    
       fout9 = addfile(dir+"MOC-Ensmean-CS5.3-2.5DSULF-Farterm.nc", "r")
       Mean9 = fout9->moc_dif
       
       
 ;***************Start the graphics************************
 wtype                = "pdf"
 ;wtype@wkPaperWidthF  = 32;22
 ;wtype@wkPaperHeightF = 30;20
 wtype@wkOrientation  = "landscape" 
 wks = gsn_open_wks(wtype,"FigS8")          
           
 plot1 = new(9,graphic)
    
  res                         = True
  res@gsnDraw  = False
  res@gsnFrame = False
  res@cnFillOn                = True
  
  res@cnFillPalette         ="MPL_RdBu";"CBR_coldhot";""CBR_coldhot";"; "WhiteBlue";
  res@gsnSpreadColors=True
  res@gsnSpreadColorStart=0
  res@gsnSpreadColorEnd=127
  res@trXMinF          = -60     ; Set min/max of left X axis
  res@trXMaxF          = 60
  res@tmXBTickSpacingF= 10
  
  res@cnLineLabelsOn          = False
  res@cnLinesOn               = False
  res@cnInfoLabelOn           = False
  res@lbOrientation           = "vertical"
  res@lbLabelFontHeightF = 0.025
  res@pmLabelBarHeightF   =0.62
  res@pmLabelBarWidthF    = 0.075
  ;res@pmLabelBarParallelPosF=0.06
  
  res@lbBoxEndCapStyle =  "TriangleBothEnds"
  res@tmYLMinorOn = False
  res@tmYRMinorOn = False
  res@tmYROn = False
  res@tmXBMinorOn = False
  res@tmXTOn = False
  res@tmXBOn = True
  res@tmXTOn=False
  res@tmYROn=False
  res@tmYRLabelsOn = False
  res@txFont = "times-bold"                     
  res@txFontHeightF    = 0.028


  res@sfXArray                = lat
  res@sfYArray                = depth        ; uniform interpolated depth
  res@trYReverse              = True                 ; reverse y-axis (surface on top)

  res@tmYRMode                = "Explicit"
  res@tmYRMinorOn             = False
  res@tmYRValues              = (/0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5/)
  
  
  res@tmXBMode                 = "Explicit" 
  res@tmXBValues = (/ -60,-40,-20, 0, 20,40,60/)
  res@tmXBLabels = (/"60S","40S","20S","EQ","20N","40N","60N"/)
  
 ; res@tmXBValues = ( / 0, 10,20,30,40,50,60 /)
 ;res@tmXBLabels = (/"EQ","10N","20N","30N","40N","50N","60N"/)
  
  res@tiXAxisString           = "Latitude"
  res@tiYAxisString           = " Depth (km) Near-Term ~C~ "
  res@tiMainString            = ""
  
  res@cnMissingValPerimOn     = True
  res@cnMissingValFillPattern = 3
  res@cnMissingValFillColor   = "black"

  res@cnLevelSelectionMode    = "ManualLevels"
  res@cnMinLevelValF          = -16
  res@cnMaxLevelValF          = 16
  res@cnLevelSpacingF         = 2

  ;res@tiYAxisString      = "IGSM-CESM1-CS2.5 (2~S~o~N~)"
  res@tiYAxisOffsetXF   =  -0.0048
  res@tiYAxisFontHeightF = 0.026
  res@tiYAxisFont="times-bold"
    res@gsnCenterString =" CS= 2.0, FA= -0.16";"   Near-Term ~C~   "
    res@gsnLeftString = " a)  "
    res@gsnRightString ="  "
  res@lbLabelBarOn= False
    plot1(0)  = gsn_csm_contour(wks, Mean1, res)
    
    res@tiYAxisString           = " Depth (km) Mid-Term ~C~ ";" CS= 3.15, FA= -0.64"
    res@lbLabelBarOn= False
    res@gsnCenterString ="    "
    res@gsnLeftString = " b) "
   
    plot1(3)  = gsn_csm_contour(wks, Mean4, res)
  
    
   res@gsnLeftString = " c)  "
    res@tiYAxisString           =" Depth (km) Far-Term ~C~ "; "Depth (km) CS= 5.3, FA= -1.24"
    plot1(6)  = gsn_csm_contour(wks, Mean7, res)
    
    
    res@lbLabelBarOn= False
    res@tiYAxisString      = ""
    res@gsnLeftString = " d) "
    res@gsnCenterString ="CS= 3.15, FA= -0.64";"   Mid-Term ~C~ "
    plot1(1)  = gsn_csm_contour(wks, Mean2, res)
   
    res@gsnCenterString ="    "
    res@gsnLeftString = " e)  "
    plot1(4)  = gsn_csm_contour(wks, Mean5, res)
    
 
    res@gsnLeftString = " f) "
    plot1(7)  = gsn_csm_contour(wks, Mean8, res)
    
    
    
   res@lbLabelBarOn= True
    res@gsnCenterString =" CS= 5.3, FA= -1.24";"   Far-Term ~C~ "
    res@gsnLeftString = " g) "
    plot1(2)  = gsn_csm_contour(wks, Mean3, res)
    
    res@lbLabelBarOn= True
    res@gsnCenterString ="    "
    res@gsnLeftString = " h) "
    plot1(5)  = gsn_csm_contour(wks, Mean6, res)
    
     res@lbLabelBarOn= True
    res@gsnLeftString = " i) "
    plot1(8)  = gsn_csm_contour(wks, Mean9, res)
;****************************Paneling********************************************
pres1                 = True
;pres1@gsnPanelRowSpec = True                   ; tell panel what order to plt
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent =0.1
pres1@gsnPanelXWhiteSpacePercent =0.1
pres1@gsnPanelRight = 0.965
gsn_panel(wks,plot1,(/3,3/),pres1)

end


  
