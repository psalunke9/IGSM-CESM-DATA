load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin

dir="/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS5"
    foutS1 = addfile(dir+"/IC1-SU35-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
    diff1 = foutS1->SU35_dif 
    
    foutS2 = addfile(dir+"/IC1-SU35-CS2.5-0.5DSULF-Diff-Midterm.nc", "r")
    diff2 = foutS2->SU35_dif 
    
    foutS3 = addfile(dir+"/IC1-SU35-CS3.15-Default-Diff-Midterm.nc", "r")
    diff3 = foutS3->SU35_dif 


    foutS4 = addfile(dir+"/IC1-SU35-CS4.5-2.25DSULF-Diff-Midterm.nc", "r")
    diff4 = foutS4->SU35_dif 
    
    foutS5 = addfile(dir+"/IC1-SU35-CS5.3-2.5DSULF-Diff-Midterm.nc", "r")
    diff5 = foutS5->SU35_dif 
    



    foutS6 = addfile(dir+"/IC2-SU35-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
    diff6 = foutS6->SU35_dif 
    
    foutS7 = addfile(dir+"/IC2-SU35-CS2.5-0.5DSULF-Diff-Midterm.nc", "r")
    diff7 = foutS7->SU35_dif 
    
    foutS8 = addfile(dir+"/IC2-SU35-CS3.15-Default-Diff-Midterm.nc", "r")
    diff8 = foutS8->SU35_dif 


    foutS9 = addfile(dir+"/IC2-SU35-CS4.5-2.25DSULF-Diff-Midterm.nc", "r")
    diff9 = foutS9->SU35_dif 
    
    foutS10 = addfile(dir+"/IC2-SU35-CS5.3-2.5DSULF-Diff-Midterm.nc", "r")
    diff10 = foutS10->SU35_dif 



    foutS11 = addfile(dir+"/IC3-SU35-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
    diff11 = foutS11->SU35_dif 
    
    foutS12 = addfile(dir+"/IC3-SU35-CS2.5-0.5DSULF-Diff-Midterm.nc", "r")
    diff12 = foutS12->SU35_dif
    
    foutS13 = addfile(dir+"/IC3-SU35-CS3.15-Default-Diff-Midterm.nc", "r")
    diff13 = foutS13->SU35_dif 


    foutS14 = addfile(dir+"/IC3-SU35-CS4.5-2.25DSULF-Diff-Midterm.nc", "r")
    diff14 = foutS14->SU35_dif 
    
    foutS15 = addfile(dir+"/IC3-SU35-CS5.3-2.5DSULF-Diff-Midterm.nc", "r")
    diff15 = foutS15->SU35_dif 
    


    foutS16 = addfile(dir+"/IC4-SU35-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
    diff16 = foutS16->SU35_dif 
    
    foutS17 = addfile(dir+"/IC4-SU35-CS2.5-0.5DSULF-Diff-Midterm.nc", "r")
    diff17 = foutS17->SU35_dif 
    
    foutS18 = addfile(dir+"/IC4-SU35-CS3.15-Default-Diff-Midterm.nc", "r")
    diff18 = foutS18->SU35_dif 


    foutS19 = addfile(dir+"/IC4-SU35-CS4.5-2.25DSULF-Diff-Midterm.nc", "r")
    diff19 = foutS19->SU35_dif 
    
    foutS20 = addfile(dir+"/IC4-SU35-CS5.3-2.5DSULF-Diff-Midterm.nc", "r")
    diff20 = foutS20->SU35_dif



    foutS21 = addfile(dir+"/IC5-SU35-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
    diff21 = foutS21->SU35_dif 
    
    foutS22 = addfile(dir+"/IC5-SU35-CS2.5-0.5DSULF-Diff-Midterm.nc", "r")
    diff22 = foutS22->SU35_dif 
    
    foutS23 = addfile(dir+"/IC5-SU35-CS3.15-Default-Diff-Midterm.nc", "r")
    diff23 = foutS23->SU35_dif 


    foutS24 = addfile(dir+"/IC5-SU35-CS4.5-2.25DSULF-Diff-Midterm.nc", "r")
    diff24 = foutS24->SU35_dif 
    
    foutS25 = addfile(dir+"/IC5-SU35-CS5.3-2.5DSULF-Diff-Midterm.nc", "r")
    diff25 = foutS25->SU35_dif
    
    
;***************Start the graphics************************
wtype                = "pdf"
;wtype@wkPaperWidthF  = 32;22
;wtype@wkPaperHeightF = 30;20
wtype@wkOrientation  = "landscape" 
wks = gsn_open_wks(wtype,"FigS5")          
           
plot1 = new(25,graphic)

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
 ; res1@txFont           = "Times-Bold"
  res1@tiMainFontHeightF           = 0.026
  res1@txFontHeightF    = 0.020
  res1@gsnLeftStringOrthogonalPosF = 0.018
  res1@gsnCenterStringOrthogonalPosF = 0.018
  res1@gsnCenterString =" "
  res1@cnFillOn = True
  res1@mpFillOn          = False
  res1@lbLabelFont= "Times-Bold"
 ;res1@gsnRightStringFont = "times-bold"
;****************Map line Vigible to use  ***************************
  res1@mpProjection      = "Robinson"
  res1@mpGeophysicalLineThicknessF = 0.1
  res1@mpOutlineMaskingOn =True
  ;res1@mpMaskOutlineSpecifiers=(/"Water","Land"/)
  res1@mpGridAndLimbOn   = True            ; turn on lat/lon lines
  res1@mpGridLineColor ="Gray49";
  res1@mpGridLatSpacingF = 30.               ; spacing for lat lines
  res1@mpGridLonSpacingF = 40.  
  res1@tmYMajorGrid                = False
  res1@tmXMajorGrid                = False
  res1@mpPerimOn         = False      
  res1@mpCenterLonF      = -200             ; choose center lon       ; turn off box around plot
  
  res1@lbLabelBarOn= False
  res1@lbLabelFont= "times-bold"            ;label
  res1@lbLabelStride=1
  res1@pmLabelBarHeightF   =0.068
  res1@pmLabelBarWidthF    = 0.50
 ;res1@lbOrientation =   "vertical"          ; vertical label bar
  res1@lbLabelFontHeightF = 0.0165
  res1@pmLabelBarOrthogonalPosF=0.06



  res2=res1
  res2@gsnRightString ="  "
  
  cmap =(/"white","Blue1","green4","yellow2","DarkOrange","red2","red4"/)
  res2@cnFillPalette = cmap

  res2@lbLabelBarOn= False
  res2@gsnRightString ="  "
  res2@cnLevelSelectionMode = "ExplicitLevels" 
  res2@cnLevels       =(/1,7,15,30,60,90/);  
  ;res2@tiYAxisString      = "IGSM-CESM1-CS2.0 "
  res2@tiYAxisOffsetXF   =  -0.0048
  res2@tiYAxisFontHeightF = 0.018
  res2@tiYAxisFont="times-bold"
  res2@lbLabelBarOn= False
  res2@gsnCenterString ="      ";"      FT:(CT)"
  res2@lbBoxEndCapStyle =  "TriangleBothEnds"
  res2@gsnLeftString = " a5) "
  res2@gsnCenterString ="   IC5  ~C~ ~C~";
    res2@gsnRightString =" "
  plot1(4) = gsn_csm_contour_map(wks,diff1,res2)   

  res2@gsnCenterString ="   ";
  res2@gsnLeftString = " b5) "
 ; res2@tiYAxisString      = " IGSM-CESM1-CS2.5 "
  plot1(9) = gsn_csm_contour_map(wks,diff2,res2)   
  
 ; res2@tiYAxisString      = " IGSM-CESM1-CS3.15 "
  
  res2@gsnLeftString = " c5) "

  plot1(14) = gsn_csm_contour_map(wks,diff3,res2)   
  
  ;res2@tiYAxisString      = " IGSM-CESM1-CS4.5 "
  
  res2@gsnLeftString = " d5) "

  plot1(19) = gsn_csm_contour_map(wks,diff4,res2)   
  
  res2@lbLabelBarOn= True
  
  ;res2@tiYAxisString      = " IGSM-CESM1-CS5.3 "
  
  res2@gsnLeftString = " e5) "

  plot1(24) = gsn_csm_contour_map(wks,diff5,res2)   
  
  
  
  
  res33=res1
  res33@cnLevelSelectionMode = "ExplicitLevels" 
  res33@cnLevels     =(/1,7,15,30,60,90/);
  
  cmap1 =(/"white","Blue1","green4","yellow2","DarkOrange","red2","red4"/)
  res33@cnFillPalette = cmap1
  
  res33@gsnRightString ="  "
  res33@lbBoxEndCapStyle =  "TriangleBothEnds"
  res33@lbLabelBarOn= False
  res33@gsnLeftString = " a1) "
  res33@gsnCenterString ="   IC1  ~C~ ~C~";
  res33@tiYAxisFont="times-bold"
  res33@tiYAxisOffsetXF   =  -0.0048
  res33@tiYAxisFontHeightF = 0.018
    res33@tiYAxisString      = "IGSM-CESM1-CS2.0 "
  plot1(0) = gsn_csm_contour_map(wks,diff6,res33)   ;ANN
  res33@gsnCenterString ="     "
  res33@gsnLeftString = " b1) "
  res33@tiYAxisString      = " IGSM-CESM1-CS2.5 "
  plot1(5) = gsn_csm_contour_map(wks,diff7,res33)   ;ANN
 
    res33@tiYAxisString      = " IGSM-CESM1-CS3.15 "
  res33@gsnLeftString = " c1) "
  plot1(10) = gsn_csm_contour_map(wks,diff8,res33)   ;ANN
  
  res33@tiYAxisString      = " IGSM-CESM1-CS4.5 "
  res33@gsnLeftString = " d1) "
  plot1(15) = gsn_csm_contour_map(wks,diff9,res33)   ;ANN
  
  res33@tiYAxisString      = " IGSM-CESM1-CS5.3 " 
  res33@lbLabelBarOn= True
  res33@gsnLeftString = " e1) "
  plot1(20) = gsn_csm_contour_map(wks,diff10,res33)   ;ANN
    
    res33@tiYAxisString      = "  " 
   res33@gsnCenterString ="   IC2  ~C~ ~C~";
     res33@lbLabelBarOn= False
   res33@gsnLeftString = " a2) "
   plot1(1) = gsn_csm_contour_map(wks,diff11,res33)   ;ANN
   res33@gsnCenterString ="   ";
   res33@gsnLeftString = " b2) "
   plot1(6) = gsn_csm_contour_map(wks,diff12,res33)   ;ANN
  
   res33@gsnLeftString = " c2) "
   plot1(11) = gsn_csm_contour_map(wks,diff13,res33)   ;ANN
  
   res33@gsnLeftString = " d2) "
   plot1(16) = gsn_csm_contour_map(wks,diff14,res33)   ;ANN
       
   res33@lbLabelBarOn= True
   res33@gsnLeftString = " e2) "
   plot1(21) = gsn_csm_contour_map(wks,diff15,res33)   ;ANN
   
    
    res33@gsnCenterString ="   IC3  ~C~ ~C~";
      res33@lbLabelBarOn= False
   res33@gsnLeftString = " a3) "
   plot1(2) = gsn_csm_contour_map(wks,diff16,res33)   ;ANN
   res33@gsnCenterString ="   ";
   res33@gsnLeftString = " b3) "
   plot1(7) = gsn_csm_contour_map(wks,diff17,res33)   ;ANN
  
   res33@gsnLeftString = " c3) "
   plot1(12) = gsn_csm_contour_map(wks,diff18,res33)   ;ANN
  
   res33@gsnLeftString = " d3) "
   plot1(17) = gsn_csm_contour_map(wks,diff19,res33)   ;ANN
       
   res33@lbLabelBarOn= True
   res33@gsnLeftString = " e3) "
   plot1(22) = gsn_csm_contour_map(wks,diff20,res33)   ;ANN
    
    
    res33@gsnCenterString ="   IC4  ~C~ ~C~";
   res33@lbLabelBarOn= False
   res33@gsnLeftString = " a4) "
   plot1(3) = gsn_csm_contour_map(wks,diff21,res33)   ;ANN
   res33@gsnCenterString ="   ";
   res33@gsnLeftString = " b4) "
   plot1(8) = gsn_csm_contour_map(wks,diff22,res33)   ;ANN
  
   res33@gsnLeftString = " c4) "
   plot1(13) = gsn_csm_contour_map(wks,diff23,res33)   ;ANN
  
   res33@gsnLeftString = " d4) "
   plot1(18) = gsn_csm_contour_map(wks,diff24,res33)   ;ANN
       
   res33@lbLabelBarOn= True
   res33@gsnLeftString = " e4) "
   plot1(23) = gsn_csm_contour_map(wks,diff25,res33)   ;ANN
  
;****************************Paneling********************************************
pres1                 = True
;pres1@gsnPanelRowSpec = True                   ; tell panel what order to plt
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent = 0.1
pres1@gsnPanelXWhiteSpacePercent =0.1
;pres1@gsnPanelBottom  = 0.06
pres1@gsnPanelLeft  = 0.01

gsn_panel(wks,plot1,(/5,5/),pres1)

end
 
