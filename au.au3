Opt("PixelCoordMode", 2)
Opt("MouseCoordMode", 2);relative coords to the client area of the active window
Opt("SendKeyDelay", 40)
Opt("SendKeyDownDelay", 40)
Opt("MouseClickDelay", 80)
Opt("MouseClickDownDelay", 80)
Opt("MouseClickDragDelay", 20)

HotKeySet("{END}","Seed")
HotKeySet("{Home}","Stop")


Global $HealthBarColY[]=[49,0x372A11]
Global $HealthBarX[]=[7,305]
Global $coord[2]
Global $skill[4]=[4,0,2,2] ;0-без сочетания, 1 Shift+ , 2- Shift+Alt+
Global $stop=0
Global $column[3]=[350,20,0x304050]
Global $Rctgl[4]=[300,800,50]
Global $k=0
;AdlibRegister("HeathChk",150)

WinActivate("- Arche")
while (1)
WinWaitActive("- Arche")
ToolTip("HP,% = "&HealthChk(),150,23)
Sleep(300)
Wend


Func HealthChk()
	$coord = PixelSearch($HealthBarX[0],$HealthBarColY[0],$HealthBarX[1],$HealthBarColY[0],$HealthBarColY[1])
	If @error Then
		$coordx=-1 ;полные хп
		Return $coordx
	EndIf
	$coordx=($coord[0]-$HealthBarX[0])/($HealthBarX[1]-$HealthBarX[0])
	Return $coordx
EndFunc
Func Stop()
	$stop=1
EndFunc
Func ChPosition()

	EndFunc
Func Set_rctgl()

	$x0=PixelSearch($Rctgl[0],0,$Rctgl[0]+100,200,$Rctgl[2],5)
	If Not @error Then
		$y0=PixelSearch($x0[0]-10,$x0[1]+20,$x0[0]+10,$x[1]+100,$Rctgl[2],5)
		If Not @error Then
			$x1=PixelSearch($Rctgl[1]-100,0,$Rctgl[1],200,$Rctgl[2],5,1)
				If Not @error Then
				$Rctgl[0]=$x0[0]+36
				$Rctgl[1]=$x1[0]-36
				$Rctgl[2]=$x0[1]+36
				$k=($x1[1]-$x0[1])/($x1[0]-$x0[0])
				$Rctgl[3]=$x0[1]-$k*$x0[0]
				Return
			EndIf
		EndIf
	EndIf

return -2

EndFunc

Func Kx($x)

return $k*$x

EndFunc


Func SeedN()
	WinWaitActive("- Arche")
	$stop=0
	$row=0
	$shift=75
	$shifty=65
	$rndShift=0
	$n=10
	Set_rctgl()
	For $j=0 to 4
		For $i=0 to $n
			WinWaitActive("- Arche")
			Send("=")
			$rndShift=Random(0, 5, 1)
			MouseMove($Rctgl[0]+$i*$shift+Random(-3,3,1),Kx($Rctgl[1]+$j*$shifty+Random(0,3,1))
			Sleep(Random(200,300,1))
			MouseClick("Left")
			Sleep(Random(200,300,1))
			MouseClick("Left")
			Sleep(Random(2000,2500,1))
			MouseClick("Right")
			Sleep(Random(400,700,1))
			if $stop=1 Then Return
		Next

		if (($j==1) OR ($j==3)) then
		$n=9
		$coordseed[0]-=30
	Else
		$coordseed[0]+=30
		$n=10
		EndIf
	Next

	EndFunc


Func Seed()
	WinWaitActive("- Arche")
	$stop=0
	$row=0
	$shift=75
	$shifty=65
	$rndShift=0
	$n=10
	$coordseed=MouseGetPos()
	For $j=0 to 4
		For $i=0 to $n
			WinWaitActive("- Arche")
			Send("=")
			$rndShift=Random(0, 5, 1)
			MouseMove($coordseed[0]+$i*$shift+Random(-3,3,1),$coordseed[1]+$j*$shifty+Random(0,3,1))
			Sleep(Random(200,300,1))
			MouseClick("Left")
			Sleep(Random(200,300,1))
			MouseClick("Left")
			Sleep(Random(2000,2500,1))
			MouseClick("Right")
			Sleep(Random(400,700,1))
			if $stop=1 Then Return
		Next

		if (($j==1) OR ($j==3)) then
		$n=9
		$coordseed[0]-=30
	Else
		$coordseed[0]+=30
		$n=10
		EndIf
	Next

	EndFunc

