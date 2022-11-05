//╔╗─╔══╦═══╦╗╔╦════╦╗─╔╦══╦╗─╔╦═══╗──╔══╦══╗╔══╗
//║║─╚╗╔╣╔══╣║║╠═╗╔═╣╚═╝╠╗╔╣╚═╝║╔══╝──║╔═╩═╗║║╔═╝
//║║──║║║║╔═╣╚╝║─║║─║╔╗─║║║║╔╗─║║╔═╗──║╚═╗─║╚╝║
//║║──║║║║╚╗║╔╗║─║║─║║╚╗║║║║║╚╗║║╚╗║──║╔═╝─║╔╗║
//║╚═╦╝╚╣╚═╝║║║║─║║─║║─║╠╝╚╣║─║║╚═╝║──║║─╔═╝║║╚═╗
//╚══╩══╩═══╩╝╚╝─╚╝─╚╝─╚╩══╩╝─╚╩═══╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//[eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_lightning_impact_size               "5"  - [eng] FLAME SIZE FROM LIGHTNING [ru] РАЗМЕР ВСПЫШКИ ОТ МОЛНИИ
//fx_lightning_impact_trail              "1"  - [eng] FLAME [ru] ПЛАМЯ
//fx_lightning_impact_trail_Time       "0.05" - [eng] DURATION OF THE FLAME [ru] ДЛИТЕЛЬНОСТЬ ПЛАМЕНИ
//fx_lightning_impact_particles          "1"  - [eng] PARTICLES [ru] ЧАСТИЦЫ
//fx_lightning_impact_particles_chance "0.05" - [eng] PARTICLES CHANCE [ru] ШАНС ПОЯВЛЕНИЯ ЧАСТИЦ
//fx_lightning_impact_smoke              "1"  - [eng] SMOKE FROM FLAME[ru] ДЫМ ОТ ПЛАМЕНИ
//fx_lightning_impact_smoke_chance     "0.02" - [eng] SMOKE CHANCE [ru] ШАНС ПОЯВЛЕНИЯ ДЫМА
//fx_lightning_impact_mark_chance       "0.4" - [eng] IMPACT MARK CHANCE [ru] ШАНС ПОЯВЛЕНИЯ МАРКИ
//fx_lightning_impact_light              "1"  - [eng] LIGHT FROM FLAME [ru] СВЕТ ОТ ПЛАМЕНИ
//fx_lightning_flash                     "1"  - [eng] LIGHT WHEN FIRE [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//...
//...
//fx_enable                              "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style                          "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)
//fx_gibs_sparks_size                    "1"  - [eng] GIBS SPARKS SIZE [ru] РАЗМЕР ИСКР
//fx_gibs_sparks_r                      "1.0" - [eng] RED SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_g                      "1.0" - [eng] GREEN SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_b                      "1.0" - [eng] BLUE SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА В ИСКРАХ


weapon/lightning/flash {
if ( fx_lightning_flash == 1) {
		color 1 1 1
		emitter 0.00000001 {
        size 200 + rand * 25
        Light
		}
	}
if (fx_enable == 1) {
	shader prt_circle_blur
	repeat 5 {
		size 10 * rand
		random dir
		quad
	}

	alpha	1
	shader	prt_circle_blur
	size 12
	width 1
	repeat 5 {
		random velocity
		spark
	}
}
}

weapon/lightning/impactflesh {
if (fx_gibs_style == 1) {
if (rand > 0.93) {
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
}

if (fx_gibs_style == 2) {
if (rand > 0.93) {
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
}

weapon/lightning/impact {
if (fx_lightning_impact_light == 1) {
		emitter 0.003 {
		
		color 1 1 1
        size fx_lightning_impact_size*10 + rand * fx_lightning_impact_size*5
        Light
		}
	}
	
		if  rand > (1-fx_lightning_impact_mark_chance) {
		repeat 1 {
			color 1 1 1
			alpha 1
			rotate rand * 360	
			shaderList rand {
				impact1
				impact2
				impact3
				impact4
				impact5
			}
			
			size fx_lightning_impact_size/1.5 + rand * fx_lightning_impact_size/1.5
			Decal
		}
	}
	t0 s_maxSoundInstances
	t1 s_maxSoundRepeatTime
	command s_maxSoundInstances -1
	command s_maxSoundRepeatTime 50

	soundList {
		sound/weapons/lightning/lg_hit.wav
		sound/weapons/lightning/lg_hit2.wav
		sound/weapons/lightning/lg_hit3.wav
	}
	
	command s_maxSoundInstances %t0
	command s_maxSoundRepeatTime %t1

	copy dir v7
if (fx_enable == 1) {
if ( fx_lightning_impact_smoke == 1 ) {
	if rand > (1-fx_lightning_impact_smoke_chance) {
		size fx_lightning_impact_size*4 + fx_lightning_impact_size*10 * rand

		light

		if( rand > 0.75 ) {
			rotate 360 * rand
			copy dir velocity
			scale velocity velocity fx_lightning_impact_size*6

			t0 rand * fx_lightning_impact_size*4 + fx_lightning_impact_size*2

			emitter 0.48 {
				size fx_lightning_impact_size*1 + lerp * t0
				color 1 1 1
				shader Smoke_Puff

				colorFade 0.2
				moveBounce 1 1

				sprite
			}
		}
	}
}
if fx_lightning_impact_trail == 1 {	
	shader prt_circle_blur
	alpha 1

	normalize dir v0
	addScale origin v0 origin 1
	repeat 2 {
		size fx_lightning_impact_size*1.3
		width fx_lightning_impact_size/3

		random velocity

		emitter rand * fx_lightning_impact_Trail_time + fx_lightning_impact_Trail_time {
				red 1.4
		blue 0+(lerp*1.2)
		green 0.3+lerp
		red clip(red+0.01)
		green clip(green+0.1)
		blue clip(blue+0.1) 
			colorFade 0
			Spark
		}
	}
}
	color 1 1 1
if ( fx_lightning_impact_particles == 1 ) {
	if rand > (1-fx_lightning_impact_particles_chance) {
		shader	prt_circle_blur
		alpha		0.75	
		repeat 1 {
			//random dir
			copy v7 dir
			wobble	dir velocity fx_lightning_impact_size*2 + rand*fx_lightning_impact_size*10
			scale	velocity velocity fx_lightning_impact_size*35 + rand*fx_lightning_impact_size*10
			t0		fx_lightning_impact_size/20 + rand
				
			emitter 1 * rand + 0.3 {
				size fx_lightning_impact_size

				width fx_lightning_impact_size/3
			
				moveBounce 400 0.75
				colorFade 0
				spark

				size fx_lightning_impact_size/7 - lerp * fx_lightning_impact_size/10
				shader prt_sun
				sprite
			}
		}
	}
}

	if  rand > (1-fx_lightning_impact_mark_chance) {
		repeat 1 {
			color 1 1 1
			alpha 1
			rotate rand * 360	
			shaderList rand {
				impact1
				impact2
				impact3
				impact4
				impact5
			}
			
			size fx_lightning_impact_size/1.5 + rand * fx_lightning_impact_size/1.5
			Decal
		}
	}
}
}