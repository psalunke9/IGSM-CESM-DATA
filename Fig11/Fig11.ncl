load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


begin

    fout1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2021-2040-ANN-ALL-CSs-DSULF-New.nc", "r")
    m1 = fout1->TREFHT_STD(:,:,:)
    mean1 = dim_avg_n_Wrap(m1,0)
    
    fout2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2041-2060-ANN-ALL-CSs-DSULF-New.nc", "r")
    m2 = fout2->TREFHT_STD(:,:,:)
    mean2 = dim_avg_n_Wrap(m2,0)
    
    fout3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2081-2100-ANN-ALL-CSs-DSULF-New.nc", "r")
    m3 = fout3->TREFHT_STD(:,:,:)
    mean3 = dim_avg_n_Wrap(m3,0)


    fout4 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2021-2040-ANN-ALL-ICs-DSULF-New.nc", "r")
    m4 = fout4->TREFHT_STD(:,:,:)
    mean4 = dim_avg_n_Wrap(m4,0)
    
    fout5 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2041-2060-ANN-ALL-ICs-DSULF-New.nc", "r")
    m5 = fout5->TREFHT_STD(:,:,:)
    mean5 = dim_avg_n_Wrap(m5,0)
    
    fout6 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/TREFHT_Mean_StdDev_5experiments-2081-2100-ANN-ALL-ICs-DSULF-New.nc", "r")
    m6 = fout6->TREFHT_STD(:,:,:)
    mean6 = dim_avg_n_Wrap(m6,0)
    
    
    fout7 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/Ratio-Ensmean-CS2.0-0.1DSULF-StedDev-Nearterm.nc", "r")
    Ratio1 = fout7->ratio_dif 
    
    fout8 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/Ratio-Ensmean-CS3.15-Default-StedDev-Midterm.nc", "r")
    Ratio3 = fout8->ratio_dif 
    
    fout9 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig11/Ratio-Ensmean-CS5.3-2.5DSULF-StedDev-Farterm.nc", "r")
    Ratio5 = fout9->ratio_dif 
    
    

;***************Start the graphics************************
wtype                = "pdf"
wtype@wkOrientation  = "landscape" 
wks = gsn_open_wks(wtype,"Fig11")          
           
plot1 = new(9,graphic)

