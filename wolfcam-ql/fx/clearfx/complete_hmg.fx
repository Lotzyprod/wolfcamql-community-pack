//╔╗╔╦╗──╔╦═══╗──╔══╦══╗╔══╗
//║║║║║──║║╔══╝──║╔═╩═╗║║╔═╝
//║╚╝║╚╗╔╝║║╔═╗──║╚═╗─║╚╝║
//║╔╗║╔╗╔╗║║╚╗║──║╔═╝─║╔╗║
//║║║║║╚╝║║╚═╝║──║║─╔═╝║║╚═╗
//╚╝╚╩╝──╚╩═══╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//[eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_hmg_r                 "0.7" - [eng] RED COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА
//fx_hmg_g                 "0.4" - [eng] GREEN COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА
//fx_hmg_b                 "0.0" - [eng] BLUE COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА
//fx_hmg_tracer             "1"  - [eng] ENABLE BULLET TRAIL? [ru] СЛЕД ОТ ВЫСТРЕЛА ПУЛЕМЕТА
//fx_hmg_flash              "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_hmg_shells             "1"  - [eng] SHELLS WHEN FIRED [ru] ГИЛЬЗЫ ПОСЛЕ ВЫСТРЕЛА
//fx_hmg_vibrate            "1"  - [eng] SHOT VIBRATION [ru] ВИБРАЦИЯ ЭКРАНА ОТ ВЫСТРЕЛА

weapon/hmg/flash {
if fx_enable == 0 {
if (fx_hmg_flash == 1) {
	emitter 0.07 {
			color	1 0.6 0.3
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
if fx_enable == 1 {
if (fx_hmg_flash == 1) {
	emitter 0.07 {
		red fx_hmg_r
		green fx_hmg_g
		blue fx_hmg_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}
weapon/hmg/trail {
if (fx_enable == 0) {
if (fx_hmg_tracer == 1) {
		color	1 0.6 0.3
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
        if (rand > 0.4) {
            return
        }
		
repeat 10 {
        normalize dir
        addscale origin dir origin (rand * 160)

        sub end origin v0
        t0 v0   // t0 == distance
        if (t0 < (2.0 * 30)) { 
            return
        }

        addscale end dir end -100
        sub end origin v1
        t1 v1  // t1 == adjusted distance
        if ( t1 > 1000 ) {
		t1 1500
		}

        scale dir velocity 4500.0
        shader prt_circle_blur
        size 1  // 0.8 rtcw
        copy dir v3
        copy origin v5
        emitter (t1 / 4500.0) { 
            addscale v5 v3 origin (t1 * lerp)

            addscale origin v3 v4 100
            sub v4 origin dir
            beam
        }
        addscale v5 dir origin (100 / 2.0)
		}
	}
	sound sound/weapons/machinegun/buletby1.wav
}
if (fx_enable == 1) {
if (fx_hmg_tracer == 1) {
		red fx_hmg_r
		green fx_hmg_g
		blue fx_hmg_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
        if (rand > 0.4) {
            return
        }
		
repeat 10 {
        normalize dir
        addscale origin dir origin (rand * 160)

        sub end origin v0
        t0 v0   // t0 == distance
        if (t0 < (2.0 * 30)) { 
            return
        }

        addscale end dir end -100
        sub end origin v1
        t1 v1  // t1 == adjusted distance
        if ( t1 > 1000 ) {
		t1 1500
		}

        scale dir velocity 4500.0
        shader prt_circle_blur
        size 1  // 0.8 rtcw
        copy dir v3
        copy origin v5
        emitter (t1 / 4500.0) { 
            addscale v5 v3 origin (t1 * lerp)

            addscale origin v3 v4 100
            sub v4 origin dir
            beam
        }
        addscale v5 dir origin (100 / 2.0)
		}
	}
	sound sound/weapons/machinegun/buletby1.wav
}
}

weapon/hmg/fire {
	soundweapon sound/weapons/hmg/machgf1b
if ( fx_hmg_shells == 1 ) {
vibrate fx_hmg_vibrate
	repeat 1 {
	normalize dir

	copy dir v5

	scale dir dir 3
	add origin dir origin
	normalize dir

	copy dir v3
	copy origin v2

	t3 4 // loop count -1
	t0 rand * 45
	copy parentDir dir
	color 1 0.8 0.6

		copy v3 dir
		copy v2 origin

		clear v0
		clear v1

		normalize dir
		perpendicular dir v0
	
		t1 loopCount / t3 // recalculate loop var
		rotatearound v0 dir v1 ( t1 * 360 + t0 )

		normalize v1

	copy v5 dir
	copy v2 origin
	normalize dir

	scale dir dir -15
	add origin dir origin

	random v5
	scale v5 v5 ( 50 + rand * 50 )

	model source/models/gun_shell.md3
	color 0.2 0.2 0.2
	size 0.07

	random v4

	emitter 15 {
		dir0 sin( time * 1000 ) * 20 * v40
		dir1 cos( time * 1000 ) * 20 * v41
		dir2 sin( time * 1000 ) * 20 * v42

		distance 4 {
			if( rand > 0.75 ) {
				if( lerp < 0.1 ) {
					emitter 0.45 {
						moveGravity 0
						clear velocity
		
							size 5
							shader smoke_puff
							color 0.25 0.25 0.25
							colorFade 0
							sprite
					}
				}
			}
		}

		copy v5 velocity 

		moveBounce 200 0.7
		dirModel
		}
	}
}
}


