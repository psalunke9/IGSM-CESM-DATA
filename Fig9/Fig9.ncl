load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;load "evans_plot.ncl"

begin

    fout1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS2.0-0.1DSULF-Diff-Nearterm.nc", "r")
    diff1 = fout1->tas_dif
    
    fout2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS3.15-Default-Diff-Nearterm.nc", "r")
     diff2 = fout2->tas_dif
    
    fout3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS5.3-2.5DSULF-Diff-Nearterm.nc", "r")
     diff3 = fout3->tas_dif 


    fout4 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS2.0-0.1DSULF-Diff-Midterm.nc", "r")
     diff4 = fout4->tas_dif 
    
    fout5 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS3.15-Default-Diff-Midterm.nc", "r")
    diff5 =  fout5->tas_dif 
    
    fout6 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS5.3-2.5DSULF-Diff-Midrterm.nc", "r")
     diff6 = fout6->tas_dif 
    
    
    fout7 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS2.0-0.1DSULF-Diff-Farterm.nc", "r")
     diff7 = fout7->tas_dif 
    
    fout8 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS3.15-Default-Diff-Farterm.nc", "r")
     diff8 = fout8->tas_dif 
    
    fout9 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig9/TAS-Ensmean-CS5.3-2.5DSULF-Diff-Farterm.nc", "r")
     diff9 = fout9->tas_dif 
    
    

;***************Start the graphics************************
wtype                = "pdf"
wtype@wkOrientation  = "landscape" 
wks = gsn_open_wks(wtype,"Fig9")          
           
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
 ; res1@txFont           = "Times-Bold"
  res1@tiMainFontHeightF           = 0.026
  res1@txFontHeightF    = 0.018
  res1@gsnLeftStringOrthogonalPosF = -0.018
  res1@gsnCenterStringOrthogonalPosF = 0.018
  res1@gsnCenterString =" "
  res1@cnFillOn = True
  res1@mpFillOn          = False
  res1@lbLabelFont= "Times-Bold"
 ;res1@gsnRightStringFont = "times-bold"
;****************Map line Vigible to use  ***************************
  res1@mpProjection      = "Robinson"
  res1@mpGeophysicalLineThicknessF = 1.0
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
res1@pmLabelBarWidthF    = 0.50
res1@lbLabelFontHeightF = 0.0165
res1@pmLabelBarOrthogonalPosF=0.06


  res2=res1
  res2@gsnRightString ="  "
  res2@cnFillPalette         = "BlueWhiteOrangeRed";"WhiteBlue";
  res2@gsnSpreadColors=True
  res2@gsnSpreadColorStart=0
  res2@gsnSpreadColorEnd=253
  res2@lbLabelStride=1
  res2@cnLevelSelectionMode = "ExplicitLevels" 
  res2@cnLevels     =(/-5.0,-4.5,-4.0,-3.5,-3.0,-2.5,-2.0,-1.5,-1.0,-0.5,0.0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5/);
  res2@lbBoxEndCapStyle =  "TriangleBothEnds"
  res2@gsnLeftString =" a) "
  res2@tiYAxisString      = "Near Term "
  res2@tiYAxisOffsetXF   =  -0.0045
  res2@tiYAxisFontHeightF = 0.020
  res2@tiYAxisFont="times-bold"
  
 res2@gsnRightString ="  "
 res2@gsnCenterString = " ANN: CS= 2.0, FA= -0.16 ~C~ ~C~  "
 res2@gsnLeftString = " a) "
 res2@gsnRightString =" "
 plot1(0) = gsn_csm_contour_map(wks,diff1,res2)   ;ANN

 res2@gsnCenterString = ""
 res2@gsnLeftString = " b)"
 res2@tiYAxisString      = "Mid Term "
 plot1(3) = gsn_csm_contour_map(wks,diff4,res2)   ;ANN
 
 res2@lbLabelBarOn= True
 res2@tiYAxisString      = "Far Term "
 res2@gsnLeftString = " c)"
 plot1(6) = gsn_csm_contour_map(wks,diff7,res2)   ;ANN
   
   res2@tiYAxisString      = ""
   res2@lbLabelBarOn= False
   res2@gsnCenterString = " ANN: CS= 3.15, FA= -0.64 ~C~ ~C~  "
   res2@gsnLeftString = "d) "
   res2@gsnRightString ="  "
   plot1(1) = gsn_csm_contour_map(wks,diff2,res2)   ;ANN
 
   res2@gsnCenterString = ""
    res2@gsnLeftString = " e)"
   plot1(4) = gsn_csm_contour_map(wks,diff5,res2)   ;ANN
   res2@lbLabelBarOn= True
   res2@gsnLeftString = "f) "
   ;res2@tiYAxisString      = "Far Term "
   plot1(7) = gsn_csm_contour_map(wks,diff8,res2)   ;ANN
 
   res2@gsnCenterString = " ANN: CS= 5.3, FA= -1.24 ~C~ ~C~ "
 
   res2@tiYAxisString      = ""
   res2@lbLabelBarOn= False
   res2@gsnLeftString = " g) "
   res2@gsnRightString ="  "
   plot1(2) = gsn_csm_contour_map(wks,diff3,res2)   ;ANN
   
   res2@gsnLeftString = " h) "
   res2@gsnCenterString = " "
   plot1(5) = gsn_csm_contour_map(wks,diff6,res2)   ;ANN
   
  res2@pmLabelBarOrthogonalPosF=0.06
   res2@gsnLeftString = " i) "
   res2@lbLabelBarOn= True
   plot1(8) = gsn_csm_contour_map(wks,diff9,res2)   ;ANN
  
;****************************Paneling********************************************
pres1                 = True

;pres1@gsnPanelRowSpec = True                   ; tell panel what order to plt
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent = 1.
pres1@gsnPanelXWhiteSpacePercent =1.
;pres1@gsnPanelBottom  = 0.06
gsn_panel(wks,plot1,(/3,3/),pres1)

end
 