;**********************************************************
  res1          = True
  res1@gsnDraw  = False
  res1@gsnFrame = False
  res1@mpOutlineOn           = True       ; Turn on map outlines
  res1@mpFillOn = False
  res1@cnLinesOn            = False              ; turn off contour lines
  res1@cnLineLabelsOn       = False              ; turn off contour labels
  res1@cnLineThicknessF= 0.2
  res1@cnLineColor      = "grey18"	   ; no contour lines
  res1@mpGeophysicalLineColor ="Black" ;"brown4"     ; color of continental outlines
  res1@mpGeophysicalLineThicknessF = 1.5
  res1@mpGridLineDashPattern  = 2         ; lat/lon lines as dashed
  res1@tmYLMinorOn = False
  res1@tmYRMinorOn = False
  res1@tmYROn = False
  res1@tmXBMinorOn = False
  res1@tmXTOn = False
  res1@tmXBOn = False
  res1@tmXTOn=False
  res1@tmYROn=False
  res1@tmYRLabelsOn = False
  res1@tiMainFont = "times-bold"   
  res1@txFont = "times-bold"                     
  res1@tiMainFontHeightF           = 0.026
  res1@txFontHeightF    = 0.020
  res1@gsnLeftStringOrthogonalPosF = 0.018
  res1@gsnCenterStringOrthogonalPosF = 0.018
  res1@gsnCenterString =" "
  res1@cnFillOn = True
  res1@mpFillOn          = False
  res1@lbLabelFont= "Times-Bold"
  res1@mpProjection      = "Robinson"
  res1@mpGeophysicalLineThicknessF = 1.1
  res1@mpOutlineMaskingOn =True
  ;res1@mpMaskOutlineSpecifiers=(/"Water","Land"/)
  res1@mpGridAndLimbOn   = True            ; turn on lat/lon lines
  res1@mpGridLineColor ="Gray19";
  res1@mpGridLatSpacingF = 30.               ; spacing for lat lines
  res1@mpGridLonSpacingF = 40.  
  res1@tmYMajorGrid                = False
  res1@tmXMajorGrid                = False
  res1@mpPerimOn         = False      
 ; res1@mpCenterLonF      = -200             ; choose center lon       ; turn off box around plot
  res1@lbLabelBarOn= False
  res1@lbLabelFont= "times-bold"            ;label
  res1@lbLabelStride=1
  res1@pmLabelBarHeightF   =0.068
  res1@pmLabelBarWidthF    = 0.52
 ;res1@lbOrientation =   "vertical"          ; vertical label bar
  res1@lbLabelFontHeightF = 0.0165
  res1@pmLabelBarOrthogonalPosF=0.06
  
  
  res2=res1
  res2@gsnRightString ="  "
  res2@cnFillPalette         ="WhiteYellowOrangeRed"
  res2@gsnSpreadColorStart=0
  res2@gsnSpreadColorEnd=253
  res2@lbLabelBarOn= False
  res2@gsnRightString ="  "
  res2@cnLevelSelectionMode = "ExplicitLevels" 
  res2@cnLevels       =(/0.2,0.4,0.6,0.8,1.0,1.2,1.4,1.6,1.8/) 
  res2@tiYAxisString      = "Near Term"
  res2@tiYAxisOffsetXF   =  -0.0048
  res2@tiYAxisFontHeightF = 0.018
  res2@tiYAxisFont="times-bold"
  res2@lbLabelBarOn= False
  res2@gsnCenterString ="     "
  res2@lbBoxEndCapStyle =  "TriangleBothEnds"
  res2@gsnLeftString = " a) "
  res2@gsnRightString ="  "
  res2@gsnCenterString ="   CSs ~C~ ~C~";
  plot1(0) = gsn_csm_contour_map(wks,mean1 ,res2)   

  res2@gsnCenterString ="   ";
  res2@gsnLeftString = " b) "
  res2@tiYAxisString      = " Mid Term "
  plot1(3) = gsn_csm_contour_map(wks,mean2 ,res2)   
  
  res2@tiYAxisString      = " Far Term "
  res2@lbLabelBarOn= True
  res2@gsnLeftString = " c) "
  plot1(6) = gsn_csm_contour_map(wks,mean3,res2)   
  
  
  
  res33=res1
  res33@cnFillPalette         ="WhiteYellowOrangeRed"
  res33@gsnSpreadColors=True
  res33@gsnSpreadColorStart=0
  res33@gsnSpreadColorEnd=253
  res33@lbLabelBarOn= False
  res33@gsnRightString ="  " 
  res33@cnLevelSelectionMode = "ExplicitLevels" 
  res33@cnLevels       = (/0.2,0.4,0.6,0.8,1.0,1.2,1.4,1.6,1.8/); 
  res33@lbBoxEndCapStyle =  "TriangleBothEnds"
  res33@lbLabelBarOn= False
  res33@gsnLeftString = " d) "
  res33@gsnCenterString ="      "
  res33@gsnCenterString ="   ICs ~C~ ~C~";
  plot1(1) = gsn_csm_contour_map(wks,mean4,res33)   
  
  res33@gsnLeftString = " e) "
  res33@gsnCenterString ="  ";
  plot1(4) = gsn_csm_contour_map(wks,mean5,res33)   
  
  res33@lbLabelBarOn= True
  res33@gsnLeftString = "f) "
  plot1(7) = gsn_csm_contour_map(wks,mean6,res33)  
  
 
  res43=res1 
  res43@cnFillPalette         ="amwg_blueyellowred"
  res43@gsnSpreadColors=True
  res43@gsnSpreadColorStart=5
  res43@gsnSpreadColorEnd=15
  res43@lbLabelBarOn= False
  res43@gsnRightString ="  "
  res43@lbLabelStride=1
  res43@cnLevelSelectionMode = "ExplicitLevels" 
  res43@cnLevels       =(/0.8,0.9,1.0,1.2,1.4,1.6,1.8,2.0,2.5,3.0/)
  res43@lbBoxEndCapStyle =  "TriangleBothEnds"
  res43@lbLabelBarOn= False
  res43@gsnLeftString = " g) "
  res43@gsnCenterString ="      "
  res43@gsnCenterString ="  Ratio (CSs / ICs) ~C~ ~C~";
  plot1(2) = gsn_csm_contour_map(wks,Ratio1,res43)   
   
  res43@gsnLeftString = " h) "
  res43@gsnCenterString ="  ";
  plot1(5) = gsn_csm_contour_map(wks,Ratio3,res43)  
  
  res43@lbLabelBarOn= True
  res43@gsnLeftString = " i) "
  plot1(8) = gsn_csm_contour_map(wks,Ratio5,res43)   
   
  
;****************************Paneling********************************************
pres1                 = True
;pres1@gsnPanelRowSpec = True                   
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent = 0.1
pres1@gsnPanelXWhiteSpacePercent =0.1
pres1@gsnPanelLeft  = 0.01
gsn_panel(wks,plot1,(/3,3/),pres1)

end
 
