//╔═══╦╗─╔══╦══╦╗──╔╦══╗──╔══╦══╗╔══╗
//║╔═╗║║─║╔╗║╔═╣║──║║╔╗║──║╔═╩═╗║║╔═╝
//║╚═╝║║─║╚╝║╚═╣╚╗╔╝║╚╝║──║╚═╗─║╚╝║
//║╔══╣║─║╔╗╠═╗║╔╗╔╗║╔╗║──║╔═╝─║╔╗║
//║║──║╚═╣║║╠═╝║║╚╝║║║║║──║║─╔═╝║║╚═╗
//╚╝──╚══╩╝╚╩══╩╝──╚╩╝╚╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ
//fx_plasma_r                        "0"  - [eng] RELATION OF RED COLOR [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА
//fx_plasma_g                       "0.3" - [eng] RELATION OF GREEN COLOR [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА
//fx_plasma_b                        "1"  - [eng] RELATION OF BLUE COLOR [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА
//fx_plasma_flash                    "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_plasma_impact_stones            "0"  - [eng] STONES FROM EXPLOSION [ru] КАМНИ ОТ ВЗРЫВА
//fx_plasma_impact_stones_value      "50" - [eng] VALUE OF STONES [ru] КОЛ-ВО КАМНЕЙ
//fx_plasma_vibrate                  "5"  - [eng] EXPLOSIVE VIBRATION [ru] ВИБРАЦИЯ ЭКРАНА ОТ ВЗРЫВА
//fx_plasma_impact_size             "12"  - [eng] EXPLOSION SIZE [ru] РАЗМЕР ВЗРЫВА
//fx_plasma_impact_style             "1"  - [eng] EXPLOSION STYLE [ru] СТИЛЬ ВЗРЫВА
//fx_plasma_impact_particles1        "1"  - [eng] PARTICLES 1 [ru] ЧАСТИЦЫ 1
//fx_plasma_impact_particles1_value  "2"  - [eng] PARTICLES 1 VALUE[ru] КОЛ-ВО ЧАСТИЦ ПЕРВОГО ТИПА
//fx_plasma_impact_particles2        "1"  - [eng] PARTICLES 2 [ru] ЧАСТИЦЫ 2
//fx_plasma_impact_particles2_value "100" - [eng] PARTICLES 2 VALUE [ru] КОЛ-ВО ЧАСТИЦ ВТОРОГО ТИПА
//fx_plasma_impact_particles3        "0"  - [eng] PARTICLES 3 [ru] ЧАСТИЦЫ 3
//fx_plasma_impact_particles3_value  "2"  - [eng] PARTICLES 3 VALUE [ru] КОЛ-ВО ЧАСТИЦ ТРЕТЬЕГО ТИПА

//fx_plasma_projectile_size          "6"  - [eng] PLASMA SIZE [ru] РАЗМЕР СНАРЯДА ПЛАЗМЫ
//fx_plasma_trail                    "1"  - [eng] TRAIL FROM PLASMA [ru] СЛЕД ОТ СНАРЯДА ПЛАЗМЫ
//fx_plasma_trail_type               "1"  - [eng] FLAME TYPE [ru] ТИП ПЛАМЕНИ
//fx_plasma_trail_length             "20" - [eng] FLAME LENGTH [ru] ДЛИНА ПЛАМЕНИ
//fx_plasma_trail_size               "4"  - [eng] LENGTH OF EACH PARTICLE FLAME [ru] ДЛИНА КАЖДОЙ ЧАСТИЧКИ ПЛАМЕНИ
//fx_plasma_trail_width              "4"  - [eng] WIDTH OF EACH PARTICLE FLAME [ru] ШИРИНА КАЖДОЙ ЧАСТИЧКИ ПЛАМЕНИ
//fx_plasma_trail_style              "2"  - [eng] TRAIL STYLE [ru] СТИЛЬ ХВОСТА
//...
//...
//fx_enable                          "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style                      "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)


