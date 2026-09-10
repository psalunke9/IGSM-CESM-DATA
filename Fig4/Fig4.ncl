load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
;load "evans_plot.ncl"

begin

    fout1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM2-TAS-Hist-1Deg-Diff-ANN.nc", "r")
    diff1 = fout1->tas_dif
    
    fout2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-TAS-Hist-20TR-1Deg-Diff-ANN.nc", "r")
    diff2 = fout2->tas_dif
    
    fout3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-TAS-Hist-20TR-2Deg-Diff-ANN.nc", "r")
    diff3 = fout3->tas_dif 
    
;**********************significance****************************************

    fou01 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM2-TAS-Hist-1Deg-Probability-ANN.nc", "r")
    prob1 = fou01->prob
    
    fou02 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-TAS-Hist-20TR-1Deg-Probability-ANN.nc", "r")
    prob2 = fou02->prob 
    
    fou03 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-TAS-Hist-20TR-2Deg-Probabilityf-ANN.nc", "r")
    prob3 = fou03->prob 
    
d01_test01s = where(prob1.gt.99.0,diff1,diff1@_FillValue) 
copy_VarCoords(diff1,d01_test01s)
printVarSummary(d01_test01s)

d01_test01 = where(prob2.gt.99.0,diff2,diff2@_FillValue) 
copy_VarCoords(diff2,d01_test01)
printVarSummary(d01_test01)


d20_test20 = where(prob3.gt.99.0,diff3,diff3@_FillValue) 
copy_VarCoords(diff3,d20_test20)
printVarSummary(d20_test20)

;********************************************************************************


    fou1 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM2-PRECT-Hist-1Deg-Diff-ANN.nc", "r")
    dif1 = fou1->pr_dif 
    
    fou2 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-PRECT-Hist-20TR-1Deg-Diff-ANN.nc", "r")
    dif2 = fou2->pr_dif 
    
    fou3 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-PRECT-Hist-20TR-2Deg-Diff-ANN.nc", "r")
    dif3 = fou3->pr_dif 

;********************** significance****************************************


    fou11 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM2-PRECT-Hist-1Deg-Probability-ANN.nc", "r")
    probt001 = fou11->prob 
    
    fou22 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-PRECT-Hist-20TR-1Deg-Probability-ANN.nc", "r")
    probt002= fou22->prob 
    
    fou33 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/Fig4/CESM1-PRECT-Hist-20TR-2Deg-Probabilityf-ANN.nc", "r")
    probt003 = fou33->prob 
    
    

d01_test001 = where(probt001.gt.99.0,dif1,dif1@_FillValue) 
copy_VarCoords(dif1,d01_test001)
printVarSummary(d01_test001)


d02_test002 = where(probt002.gt.99.0,dif2,dif2@_FillValue) 
copy_VarCoords(dif2,d02_test002)
printVarSummary(d02_test002)


d03_test003 = where(probt003.gt.99.0,dif3,dif3@_FillValue) 
copy_VarCoords(dif3,d03_test003)
printVarSummary(d03_test003)


    
    
;***************Start the graphics************************
wtype                = "pdf"
wtype@wkOrientation  = "landscape" 
wks = gsn_open_wks(wtype,"Fig4")          
           
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
  res1@tiMainFontHeightF           = 0.024
  res1@txFontHeightF    = 0.018
  res1@gsnLeftStringOrthogonalPosF = 0.016
  res1@gsnCenterStringOrthogonalPosF = 0.016
  res1@gsnCenterString =" "
  res1@cnFillOn = True
  res1@mpFillOn          = False
  res1@lbLabelFont= "Times-Bold"
 ;res1@gsnRightStringFont = "times-bold"
 
 res1@cnMissingValFillColor        = "gray"
 res1@cnMissingValFillPattern      = 0
 res1@cnMissingValPerimOn          = True
 res1@cnMissingValPerimThicknessF  = 2.0;3.0 
 res1@cnMissingValPerimGridBoundOn = True
 res1@cnMissingValFillScaleF       = 0.5;2.0
 res1@cnMissingValPerimColor       ="gray"
 
