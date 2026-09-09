begin
;**************************************************************
; Read data
;**************************************************************
;-------------------------------------------------
; Read data
;-------------------------------------------------
a1  = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS7/amoc_data.nc","r")

moc = a1->amoc  ; (depth, lat)
lat = a1->lat
z_m = a1->Depth; VERIFY UNITS

;-------------------------------------------------
; Convert negative depths to positive km
;-------------------------------------------------
z_km = abs(z_m) / 1000.0   ; 0 at surface → 5.5 km at bottom

;-------------------------------------------------
; Ensure monotonicity (linint1 requires increasing xi)
;-------------------------------------------------
if (z_km(0) .gt. z_km(dimsizes(z_km)-1)) then
  z_km = z_km(::-1)   ; reverse depth
  moc  = moc(::-1,:)  ; reverse corresponding data
end if

;-------------------------------------------------
; Define uniform depth grid for interpolation
;-------------------------------------------------
ndepths = 61
depth_uniform = fspan(0.0, 5.4, ndepths)   ; km

;-------------------------------------------------
; Interpolate AMOC onto uniform depth grid
;-------------------------------------------------
nlat = dimsizes(lat)
moc_interp = new((/ndepths, nlat/), typeof(moc), moc@_FillValue)

do i = 0, nlat-1
  moc_interp(:,i) = linint1(z_km, moc(:,i), False, depth_uniform, 0)
end do

;-------------------------------------------------
; Graphics
;-------------------------------------------------

;----------------------------------------------------------------------
  f66 = addfile("/Volumes/PS2/IGSM-CESM-PAPER-DATA/FIGURES-SUPP/FigS7/amoc_data.nc", "r")
  a6s = f66->amoc_max
  
  printVarSummary( a6s)
;----------------------------------------------------------------------

;----------------------------------------------------------------------


  ;-- Define time axis
  time1 = ispan(1850, 2100, 1)
  time2 = ispan(1, 651, 1)
  ;-- Plot settings
  wtype= "pdf"
  wtype@wkOrientation  = "landscape"
  wks = gsn_open_wks(wtype, "pr_jjas-plotqqq2")
  plot = new(5,graphic)

  pres1   = True
  pres1@gsnDraw   = False
  pres1@gsnFrame  = False
  pres1@vpWidthF = 1.15   ; Change the aspect ratio, but
  pres1@vpHeightF= 0.62
  pres1@xyLineThicknessF = 3.0
  
  pres1@txFont   = "Times-Bold"
  pres1@tiMainFont  = "Times-Bold"
 ; pres1@tiXAxisString = "Years"
  pres1@tiYAxisString = "AMOC Strength (Sv)"
  pres1@trXMinF   = 1
  pres1@trXMaxF   = 700
  pres1@tmYRTickSpacingF= .5
  pres1@tmXBTickStartF  =1
  pres1@tmXBTickEndF=700
  ;pres1@tmXBTickSpacingF= 2
pres1@tmXBMode   = "Manual";"Automatic"
pres1@tmXBMinorOn= True
pres1@tmXBTickSpacingF = 50
pres1@tmXBMinorPerMajor =4
  pres1@tmXBLabelAngleF = 45
  	
  pres1@tmXBMode= "Explicit"
  pres1@tmXBValues  = (/1,50,100,150,200,250,300,350,400,450,500,550,600,650,700/)
 pres1@tmXBMinorOn= True
 pres1@tmXBMinorPerMajor  = 4
 pres1@tmXMajorGrid   = True
 pres1@tmXMinorGrid   = True
  pres1@tmXBLabels  = (/"300","350","400","450","500","550","600","650","700","750","800","850","900","950","1000"/)
  pres1@txFont = 0.018
  pres1@txFontHeightF = 0.018
  
  pres1@tmXBLabelFont= "Times-roman"
  pres1@tiYAxisFont  = "Times-Bold"
  pres1@tiXAxisFont  = "Times-Bold"
  pres1@tmYLLabelFont= "Times-roman"
  
  pres1@tmXBMinorOn  = True
  pres1@tmYROn   = False
  pres1@tmYLMinorOn  = True
  pres1@tmXTOn   = False
  pres1@tmXBLabelFontHeightF = 0.019
  pres1@tmYLLabelFontHeightF = 0.019
  pres1@tiXAxisFontHeightF = 0.021
  pres1@tiYAxisFontHeightF = 0.021

 
 pres1@tmYMajorGridLineColor = "LightGrey"
 pres1@tmYMajorGrid= True  ; implement y grid
 pres1@tmYMajorGridThicknessF  = 1.0   ; 2.0 is default
 pres1@tmYMajorGridLineDashPattern = 2 ; select short dash line
 pres1@tmXMajorGridLineColor = "LightGrey"
 pres1@tmXMajorGrid= True  ; implement y grid
 pres1@tmXMajorGridThicknessF  = 1.0   ; 2.0 is default
 pres1@tmXMajorGridLineDashPattern = 2 ; select short dash line
 pres1@gsnLeftStringFontHeightF = 0.020
 pres1@gsnLeftStringOrthogonalPosF = 0.025
 pres1@gsnLeftStringParallelPosF= 0.030
 pres1@xyLineThicknessF=2.5
 
  
  pres11=pres1
  pres11@tmXBMinorOn= True
  pres11@tmXBMinorPerMajor  = 4
  pres11@tmXMajorGrid   = True
  pres11@tmXMinorGrid   = True
  pres11@xyLineColor  = "Blue"
  pres11@gsnLeftString = "a) AMOC NH Maximum"
  pres11@tiXAxisString = "CTRL Integration Years"
  pres11@txFont   = "Times-Bold"
  plot1 = gsn_csm_xy(wks, time2,  a6s , pres11)
  
 
   

