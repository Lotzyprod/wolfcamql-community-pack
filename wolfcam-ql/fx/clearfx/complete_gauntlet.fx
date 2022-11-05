//╔═══╦══╦╗╔╦╗─╔╦════╦╗─╔═══╦════╗──╔══╦══╗╔══╗
//║╔══╣╔╗║║║║╚═╝╠═╗╔═╣║─║╔══╩═╗╔═╝──║╔═╩═╗║║╔═╝
//║║╔═╣╚╝║║║║╔╗─║─║║─║║─║╚══╗─║║────║╚═╗─║╚╝║
//║║╚╗║╔╗║║║║║╚╗║─║║─║║─║╔══╝─║║────║╔═╝─║╔╗║
//║╚═╝║║║║╚╝║║─║║─║║─║╚═╣╚══╗─║║────║║─╔═╝║║╚═╗
//╚═══╩╝╚╩══╩╝─╚╝─╚╝─╚══╩═══╝─╚╝────╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//[eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_gauntlet_b               "0.0" - [eng] BLUE COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА
//fx_gauntlet_g               "0.4" - [eng] GREEN COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА
//fx_gauntlet_r               "0.8" - [eng] RED COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА
//fx_gauntlet_flash            "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ПИЛЫ
//fx_gauntlet_fire             "1"  - [eng] FIRE ON THE BLADE [ru] ОГОНЬ НА ЛЕЗВИИ ПИЛЫ
//fx_gauntlet_fire_size        "5"  - [eng] FIRE SIZE [ru] РАЗМЕР ОГНЯ
//fx_gauntlet_particles        "1"  - [eng] PARTICLES WHEN FIRED [ru] ИСКРЫ ПРИ РАБОТЕ
//fx_gauntlet_particles_size   "2"  - [eng] PARTICLES SIZE [ru] РАЗМЕР ИСКР
//...
//...
//fx_enable                    "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style                "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)

weapon/gauntlet/flash {
if (fx_gauntlet_flash == 1) {
emitter 0.001 {
red fx_gauntlet_r
green fx_gauntlet_g
blue fx_gauntlet_b

		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
	}
}
if (fx_enable == 1) {
if (fx_gauntlet_particles == 1) {
	copy velocity v5 
	v52 v52 * 0.00 

	angles0 -angles0
	if angles1 < 0 {
		angles1 angles1 + 360
	}
	v00 cos( angles1 ) * cos( angles0 )
	v01 sin( angles1 ) * cos( angles0 )
	v02 sin( angles0 ) // ++

	random v2
	addScale v0 v2 v0 0.5
	normalize v0

	copy origin v3
	random v2
	addScale origin v2 origin 5

	t1 100// + rand * 50
	t2 100// + rand * 150
	scale v0 v0 t1
	copy v0 velocity

	add velocity v5 velocity
	interval 0.003 {
			red fx_gauntlet_r+rand*rand*0.2
			green fx_gauntlet_g+rand*rand*0.2
			blue fx_gauntlet_b+rand*rand*0.2
			
			red clip(red+0.1)
			green clip(green+0.1)
			blue clip(blue+0.1) 
	if( rand > 0.75 ) {
		emitter 0.35 {

			moveBounce t2 0.8

			size fx_gauntlet_particles_size/4 * ( 1 - lerp ) + fx_gauntlet_particles_size/4
			width fx_gauntlet_particles_size/4 * ( 1 - lerp ) + fx_gauntlet_particles_size/8
			shader prt_circle_blur
			spark

			size fx_gauntlet_particles_size/20+rand*fx_gauntlet_particles_size/3
			shader prt_circle_blur
			sprite
		}
	}
}
}
if (fx_gauntlet_fire == 1) {
	copy v3 origin
			red fx_gauntlet_r
			green fx_gauntlet_g
			blue fx_gauntlet_b
			
			red clip(red+0.1)
			green clip(green+0.1)
			blue clip(blue+0.1)
	repeat fx_gauntlet_fire_size*10 {
		shaderList rand {
				prt_fire1
				prt_fire2
				prt_fire3
				prt_fire4
				prt_fire5
				prt_fire6
				prt_fire7
				}

			size fx_gauntlet_fire_size/6 + fx_gauntlet_fire_size/2 * rand
			random dir
			quad
			}
		}
	}
}


weapon/gauntlet/impactflesh {
if (fx_gibs_Style == 1) {
color 1 1 1
	repeat 30 {
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
		t0 40 + crand * 20 
		
		emitter 0.68 {
			size 10 + t0 * clip( lerp * 6 ) + 20 * lerp

			if lerp > 0.7 {
				alpha 1 - ( lerp - 1 ) * 3.3
			}

			colorFade 0.15
			quad
		}
	}

	copy origin v3

	repeat 10 {
		copy v3 origin
		origin0 origin0 + 10 * crand
		origin1 origin1 + 10 * crand
		origin2 origin2 + 10 * crand

		shaderList loop {
			Blood1
			Blood2
			Blood3
		}

		random dir
		t0 10 + crand * 15 // size
		t1 crand * 15 // rotation speed
		t2 rand * 360 // rotation

		emitter 0.5 + rand * 0.5 {
			size 10 + t0 * clip( lerp * 6 ) + 20 * lerp
			rotate t2 + t1 * time

			alphaFade 0
			colorFade 0
			
			sprite
		}
	}

	shader BloodTexture

	repeat 30 {
		copy v3 origin

		origin0 origin0 + crand * 10
		origin1 origin1 + crand * 10
		origin2 origin2 + crand * 20

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

		random		v0
		v02			v02 + 1
		addScale	parentVelocity v0 velocity 150 + rand * 100
		scale velocity velocity 0.5
		yaw			360 * rand
		pitch		360 * rand
		roll		360 * rand
		size 0.15 + rand * 0.2
		emitter 3 + rand * 3 {
			moveBounce 200 0.2

			impact 5 {
				if( rand > 0.7 ) {
					shaderList rand {
						BloodHit1
						BloodHit2
						BloodHit3
						BloodHit4
						BloodHit5
					}

					size 15 + rand * 30
					rotate 360 * rand

					t0 0.2 + rand * 0.1
					red t0
					green t0
					blue t0

					decal alpha
				}
			}

			distance 20 * rand + 10 {
				emitter 0.1 {
					size 6 + lerp * 4
					shaderList rand {
						BloodHit1
						BloodHit2
						BloodHit3
						BloodHit4
						BloodHit5
					}

					sprite
				}
			}

			size 0.1 + 0.005 * rand
			anglesModel
			}
		}	
	}
}