;****************Map line Vigible to use  ***************************
  res1@mpProjection      = "Robinson"
  res1@mpGeophysicalLineThicknessF = 1.5
  res1@mpOutlineMaskingOn =True
  ;res1@mpMaskOutlineSpecifiers=(/"Water","Land"/)
  res1@mpGridAndLimbOn   = True            ; turn on lat/lon lines
res1@mpGridLineColor ="Gray59";
  res1@mpGridLatSpacingF = 30.               ; spacing for lat lines
  res1@mpGridLonSpacingF = 40.  
  res1@tmYMajorGrid                = False
  res1@tmXMajorGrid                = False
  res1@mpPerimOn         = False      
  res1@mpCenterLonF      = -200             ; choose center lon       ; turn off box around plot
  
  res1@lbLabelBarOn= True
  res1@lbLabelFont= "times-bold"            ;label
  res1@lbLabelStride=1
res1@pmLabelBarHeightF   =0.068
res1@pmLabelBarWidthF    = 0.50
;res1@lbOrientation =   "vertical"          ; vertical label bar
res1@lbLabelFontHeightF = 0.0165
res1@pmLabelBarOrthogonalPosF=0.03
  
  

  res2=res1
  res2@gsnLeftString = " c) b-a"
  res2@gsnRightString ="  "
  res2@cnFillPalette         = "BlueWhiteOrangeRed";"WhiteBlue";
  res2@gsnSpreadColors=True
  res2@gsnSpreadColorStart=0
  res2@gsnSpreadColorEnd=253
  res2@cnLevelSelectionMode = "ManualLevels"     ; set manual contour levels
  res2@cnMinLevelValF       = -6.0             ; set min contour level
  res2@cnMaxLevelValF        = 6.0             ; set max contour level
  res2@cnLevelSpacingF      =1.0
  res2@cnLevelSelectionMode = "ExplicitLevels" 
  res2@cnLevels     =(/-5.0,-4.0,-3.0,-2.0,-1.0,-0.5,0.0,0.5,1.0,2.0,3.0,4.0,5.0/)
  res2@lbBoxEndCapStyle =  "TriangleBothEnds"
  
  res2@gsnRightString ="  "
  res2@gsnLeftString =" a) ANN "
  
  res2@gsnCenterString = " CESM2 1~S~o~N~ - HadCRU Obs."
 res2@lbLabelBarOn= False
  plot1(0) = gsn_csm_contour_map(wks,diff1,res2)   ;ANN
  
  res2@gsnLeftString =" b) ANN "
   res2@gsnCenterString = " CESM1 1~S~o~N~ - HadCRU Obs."
  res2@lbLabelBarOn= False
   plot1(2) = gsn_csm_contour_map(wks,diff2,res2)   ;ANN
   res2@gsnLeftString =" c) ANN "
  
  res2@gsnCenterString = " CESM1 2~S~o~N~ - HadCRU Obs."
