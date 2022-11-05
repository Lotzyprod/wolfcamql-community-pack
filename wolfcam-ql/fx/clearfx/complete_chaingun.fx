//╔══╦╗╔╦══╦══╦╗─╔╦═══╦╗╔╦╗─╔╗──╔══╦══╗╔══╗
//║╔═╣║║║╔╗╠╗╔╣╚═╝║╔══╣║║║╚═╝║──║╔═╩═╗║║╔═╝
//║║─║╚╝║╚╝║║║║╔╗─║║╔═╣║║║╔╗─║──║╚═╗─║╚╝║
//║║─║╔╗║╔╗║║║║║╚╗║║╚╗║║║║║╚╗║──║╔═╝─║╔╗║
//║╚═╣║║║║║╠╝╚╣║─║║╚═╝║╚╝║║─║║──║║─╔═╝║║╚═╗
//╚══╩╝╚╩╝╚╩══╩╝─╚╩═══╩══╩╝─╚╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//[eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_chaingun_r          "0.7" - [eng] RED COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА
//fx_chaingun_g          "0.4" - [eng] GREEN COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА
//fx_chaingun_b          "0.0" - [eng] BLUE COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА
//fx_chaingun_tracer      "1"  - [eng] ENABLE BULLET TRAIL? [ru] СЛЕД ОТ ВЫСТРЕЛА ПУЛЕМЕТА
//fx_chaingun_flash       "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_chaingun_shells      "1"  - [eng] SHELLS WHEN FIRED [ru] ГИЛЬЗЫ ПОСЛЕ ВЫСТРЕЛА
//fx_chaingun_vibrate     "1"  - [eng] SHOT VIBRATION [ru] ВИБРАЦИЯ ЭКРАНА ОТ ВЫСТРЕЛА
//fx_chaingun_impact_size "2"  - [eng] SHOT/IMPACT SIZE [ru] РАЗМЕР СЛЕДА ОТ ВЫСТРЕЛА
//...
//...
//fx_enable                 "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style             "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)
//fx_gibs_sparks_size       "1"  - [eng] GIBS SPARKS SIZE [ru] РАЗМЕР ИСКР
//fx_gibs_sparks_r         "1.0" - [eng] RED SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_g         "1.0" - [eng] GREEN SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_b         "1.0" - [eng] BLUE SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА В ИСКРАХ