weapon/plasma/projectile {
if (fx_enable == 0) {
	// The sprite for the plasma
	size fx_plasma_projectile_size*3
        rotate rand * 360
	shader	sprites/plasma1
	sprite
	// Plasma flying sound
	loopSound	"sound/weapons/plasma/lasfly.wav"
	}
if (fx_enable == 1) {
repeat 2 {
	model source/models/sphere.md3
	
	red fx_plasma_r //Red from cmd//Красный из команды 
	green fx_plasma_g //Green from cmd//Зеленый из команды
	blue fx_plasma_b //Blue from cmd//Синий из команды
			red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
		loopSound	"sound/weapons/plasma/lasfly.wav"
	size fx_plasma_projectile_size*0.7
		rotate time * 360 * loopCount
		shader prt_fsquare
		dirModel
	}
}
}
weapon/plasma/flash {
if (fx_enable == 0) {
if (fx_plasma_flash == 1) {
        color 0 0.3 1
		
		emitter 0.0004 {	
        size 200+rand*25
        Light
		}
	}
}
if (fx_enable == 1) {
if (fx_plasma_flash == 1) {
        red fx_plasma_r //Red from cmd//Красный из команды 
		green fx_plasma_g //Green from cmd//Зеленый из команды
		blue fx_plasma_b //Blue from cmd//Синий из команды
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
		
		emitter 0.0004 {	
        size 200+rand*25
        Light
		}
	}
}
}
weapon/plasma/impactFLESH {
if (fx_enable == 0) {
sound	sound/weapons/plasma/plasmx1a.wav
	vibrate fx_plasma_vibrate
	emitter 0.04 {
			color 0 0.3 1
		size fx_plasma_impact_size*30 * clip( 2 - 2 * lerp )
		Light
	}
}
if (fx_enable == 1) {
	vibrate fx_plasma_vibrate
	
	size fx_plasma_impact_size + rand
	sound	sound/weapons/plasma/plasmx1a.wav

	red fx_plasma_r
	green fx_plasma_g
	blue fx_plasma_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.04 {
		size fx_plasma_impact_size*30 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_plasma_impact_style == 1) {
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				smoke_animated1
				smoke_animated2
				smoke_animated3
				smoke_animated4
				smoke_animated5
				smoke_animated6
				}

			random dir
			rotate rand*360
			t3 fx_plasma_impact_size*1.4*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/13*t3)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_plasma_impact_style == 2) {
	repeat fx_plasma_impact_size*1.4*4
	{
		shaderlist rand{
			smoke1
			smoke2
			smoke3
			smoke4
			smoke5
			smoke6
			smoke7
			smoke8
			smoke9
			smoke10
			smoke11
			smoke12
			smoke13
			smoke14
			smoke15
			smoke16
			smoke17
			smoke18
			smoke19
			smoke20
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/6*rand+fx_plasma_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/2+(fx_plasma_impact_size*1.4/2+fx_plasma_impact_size*1.4/2*t0)*sin(fx_plasma_impact_size*1.4/3+lerp*fx_plasma_impact_size*1.4*2.0+lerp*fx_plasma_impact_size*1.4*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_plasma_impact_style == 3) {
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_plasma_impact_size*1.4*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/10+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 4) {

		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_plasma_impact_size*1.4*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/12+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_plasma_impact_style == 5) {


		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_plasma_impact_size*1.4*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/12+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 6) {
	repeat fx_plasma_impact_size*1.4*3
	{
		shaderlist rand{
			prt_flame1
			prt_flame2
			prt_flame3
			prt_flame4
			prt_flame5
			prt_flame6
			prt_flame7
			prt_flame8
			prt_flame9
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/4.5*rand+fx_plasma_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/3+(fx_plasma_impact_size*1.4/3.2+fx_plasma_impact_size*1.4/4*t0)*sin(fx_plasma_impact_size*1.4/2.6+lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*3+lerp*fx_plasma_impact_size*1.4*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_plasma_impact_style == 7) {
	repeat fx_plasma_impact_size*1.4*8
	{
		shaderlist rand{
			prt_electric1
			prt_electric2
			prt_electric3
			prt_electric4
			prt_electric5
			prt_electric6
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/5*rand+fx_plasma_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/5+(fx_plasma_impact_size*1.4/3.2+fx_plasma_impact_size*1.4/2*t0)*sin(fx_plasma_impact_size*1.4/2+lerp*fx_plasma_impact_size*1.4*3+lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_plasma_impact_style == 8) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_plasma_impact_size*1.4/14+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.4+lerp*fx_plasma_impact_size*1.4*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 9) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*2+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_plasma_impact_style == 10) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*1.5+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_plasma_impact_style == 11) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*2.3+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_plasma_impact_style == 12) {


		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/14+(fx_plasma_impact_size*1.4/8*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_plasma_impact_style == 13) {


		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_plasma_impact_size*1.4
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/20+(fx_plasma_impact_size*1.4/8*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_plasma_impact_style == 14) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/7*t0)*sin(lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_plasma_impact_style == 15) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/7*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4/5)
				colorFade 0
				quad
				}
		}
}

if (fx_plasma_impact_style == 16) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/4+(fx_plasma_impact_size*1.4/10*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 17) {
		repeat fx_plasma_impact_size*1.4*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/2+(fx_plasma_impact_size*1.4/10*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 18) {
		repeat fx_plasma_impact_size*1.4*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4*5
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/30*t0)*sin(lerp*fx_plasma_impact_size*1.4+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_plasma_impact_style == 19) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4*5
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/22*t0)*sin(lerp*fx_plasma_impact_size*1.4+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}
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
		t0 7 + crand * 10
		
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


	shader BloodTexture

	repeat 10 {
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

					size 10 + rand * 10 
					rotate 360 * rand

					t0 0.2 + rand * 0.1
					red t0
					green t0
					blue t0

					decal alpha
				}
			}

			size 0.01 + 0.005 * rand
			anglesModel
			}
		}	
	}
}
}