res2@pmLabelBarOrthogonalPosF=0.03
;res2@pmLabelBarParallelPosF=-0.02
res2@lbLabelBarOn= True
  plot1(4) = gsn_csm_contour_map(wks,diff3,res2)   ;ANN
  
  res3=res1
  res3@gsnRightString ="  "
  res3@cnFillPalette         = "MPL_BrBG";"BlueWhiteOrangeRed";"WhiteBlue";
  res3@gsnSpreadColors=True
  res3@gsnSpreadColorStart=0
  res3@gsnSpreadColorEnd=123
  res3@cnLevelSelectionMode = "ExplicitLevels" 
  res3@cnLevels     =(/-3.0,-2.0,-1.0,-0.5,0.0,0.5,1.0,2.0,3.0/);
  res3@lbBoxEndCapStyle =  "TriangleBothEnds"
  
  res3@gsnRightString ="  "
  res3@lbLabelBarOn= False
  res3@gsnLeftString = " d) ANN"
  res3@gsnCenterString = " CESM2 1~S~o~N~ - GPCP Obs"
  res3@gsnRightString ="  "
  plot1(1) = gsn_csm_contour_map(wks,dif1,res3)   ;ANN
  
     res3@gsnLeftString = " e) ANN"
     res3@gsnCenterString = " CESM1 1~S~o~N~ - GPCP Obs"
     res3@gsnRightString ="  "
     plot1(3) = gsn_csm_contour_map(wks,dif2,res3)   ;ANN
  
  
  res3@gsnLeftString = " f) ANN"
  res3@gsnCenterString = " CESM1 2~S~o~N~ - GPCP Obs"
  res3@pmLabelBarOrthogonalPosF=0.03
  ;res3@pmLabelBarParallelPosF=-0.02
  res3@lbLabelBarOn= True
  plot1(5) = gsn_csm_contour_map(wks,dif3,res3)   ;ANN
  
  
  ;******************************************************************************
    sres11 = True
    sres11@gsnDraw              = False
    sres11@gsnFrame             = False
    sres11@cnFillOn             = True               ; turn on color fill
    sres11@cnLinesOn            = False
    sres11@cnLineThicknessF = 0.2
    sres11@tiMainString    = ""
    sres11@gsnLeftString   = ""
    sres11@gsnRightString  = ""
    sres11@cnInfoLabelSide = "Top"
    sres11@cnInfoLabelOn   = False
    sres11@cnLineLabelsOn  = False
    sres11@cnFillOpacityF  = 0.5
    sres11@lbLabelBarOn    = False
    sres11@cnLineColor     = "grey49"
    sres11@cnMonoFillColor = False
    sres11@cnMonoFillPattern = True
    sres11@cnMonoFillScale   = True
    sres11@cnFillScaleF      = 1.1
    sres11@cnFillDotSizeF    = .0035
    sres11@cnFillDrawOrder = "PostDraw"

  
    opt11 = True
    opt11@gsnShadeFillType = "pattern"        ; color is the default
    opt11@gsnShadeLow = 17                ; use color index 14
    opt11@gsnShadeHigh = 17
    opt11@cnLineColor = "grey49"
    opt11@cnFillDrawOrder = "Postdraw"
    opt11@gsLineThicknessF = .1
    opt11@gsLineColor = "gray49";
    opt11@gsLineOpacityF = 0.35
    opt11@gsFillScaleF = 5.
    opt11@cnFillDotSizeF = 0.25

    plot01s = gsn_csm_contour(wks,d01_test01s ,sres11) ;
    plot01s = gsn_contour_shade(plot01s,0.0,0.0,opt11)
    overlay(plot1(0),plot01s)

    plot01 = gsn_csm_contour(wks,d01_test01 ,sres11) ;
    plot01 = gsn_contour_shade(plot01,0.0,0.0,opt11)
    overlay(plot1(2),plot01)


    plot02 = gsn_csm_contour(wks,d20_test20,sres11) ;
    plot02 = gsn_contour_shade(plot02,0.0,0.0,opt11)
    overlay(plot1(4),plot02)
    
    
    
    plot001s = gsn_csm_contour(wks,d01_test001,sres11) ;
    plot001s = gsn_contour_shade(plot001s,0.0,0.0,opt11)
    overlay(plot1(1),plot001s)
    
    plot001 = gsn_csm_contour(wks,d02_test002,sres11) ;
    plot001 = gsn_contour_shade(plot001,0.0,0.0,opt11)
    overlay(plot1(3),plot001)


    plot002 = gsn_csm_contour(wks,d03_test003,sres11) ;
    plot002 = gsn_contour_shade(plot002,0.0,0.0,opt11)
    overlay(plot1(5),plot002)
    
;****************************Paneling********************************************
pres1                 = True
;pres1@gsnPanelRowSpec = True                   ; tell panel what order to plt
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent = 3.
pres1@gsnPanelXWhiteSpacePercent =2.
pres1@gsnPanelBottom  = 0.06
gsn_panel(wks,plot1,(/3,2/),pres1)

end
 