weapon/chaingun/flash {
if fx_enable == 0 {
if (fx_chaingun_flash == 1) {
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
if (fx_chaingun_flash == 1) {
	emitter 0.07 {
		red fx_chaingun_r
		green fx_chaingun_g
		blue fx_chaingun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}
weapon/chaingun/trail {
if (fx_enable == 0) {
if (fx_chaingun_tracer == 1) {
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
if (fx_chaingun_tracer == 1) {
		red fx_chaingun_r
		green fx_chaingun_g
		blue fx_chaingun_b
	
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

weapon/chaingun/fire {
    soundlistweapon {
        sound/weapons/vulcan/vulcanf1b
        sound/weapons/vulcan/vulcanf2b
        sound/weapons/vulcan/vulcanf3b
        sound/weapons/vulcan/vulcanf4b
    }
if ( fx_chaingun_shells == 1 ) {
vibrate fx_chaingun_vibrate
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

weapon/chaingun/impact {
if (fx_enable == 0) {
	vibrate fx_chaingun_vibrate
	
		shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}
	size fx_chaingun_impact_size*3
	rotate 360 * rand
	Decal

	size fx_chaingun_impact_size*0.2
	shader smoke_animated3
	color	1 0.6 0.3
	model		models/weaphits/bullet.md3
	rotate		rand*360
	emitter 0.6 {
		dirModel
	}

	wobble	dir velocity 10 + rand*30
	scale	velocity velocity 200 + rand*50
	size	fx_chaingun_impact_size*0.5
	shader	prt_sun
	alpha	1

	emitter 0.6 + rand*0.3 {
		moveGravity 200
		colorFade 0.6
		Sprite
	}
}

if (fx_enable == 1) {

		red fx_chaingun_r
		green fx_chaingun_g
		blue fx_chaingun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
	emitter 0.1 {
	size fx_chaingun_impact_size*10 + fx_chaingun_impact_size*5 * rand
	light
	}
	
	vibrate fx_chaingun_vibrate

	shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}

	size fx_chaingun_impact_size*3
	rotate 360 * rand
	decal

	size fx_chaingun_impact_size*0.2
	shader smoke_animated3
	
	model		models/weaphits/bullet.md3
	rotate		rand*360
	emitter 0.6 {
		dirModel
	}

	if rand > 0.1 {
		color 0.1 0.1 0.1
		shader smoke_shot
		alpha 0.5
		t0 rand*fx_chaingun_impact_size*10 + fx_chaingun_impact_size*2.5
		scale dir dir t0
		emitter 0.45 {
			size t0

			alphaFade 0

			beam
		}
	}

	modelList rand {
		source/stones/models/stone1.md3
		source/stones/models/stone2.md3
		source/stones/models/stone3.md3
		source/stones/models/stone4.md3
		source/stones/models/stone5.md3
		source/stones/models/stone6.md3
		source/stones/models/stone7.md3
		source/stones/models/stone8.md3
	}

	if rand > 0.4 {
		wobble dir velocity fx_chaingun_impact_size*2.5 + rand * fx_chaingun_impact_size*5
		scale velocity velocity fx_chaingun_impact_size*75 + rand * fx_chaingun_impact_size*50
		size fx_chaingun_impact_size*0.015 + fx_chaingun_impact_size*0.005 * rand
		shader stone1
		emitter 3 {
			moveBounce 800 0.67
			dirModel
		}
	}

repeat 5 + fx_chaingun_impact_size*0.05 {
	color 0.2 0.2 0.2
	shader smoke_puff
	alpha 0.5
	t0 fx_chaingun_impact_size*2.5 + rand * fx_chaingun_impact_size*7.5
		
	wobble dir velocity fx_chaingun_impact_size*7.5 + rand * fx_chaingun_impact_size*20
	scale velocity velocity fx_chaingun_impact_size*5 + rand * fx_chaingun_impact_size*50
		
	emitter 0.45 {
			size fx_chaingun_impact_size*0.5 + lerp * t0
			colorFade 0.1
			moveBounce 80 0.67
			sprite
			}
		}
	}
}

weapon/chaingun/impactflesh {
if (fx_gibs_style == 1) {
	color 1 1 1
	
		repeat 5 {
		shaderList loop {
			AnimatedBlood1
			AnimatedBlood2
			AnimatedBlood3
			AnimatedBlood4
			AnimatedBlood5
			AnimatedBlood6
			AnimatedBlood7
			AnimatedBlood8
			AnimatedBlood9
			AnimatedBlood10
			AnimatedBlood11
			AnimatedBlood12
		}

		random dir
		t0 5 + crand * 10
		
		emitter 0.5 {
			size 0.8 + t0 * clip( lerp * 6 ) + 5 * lerp

			if lerp > 0.7 {
				alpha 1 - ( lerp - 0.7 ) * 3.3
			}

			colorFade 0
			quad
		}
	}	

	shaderClear
	shader BloodTexture
	repeat 1 {
		modellist loop {
			source/stones/models/stone1.md3
			source/stones/models/stone2.md3
			source/stones/models/stone3.md3
			source/stones/models/stone4.md3
			source/stones/models/stone5.md3
			source/stones/models/stone6.md3
			source/stones/models/stone7.md3
			source/stones/models/stone8.md3
			
		}
		size 0
		random		v0
		v02			v02 + 1
		addScale	parentVelocity v0 velocity 100 + rand * 200
		scale		velocity velocity 0.5
		yaw			360 * rand
		pitch		360 * rand
		roll		360 * rand
		emitter 5 + rand * 3 {
			sink 0.9 50
			size 0
			impact 5 {


				shaderList rand {
					BloodHit1
					BloodHit2
					BloodHit3
					BloodHit4	
					BloodHit5
				}

				color 0.2 0.2 0.2

				size 13 + rand * 8
				decal alpha

			}
			size 0.00+rand*0.01
			moveBounce 800 0.35
			anglesModel
		}
	}
}

if (fx_gibs_style == 2) {
		red fx_gibs_sparks_r
		green fx_gibs_sparks_g
		blue fx_gibs_sparks_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  
		

		shader prt_circle_blur
		wobble	dir velocity fx_gibs_sparks_size*20+rand*fx_gibs_sparks_size*50
		scale	velocity velocity fx_gibs_sparks_size*20+rand*fx_gibs_sparks_size*50
	repeat 2 {
		t0 rand*fx_gibs_sparks_size/2
		emitter 0.5 {
			size fx_gibs_sparks_size/2+t0


			colorFade 0
			movebounce 500 0.5
			sprite
			}
		}
	}
}