weapon/plasma/trail {
if (fx_enable == 0) {
	color 0 0.3 1
	size	150
	Light
}


if (fx_enable == 1) {
	red fx_plasma_r
	green fx_plasma_g 
	blue fx_plasma_b
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1)	
if (fx_plasma_trail == 1) {
	distance  0.25+rand {
if (fx_plasma_trail_type == 1) {
	shaderlist rand {
	prt_fire1
	prt_fire2
	prt_fire3
	prt_fire4
	prt_fire5
	prt_fire6
		}
	}
if (fx_plasma_trail_type == 2) {
	shaderlist rand {
	prt_lightning1
	prt_lightning2
	prt_lightning3
	prt_lightning4
	prt_lightning5
	prt_lightning6
		}
	}
if (fx_plasma_trail_type == 3) {
	shaderlist rand {
	prt_circle_blur
		}
	}
if (fx_plasma_trail_type == 4) {
	shaderlist rand {
	prt_circle
		}
	}
if (fx_plasma_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_plasma_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_plasma_trail_type == 6) {
	shaderlist rand {
	flare21
	flare22
	flare3
	flare9
	flare12
	flare20
	flare27
	flare26
		}
	}
if (fx_plasma_trail_type == 7) {
	shaderlist rand {
	prt_ring
		}
	}

	t0 fx_plasma_projectile_size*1.3
	t1 fx_plasma_projectile_size/7
	t2 1
	t4 t2
if (fx_plasma_trail_style == 1) {
repeat t0 {
			
	t4 t4+t2
	rotate rand*360*rand
	if t4 >= t0 {
	t4 t2
	}
		
	emitter t4*(fx_plasma_trail_length/12)/1000 {	
		random dir
		size t1*(fx_plasma_trail_size/1.5)/4
		width t1*(fx_plasma_trail_width/1.5)/2
		t1 t1-t2 //Цикл размера
		rotate rand*360
		if t1 <= t2 {
			t1 t0
			}
			spark
			quad
			}
		}
	}
if (fx_plasma_trail_style == 2) {

	copy origin v3

	normalize dir
t1 fx_plasma_projectile_size*800
repeat 3 {
		perpendicular dir v0
		scale v0 v0 fx_plasma_projectile_size/4
		copy v0 v3

		rotatearound v0 dir v1 ( time * t1 )
		t1 t1+fx_plasma_projectile_size*40
		add origin v1 origin
		
		emitter fx_plasma_trail_length/300 {
			size fx_plasma_trail_size/3
			width fx_plasma_trail_width/3
			spark
			sprite
		}
			perpendicular dir v0
			scale v0 v0 fx_plasma_projectile_size/5
			copy v0 v3

			rotatearound v0 dir v1 ( time * t1 )
			t1 t1+fx_plasma_projectile_size*60
			add origin v1 origin
			}
		}
	}
}
}
	emitter 0.06 {
	size fx_plasma_projectile_size*20+ fx_plasma_projectile_size*15*rand
	light
	}
}


