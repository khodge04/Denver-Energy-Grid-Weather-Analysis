
program DenverEnergyGridAnalysisProject
implicit none

!Today ill be creating a program to reanalyze how the a denver weather grid could be impacted by a winter weather event. 

!--------------------------------------------------
!Project Info
!--------------------------------------------------


! Denver Energy Grid Weather Impact Assessment
! February 15 2021 Arctic Cold Outbreak at 12 UTC 
! Data: University of Wyoming Sounding Data Reanalysis
! Location: Denver, CO


!--------------------------------------------------
!Data Dictonary 
!--------------------------------------------------

character(len=15) :: coldrisk, windrisk , winterweatherrisk , gridrisk

!data variables
real :: pres
real :: height
real :: dew
real :: temp
real :: rh
real :: mixr
real :: windspd
real :: winddir
real :: shear
real :: tempdif
real :: tempsfc
real :: temp700
real :: temp550
real :: windsfc
real :: wind700
real :: wind550

!--------------------------------------------------
!Data Readin Section
!--------------------------------------------------
!this is where ill read in the data from that sounding 


open(unit=10,file="DenverEnergyProjectImput.txt",status="old",action="read")


! Skip header information
read(10,*)
read(10,*)
read(10,*)
read(10,*)
read(10,*)
read(10,*)
read(10,*)


! Read sounding data
do

read(10,*,end=100) pres,height,temp,dew,rh,mixr,winddir,windspd


! Surface level (834 mb)
if (pres >= 830.0 .and. pres <= 840.0) then
  tempsfc = temp
  windsfc = windspd
  end if
  

! 700 mb level
if (pres >= 690.0 .and. pres <= 710.0) then
 temp700 = temp
 wind700 = windspd
 end if


! 550 mb level
if (pres >= 540.0 .and. pres <= 550.0) then
 temp550 = temp
 wind550 = windspd
 end if


end do


100 continue
close(10)



tempdif = temp700 - tempsfc
shear = wind550 - windsfc




!--------------------------------------------------
!Risk Determination Section
!--------------------------------------------------

!this is where ill determine what the risk would be on the grid depending on what variable and amount reached


! Cold Demand Risk

if (tempsfc <= -15.0) then

 coldrisk = "HIGH"

else if (tempsfc <= -5.0) then

 coldrisk = "MODERATE"

else

 coldrisk = "LOW"

end if



! Wind Operational Risk

if (windsfc >= 18.0) then 

 windrisk = "HIGH"

else if (windsfc >= 10.0) then

 windrisk = "MODERATE"

else

 windrisk = "LOW"

end if



! Cold Air Depth / Winter Weather Risk

if (temp700 <= -10.0) then

 winterweatherrisk = "HIGH"

else if (temp700 <= -5.0) then

 winterweatherrisk = "MODERATE"

else

 winterweatherrisk = "LOW"

end if



! Overall Grid Risk

if (coldrisk == "HIGH" .or. windrisk == "HIGH" .or. winterweatherrisk == "HIGH") then

 gridrisk = "HIGH"


else if (coldrisk == "MODERATE" .or. winterweatherrisk == "MODERATE") then

 gridrisk = "MODERATE"


else

 gridrisk = "LOW"


end if


!--------------------------------------------------
!Output Section
!--------------------------------------------------


write(*,*) "------------------------------------------"
write(*,*) "DENVER ENERGY GRID WEATHER RISK ASSESSMENT"
write(*,*) "------------------------------------------"

write(*,*) "Location: Denver, CO"
write(*,*) "Date: February 15 2021"
write(*,*) "Time: 12 UTC"

write(*,*)

write(*,*) "Atmospheric Conditions"

write(*,"(A,F6.2,A)") "Surface Temperature: ", tempsfc, " C"
write(*,"(A,F6.2,A)") "700mb Temperature: ", temp700, " C"
write(*,"(A,F6.2,A)") "550mb Temperature: ", temp550, " C"

write(*,"(A,F6.2,A)") "Surface Wind: ", windsfc, " m/s"
write(*,"(A,F6.2,A)") "700mb Wind: ", wind700, " m/s"
write(*,"(A,F6.2,A)") "550mb Wind: ", wind550, " m/s"

write(*,"(A,F6.2,A)") "Temperature Difference: ", tempdif, " C"
write(*,"(A,F6.2,A)") "Wind Shear: ", shear, " m/s"


write(*,*)

write(*,*) "Energy Grid Risk"

write(*,"(A,A)") "Cold Demand Risk: ", coldrisk
write(*,"(A,A)") "Wind Operational Risk: ", windrisk
write(*,"(A,A)") "Winter Weather Risk: ", winterweatherrisk
write(*,"(A,A)") "Overall Grid Risk: ", gridrisk



end program DenverEnergyGridAnalysisProject

