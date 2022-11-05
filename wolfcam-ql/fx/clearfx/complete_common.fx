//╔══╦══╦╗──╔╦╗──╔╦══╦╗─╔╗──╔══╦══╗╔══╗
//║╔═╣╔╗║║──║║║──║║╔╗║╚═╝║──║╔═╩═╗║║╔═╝
//║║─║║║║╚╗╔╝║╚╗╔╝║║║║╔╗─║──║╚═╗─║╚╝║
//║║─║║║║╔╗╔╗║╔╗╔╗║║║║║╚╗║──║╔═╝─║╔╗║
//║╚═╣╚╝║║╚╝║║║╚╝║║╚╝║║─║║──║║─╔═╝║║╚═╗
//╚══╩══╩╝──╚╩╝──╚╩══╩╝─╚╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_haste_smoke   "1" - [eng] DUST WHILE HASTE [ru] ПЫЛЬ ОТ СКОРОСТИ
//fx_flight_smoke  "1" - [eng] DUST WHITLE FLIGHT [ru] ПЫЛЬ ОТ ПОЛЕТА
//fx_legs_smoke    "1" - [eng] DUST WHILE RUNNIG  [ru] ПЫЛЬ ПРИ БЕГЕ

player/haste {
if (fx_haste_smoke == 1) {
if velocity {
distance 5 {
		shader smoke_shot
		origin2 origin2-18+(1-rand)+(1-rand)+(1-rand)
		dir0 dir0 + crand * (0.2+rand*0.3)
		dir1 dir1 + crand * (0.2+rand*0.3)
		normalize dir

		t3 15 + rand * 25

		scale dir dir t3
		emitter 0.45 {
		alpha 0.1+lerp*1
		red 0.2+lerp*1
		blue 0.2+lerp*1
		green 0.2+lerp*1
			size t3
			alphaFade 0
			beam
			}
		}
	}
}
}

player/flight {
if (fx_flight_smoke == 1) {
distance 4 {
		shader smoke_shot
		origin2 origin2-18+(1-rand)+(1-rand)+(1-rand)
		dir0 dir0 + crand * (0.2+rand*0.3)
		dir1 dir1 + crand * (0.2+rand*0.3)
		normalize dir

		t3 35 + rand * 25

		scale dir dir t3
		emitter 0.45 {
		alpha 0.05+lerp
		red 0.2+lerp*1
		blue 0.2+lerp*1
		green 0.2+lerp*1
			size t3
			alphaFade 0
			beam
			}
		}
	}
}

player/legs/trail {
if (fx_legs_smoke == 1) {
if velocity {
distance 4 {
		shader smoke_shot
		origin2 origin2-18+(1-rand)+(1-rand)+(1-rand)
		dir0 dir0 + crand * (0.7+rand*0.3)
		dir1 dir1 + crand * (0.7+rand*0.3)
		normalize dir

		t3 10 + rand * 25

		scale dir dir t3
		emitter 0.45 {
		alpha 0.2+lerp/2
		red 0.2+lerp/2
		blue 0.2+lerp/2
		green 0.2+lerp/2
			size t3
			alphaFade 0
			beam
			}
		}
	}
}
}

player/talk {
}

player/impressive {
}

player/excellent {
}

player/holyshit {
}

player/accuracy {
}

player/gauntlet {
}

player/medalComboKill {
}

player/connection {
}
 
player/capture {
}

player/assist {
}