weapon/plasma/impact {
if (fx_enable == 0) {
sound	sound/weapons/plasma/plasmx1a.wav
	vibrate fx_plasma_vibrate
	Decal energy
		    rotate rand*360
			size	fx_plasma_impact_size*1
			shaderList rand {
						impact1
						impact2
						impact3
						impact4
						impact5
						impact6
						impact7
						impact8
						}
				repeat 3 {

				Decal
				}
	repeat 2 {
	size	fx_plasma_impact_size*0.07
	shader	plasmaExplosion
	model	models/weaphits/ring02.md3
	rotate    rand*360
	emitter 0.4 {
		dirModel
	}
	}
	emitter 0.04 {
			color 0 0.3 1

		size fx_plasma_impact_size*30 * clip( 2 - 2 * lerp )
		Light
		}
}
if (fx_enable == 1) {
	vibrate fx_plasma_vibrate
	
	size fx_plasma_impact_size + rand
	sound	sound/weapons/plasma/plasmx1a.wav
	    rotate rand*360
			shaderList rand {
						impact1
						impact2
						impact3
						impact4
						impact5
						impact6
						impact7
						impact8
						}
				repeat 3 {
				Decal
				}

	red fx_plasma_r
	green fx_plasma_g
	blue fx_plasma_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.04 {
		size fx_plasma_impact_size*30 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_plasma_impact_style == 1) {
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				smoke_animated1
				smoke_animated2
				smoke_animated3
				smoke_animated4
				smoke_animated5
				smoke_animated6
				}

			random dir
			rotate rand*360
			t3 fx_plasma_impact_size*1.4*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/13*t3)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_plasma_impact_style == 2) {
	repeat fx_plasma_impact_size*1.4*4
	{
		shaderlist rand{
			smoke1
			smoke2
			smoke3
			smoke4
			smoke5
			smoke6
			smoke7
			smoke8
			smoke9
			smoke10
			smoke11
			smoke12
			smoke13
			smoke14
			smoke15
			smoke16
			smoke17
			smoke18
			smoke19
			smoke20
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/6*rand+fx_plasma_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/2+(fx_plasma_impact_size*1.4/2+fx_plasma_impact_size*1.4/2*t0)*sin(fx_plasma_impact_size*1.4/3+lerp*fx_plasma_impact_size*1.4*2.0+lerp*fx_plasma_impact_size*1.4*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_plasma_impact_style == 3) {
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_plasma_impact_size*1.4*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/10+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 4) {

		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_plasma_impact_size*1.4*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/12+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_plasma_impact_style == 5) {


		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_plasma_impact_size*1.4*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/12+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.8+lerp*fx_plasma_impact_size*1.4*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 6) {
	repeat fx_plasma_impact_size*1.4*3
	{
		shaderlist rand{
			prt_flame1
			prt_flame2
			prt_flame3
			prt_flame4
			prt_flame5
			prt_flame6
			prt_flame7
			prt_flame8
			prt_flame9
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/4.5*rand+fx_plasma_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/3+(fx_plasma_impact_size*1.4/3.2+fx_plasma_impact_size*1.4/4*t0)*sin(fx_plasma_impact_size*1.4/2.6+lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*3+lerp*fx_plasma_impact_size*1.4*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_plasma_impact_style == 7) {
	repeat fx_plasma_impact_size*1.4*8
	{
		shaderlist rand{
			prt_electric1
			prt_electric2
			prt_electric3
			prt_electric4
			prt_electric5
			prt_electric6
		}
		
		random        v0
		scale v0 v0 20
		rotate 360*rand+360*rand
		random        v0
		v02            v02*1.5
		addScale    parentVelocity v0 velocity fx_plasma_impact_size/5*rand+fx_plasma_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_plasma_impact_size*1.4/5+(fx_plasma_impact_size*1.4/3.2+fx_plasma_impact_size*1.4/2*t0)*sin(fx_plasma_impact_size*1.4/2+lerp*fx_plasma_impact_size*1.4*3+lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_plasma_impact_style == 8) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_plasma_impact_size*1.4/14+(fx_plasma_impact_size*1.4/13*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.4+lerp*fx_plasma_impact_size*1.4*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 9) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*2+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_plasma_impact_style == 10) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*1.5+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_plasma_impact_style == 11) {

		
		repeat fx_plasma_impact_size*1.4*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4*2.3+(fx_plasma_impact_size*1.4/5*t0)*sin(lerp*fx_plasma_impact_size*1.4/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_plasma_impact_style == 12) {


		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_plasma_impact_size*1.4
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/14+(fx_plasma_impact_size*1.4/8*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_plasma_impact_style == 13) {


		repeat fx_plasma_impact_size*1.4*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_plasma_impact_size*1.4
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_plasma_impact_size*1.4/20+(fx_plasma_impact_size*1.4/8*t0)*sin(lerp*fx_plasma_impact_size*1.4*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_plasma_impact_style == 14) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/7*t0)*sin(lerp*fx_plasma_impact_size*1.4*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_plasma_impact_style == 15) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/7*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4/5)
				colorFade 0
				quad
				}
		}
}

if (fx_plasma_impact_style == 16) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/4+(fx_plasma_impact_size*1.4/10*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 17) {
		repeat fx_plasma_impact_size*1.4*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/2+(fx_plasma_impact_size*1.4/10*t0)*sin(lerp*fx_plasma_impact_size*1.4*2+lerp*fx_plasma_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_plasma_impact_style == 18) {
		repeat fx_plasma_impact_size*1.4*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4*5
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/30*t0)*sin(lerp*fx_plasma_impact_size*1.4+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_plasma_impact_style == 19) {
		repeat fx_plasma_impact_size*1.4*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_plasma_impact_size*1.4*5
			emitter 0.85 +rand*0.1 {
				size fx_plasma_impact_size*1.4/15+(fx_plasma_impact_size*1.4/22*t0)*sin(lerp*fx_plasma_impact_size*1.4+lerp*fx_plasma_impact_size*1.4/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_plasma_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_plasma_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_plasma_impact_size*3+fx_plasma_impact_size*7*rand
 
                emitter 1.75 + rand * 1.75 {
                        moveGravity 400
                        distance 0.35 {
                                clear velocity
                                rotate rand * 360
 
                                alpha 1
 
                                shader prt_circle_blur
                                repeat 1 {
                                        sink 0
                                        normalize dir v0
                                        inverse v0
                                        random velocity
                                        scale velocity velocity 10 + 5 * rand
 
                                        emitter ( 0.05 + 0.1 * rand ) {
                                                size fx_plasma_impact_size/40
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_plasma_impact_size/15 * rand
                        sprite
                }
        }
}
if (fx_plasma_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_plasma_impact_particles2_value/1.5 "2" +rand*fx_plasma_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_plasma_impact_size*2+fx_plasma_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_plasma_impact_size/20 * rand
                        sprite
                }
        }
}	

if (fx_plasma_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_plasma_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_plasma_impact_size*12+fx_plasma_impact_size*6*rand
 
                emitter 1.75 + rand * 1.75 {
                        moveGravity 50
                        distance 0.35 {
                                clear velocity
                                rotate rand * 360
 
                                alpha 1
 
                                shader prt_circle_blur
                                repeat 1 {
                                        sink 0
                                        normalize dir v0
                                        inverse v0
                                        random velocity
                                        scale velocity velocity 4 + 5 * rand
 
                                        emitter ( 0.1 + 0.1 * rand ) {
                                                size fx_plasma_impact_size/40
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_plasma_impact_size/35 * rand
                        sprite
                }
        }
}

if (fx_plasma_impact_stones == 1) {
	movegravity 400
	repeat fx_plasma_impact_stones_value/1.5+fx_plasma_impact_stones_value/3*rand {
	modellist rand {
	source/stones/models/stone1
	source/stones/models/stone2
	source/stones/models/stone3
	source/stones/models/stone4
	source/stones/models/stone5
	source/stones/models/stone6
	source/stones/models/stone7
	source/stones/models/stone8
	} 
	shaderlist rand {
		stone1
		stone2
		stone3
		stone4
		stone5
		}
			random v0
			v02            v02+1
			addScale    parentVelocity v0 velocity fx_plasma_impact_size*4+fx_plasma_impact_size*4*rand
			emitter 5+5*rand
			{
				size fx_plasma_impact_size/2500+rand*fx_plasma_impact_size/500
				moveBounce 500 .5
				anglesModel  
			}
		}
	}
}
}
