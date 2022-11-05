//╔╗─╔╦══╦══╦╗─╔═══╦╗╔╦╗─╔╗──╔══╦══╗╔══╗
//║╚═╝║╔╗╠╗╔╣║─║╔══╣║║║╚═╝║──║╔═╩═╗║║╔═╝
//║╔╗─║╚╝║║║║║─║║╔═╣║║║╔╗─║──║╚═╗─║╚╝║
//║║╚╗║╔╗║║║║║─║║╚╗║║║║║╚╗║──║╔═╝─║╔╗║
//║║─║║║║╠╝╚╣╚═╣╚═╝║╚╝║║─║║──║║─╔═╝║║╚═╗
//╚╝─╚╩╝╚╩══╩══╩═══╩══╩╝─╚╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_nailgun_flash                          "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_nailgun_projectile_size                "10" - [eng] NAIL SIZE [ru] РАЗМЕР ГВОЗДЯ
//fx_nailgun_projectile_smoke1              "0"  - [eng] SMOKE 1 [ru] ДЫМ 1
//fx_nailgun_projectile_smoke1_size         "1"  - [eng] FIRST TYPE OF SMOKE SIZE [ru] РАЗМЕР ДЫМА ПЕРВОГО ТИПА
//fx_nailgun_projectile_smoke1_length      "0.05"- [eng] FIRST TYPE OF SMOKE LENGTH [ru] ДЛИНА ДЫМА ПЕРВОГО ТИПА
//fx_nailgun_projectile_smoke2              "1"  - [eng] SMOKE 2 [ru] ДЫМ 2
//fx_nailgun_projectile_smoke2_size         "3"  - [eng] SIZE OF SMOKE OF SECOND TYPE [ru] РАЗМЕР ДЫМА ВТОРОГО ТИПА
//fx_nailgun_projectile_smoke2_length      "0.1" - [eng] LENGTH OF SMOKE OF THE SECOND TYPE [ru] ДЛИНА ДЫМА ВТОРОГО ТИПА
//fx_nailgun_projectile_smoke2_alpha       "0.1" - [eng] TRANSPARENCY SMOKE OF THE SECOND TYPE [ru] ПРОЗРАЧНОСТЬ ДЫМА ВТОРОГО ТИПА
//fx_nailgun_projectile_smoke2_whiteratio  "0.7" - [eng] RELATIONSHIP WHITE TO BLACK COLOR OF SMOKE [ru] СООТНОШЕНИЕ БЕЛОГО К ЧЕРНОМУ ЦВЕТУ ДЫМА
//...
//...
//fx_enable                                "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style                            "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)


weapon/nailgun/flash {
if ( fx_enable == 0 ) {
if (fx_nailgun_flash == 1) {
	emitter 0.05 {
		color 1 0.5 0.1
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
if ( fx_enable == 1 ) {
if (fx_nailgun_flash == 1) {
	emitter 0.05 {
		color 1 1 1
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}

weapon/nailgun/projectile {
if (fx_enable == 0) {
        if velocity {
	model		"models/weaphits/nail.md3"
	rotate time * 1000 / 4
	size (fx_nailgun_projectile_size/12)
	dirModel
	}
}

if (fx_enable == 1) {
        if velocity {
	model		"models/weaphits/nail.md3"
	rotate time * 1000 / 4
	size (fx_nailgun_projectile_size/12)
	dirModel
	}
	
	distance 2+rand {	
	if (fx_nailgun_projectile_smoke2 = 1) {	
		alpha fx_nailgun_projectile_smoke2_alpha
		t0 360 * rand
		t1 10 * rand
		t2 (fx_nailgun_projectile_smoke2_size)/4*rand
		random dir

		red fx_nailgun_projectile_smoke2_whiteratio
		blue fx_nailgun_projectile_smoke2_whiteratio
		green fx_nailgun_projectile_smoke2_whiteratio

		emitter (fx_nailgun_projectile_smoke2_length)*rand {
			if( lerp > 0.8 ) {
				alpha 1 - ( 1 - lerp ) * 5	
			}

			rotate t0 
			size (fx_nailgun_projectile_smoke2_size*3/4) + lerp * t2
			alphaFade 0.5

			shader Smoke_Puff
			sprite
			}	
		}
			random dir
	if (fx_nailgun_projectile_smoke1 = 1) {	
		color 1 1 1
				t0 360 * rand
			t1 10 * rand
		t2 (fx_nailgun_projectile_smoke1_size)/4*rand
		emitter (fx_nailgun_projectile_smoke1_length)*rand {
			shaderList rand {
				prt_fire1
				prt_fire2
				prt_fire3
				prt_fire4
				prt_fire5
				prt_fire6
			}
			rotate t0 
			size fx_nailgun_projectile_smoke1_size + lerp * 4
			colorFade 0
			alphaFade 0

			quad

				}
			}
		}
	}
}

weapon/nailgun/impact {
	sound sound\weapons\nailgun/wnalimpd
	// Mark on the wall, using direction from parent
		    rotate rand*360
			size	(fx_nailgun_projectile_size/12)
			shaderList rand {
						impact1
						impact2
						impact3
						impact4
						impact5
						impact6
						impact7
						impact8
						impact9
						impact10
						}
				repeat 3 {

				Decal
				}
	shaderclear
	emitter 10 {
	model		"models/weaphits/nail.md3"
	size (fx_nailgun_projectile_size/12)
	dir1 -dir1
	dir2 -dir2
	dir0 -dir0
	dirModel		
	
		}
}

weapon/nailgun/impactflesh {
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

weapon/nailgun/trail {
if (fx_enable == 0) {
	color	0.6 0.6 0.6
	alpha	0.1
repeat 2 {
	rotate	360 * rand
	distance 5+rand*2 {
	
		emitter 1.2 +rand*1 {
			shaderlist rand {
	smokepuff1
	smokepuff2
	smokepuff3
	smokepuff4
	smokepuff5
	smokepuff6
	smokepuff7
	smokepuff8
	smokepuff9
	smokepuff10
	smokepuff11
	smokepuff12
	}
			alphaFade	0
			size		2 + lerp * 5
			sprite		cullNear
		}
	}
}
}
}