plot(0)=plot1


res   = True
res@gsnDraw   =False
res@gsnFrame  = False
res@vpWidthF = 1.15   ; Change the aspect ratio, but
res@vpHeightF= 0.62
res@cnFillOn= True
res@cnFillPalette  = "BlAqGrYeOrReVi200";"MPL_RdBu"
res@gsnSpreadColors=True
res@gsnSpreadColorStart=0
res@gsnSpreadColorEnd=199
res@cnLinesOn  = False
res@cnLineLabelsOn = False
res@cnInfoLabelOn  = False

res@sfXArray   = lat
res@sfYArray   =   depth_uniform 
res@trYReverse = True; surface at top
res@trXMinF= -30
res@trXMaxF= 70
res@tmXBTickSpacingF = 10

res@tmXBMode = "Explicit" 
res@tmXBValues = (/ -50,-40,-30,-20,-10, 0, 10,20,30,40,50,60,70/)
res@tmXBLabels = (/"50S","40S","30S","20S","10S","EQ","10N","20N","30N","40N","50N","60N","70N"/)

res@tiXAxisString = "Latitude"
res@tiYAxisString = "Depth (km)"
res@tiMainString  = ""
res@lbOrientation   = "vertical"
res@lbBoxEndCapStyle =  "TriangleBothEnds" 
res@lbLabelFontHeightF  = 0.025
res@pmLabelBarHeightF   = 0.62
res@pmLabelBarWidthF= 0.075
res@pmLabelBarOrthogonalPosF = -0.01
res@lbLabelBarOn= True
res@tmYLMinorOn = False
res@tmYRMinorOn = False
res@tmYROn = False
res@tmXBMinorOn = False
res@tmXTOn = False
res@tmXBOn = True
res@tmXTOn=False
res@tmYROn=False
res@tmXBLabelFont= "Times-roman"
res@tiYAxisFont  = "Times-Bold"
res@tiXAxisFont  = "Times-Bold"
res@tmYLLabelFont= "Times-roman"
res@tmXBLabelFontHeightF = 0.020
res@tmYLLabelFontHeightF = 0.020
res@tiXAxisFontHeightF = 0.022
res@tiYAxisFontHeightF = 0.022
res@gsnLeftString = "b) "
res@txFont   = "Times-Bold"
; Missing values
res@cnMissingValPerimOn = True
res@cnMissingValFillPattern = 3
res@cnMissingValFillColor   = "black"

;-------------------------------------------------
; Plot interpolated AMOC
;-------------------------------------------------
plot(1) = gsn_csm_contour(wks,  moc_interp, res)

; Panel
pres1 = True
pres1@gsnDraw  = True
pres1@gsnFrame = True
pres1@gsnMaximize = True
pres1@gsnPanelYWhiteSpacePercent = 1.
pres1@gsnPanelXWhiteSpacePercent =1.
pres1@gsnPanelBottom  = 0.06
gsn_panel(wks, plot, (/2,1/), pres1)

end