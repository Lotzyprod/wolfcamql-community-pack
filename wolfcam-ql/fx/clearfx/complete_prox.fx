//╔═══╦═══╦══╦══╗╔══╗──╔══╦══╗╔══╗
//║╔═╗║╔═╗║╔╗╠═╗║║╔═╝──║╔═╩═╗║║╔═╝
//║╚═╝║╚═╝║║║║─║╚╝║────║╚═╗─║╚╝║
//║╔══╣╔╗╔╣║║║─║╔╗║────║╔═╝─║╔╗║
//║║──║║║║║╚╝╠═╝║║╚═╗──║║─╔═╝║║╚═╗
//╚╝──╚╝╚╝╚══╩══╝╚══╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_prox_flash                          "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_prox_impact_stones                  "1"  - [eng] STONES FROM EXPLOSION [ru] КАМНИ ОТ ВЗРЫВА
//fx_prox_impact_stones_value           "500" - [eng] VALUE OF STONES [ru] КОЛ-ВО КАМНЕЙ
//fx_prox_impact_r                      "1.0" - [eng] RELATION OF RED COLOR IN EXPLOSION [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА ВО ВЗРЫВЕ
//fx_prox_impact_g                      "0.2" - [eng] RELATION OF GREEN IN AN EXPLOSION [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА ВО ВЗРЫВЕ
//fx_prox_impact_b                       "0"  - [eng] RELATION OF BLUE COLOR IN EXPLOSION [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА ВО ВЗРЫВЕ
//fx_prox_vibrate                        "5"  - [eng] EXPLOSIVE VIBRATION [ru] ВИБРАЦИЯ ЭКРАНА ОТ ВЗРЫВА
//fx_prox_impact_size                   "25"  - [eng] EXPLOSION SIZE [ru] РАЗМЕР ВЗРЫВА
//fx_prox_impact_style                   "1"  - [eng] EXPLOSION STYLE [ru] СТИЛЬ ВЗРЫВА
//fx_prox_impact_particles1              "1"  - [eng] PARTICLES 1 [ru] ЧАСТИЦЫ 1
//fx_prox_impact_particles1_value       "2.0" - [eng] PARTICLES 1 VALUE[ru] КОЛ-ВО ЧАСТИЦ ПЕРВОГО ТИПА
//fx_prox_impact_particles2              "1"  - [eng] PARTICLES 2 [ru] ЧАСТИЦЫ 2
//fx_prox_impact_particles2_value       "500" - [eng] PARTICLES 2 VALUE [ru] КОЛ-ВО ЧАСТИЦ ВТОРОГО ТИПА
//fx_prox_impact_particles3              "0"  - [eng] PARTICLES 3 [ru] ЧАСТИЦЫ 3
//fx_prox_impact_particles3_value       "2.0" - [eng] PARTICLES 3 VALUE [ru] КОЛ-ВО ЧАСТИЦ ТРЕТЬЕГО ТИПА

//fx_prox_trail_smoke                    "1"  - [eng] SMOKE [ru] ДЫМ
//fx_prox_trail_smoke_size               "8"  - [eng] SIZE OF SMOKE OF SECOND TYPE [ru] РАЗМЕР ДЫМА ВТОРОГО ТИПА
//fx_prox_trail_smoke_length            "0.2" - [eng] LENGTH OF SMOKE OF THE SECOND TYPE [ru] ДЛИНА ДЫМА ВТОРОГО ТИПА
//fx_prox_trail_smoke_alpha             "0.3" - [eng] TRANSPARENCY SMOKE OF THE SECOND TYPE [ru] ПРОЗРАЧНОСТЬ ДЫМА ВТОРОГО ТИПА
//fx_prox_trail_smoke_whiteratio        "0.1" - [eng] RELATIONSHIP WHITE TO BLACK COLOR OF SMOKE [ru] СООТНОШЕНИЕ БЕЛОГО К ЧЕРНОМУ ЦВЕТУ ДЫМА
//...
//...
//fx_enable                              "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ
//fx_gibs_style                          "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)


weapon/prox/flash {
if ( fx_enable == 0 ) {
if (fx_prox_flash == 1) {
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
if (fx_prox_flash == 1) {
	emitter 0.05 {
		red fx_prox_impact_r
		green fx_prox_impact_g
		blue fx_prox_impact_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}

weapon/prox/impact {
if (fx_enable == 0) {
	vibrate 70
	sound	sound/weapons/rocket/rocklx1a.wav
	// Mark on the wall, using direction from parent
		    rotate rand*360
			size	30+rand*10
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


	// Animating sprite of the explosion
	repeat 1 {
	shader rocketExplosion
	size fx_prox_impact_size*2
	// Will be the light colour
			color 1 0.5 0.1
	
	emitter 1 {
		Sprite
		// size will goto zero after 0.5 of the time
	}
}
emitter 1 {
		size 300 * clip(2 - 2*lerp)
		Light
		}
}
if (fx_enable == 1) {
	vibrate fx_prox_vibrate
	
	size fx_prox_impact_size + rand
	sound	sound/weapons/rocket/rocklx1a.wav
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
						impact9
						impact10
						}
				repeat 3 {
				Decal
				}

	red fx_prox_impact_r
	green fx_prox_impact_g
	blue fx_prox_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_prox_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_prox_impact_style == 1) {
		repeat fx_prox_impact_size*2 {
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
			t3 fx_prox_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_prox_impact_size/15+(fx_prox_impact_size/13*t3)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_prox_impact_style == 2) {
	repeat fx_prox_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/6*rand+fx_prox_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/2+(fx_prox_impact_size/2+fx_prox_impact_size/2*t0)*sin(fx_prox_impact_size/3+lerp*fx_prox_impact_size*2.0+lerp*fx_prox_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_prox_impact_style == 3) {
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_prox_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/10+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 4) {

		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_prox_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/12+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_prox_impact_style == 5) {


		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_prox_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_prox_impact_size/12+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 6) {
	repeat fx_prox_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/4.5*rand+fx_prox_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/3+(fx_prox_impact_size/3.2+fx_prox_impact_size/4*t0)*sin(fx_prox_impact_size/2.6+lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*3+lerp*fx_prox_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_prox_impact_style == 7) {
	repeat fx_prox_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/5*rand+fx_prox_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/5+(fx_prox_impact_size/3.2+fx_prox_impact_size/2*t0)*sin(fx_prox_impact_size/2+lerp*fx_prox_impact_size*3+lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_prox_impact_style == 8) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_prox_impact_size/14+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.4+lerp*fx_prox_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 9) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*2+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_prox_impact_style == 10) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*1.5+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_prox_impact_style == 11) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*2.3+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_prox_impact_style == 12) {


		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size/14+(fx_prox_impact_size/8*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_prox_impact_style == 13) {


		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_prox_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/20+(fx_prox_impact_size/8*t0)*sin(lerp*fx_prox_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_prox_impact_style == 14) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/7*t0)*sin(lerp*fx_prox_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_prox_impact_style == 15) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/7*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_prox_impact_style == 16) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/4+(fx_prox_impact_size/10*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 17) {
		repeat fx_prox_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/2+(fx_prox_impact_size/10*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 18) {
		repeat fx_prox_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/30*t0)*sin(lerp*fx_prox_impact_size+lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_prox_impact_style == 19) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/22*t0)*sin(lerp*fx_prox_impact_size+lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_prox_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_prox_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_prox_impact_size*3+fx_prox_impact_size*7*rand
 
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
                                                size fx_prox_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_prox_impact_size/37 * rand
                        sprite
                }
        }
}
if (fx_prox_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_prox_impact_particles2_value/1.5 "2" +rand*fx_prox_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_prox_impact_size*2+fx_prox_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_prox_impact_size/30 * rand
                        sprite
                }
        }
}	

if (fx_prox_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_prox_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_prox_impact_size*12+fx_prox_impact_size*6*rand
 
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
                                                size fx_prox_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_prox_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_prox_impact_stones == 1) {
	movegravity 400
	repeat fx_prox_impact_stones_value/1.5+fx_prox_impact_stones_value/3*rand {
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
			addScale    parentVelocity v0 velocity fx_prox_impact_size*4+fx_prox_impact_size*4*rand
			emitter 5+5*rand
			{
				size fx_prox_impact_size/2500+rand*fx_prox_impact_size/500
				moveBounce 500 .5
				anglesModel  
			}
		}
	}
}
}
weapon/prox/trail {
if (fx_enable == 0) {
	color 1 0.5 0.1

	size	200
	Light

	// The standard smoke puff trail thing
	color	0.3 0.3 0.3
	alpha	0.2
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
			size		4 + lerp * 30
			sprite		cullNear
		}
	}
}
}
if (fx_enable == 1) {
	distance 0.5+rand {	
	if (fx_prox_trail_smoke = 1) {	
		alpha fx_prox_trail_smoke_alpha
		color 1 0.5 0
		t0 360 * rand
		t1 10 * rand
		t2 (fx_prox_trail_smoke_size)/4*rand
		random dir

		red fx_prox_trail_smoke_whiteratio
		blue fx_prox_trail_smoke_whiteratio
		green fx_prox_trail_smoke_whiteratio

		emitter (fx_prox_trail_smoke_length)*rand {
			if( lerp > 0.8 ) {
				alpha 1 - ( 1 - lerp ) * 5	
			}

			rotate t0 
			size (fx_prox_trail_smoke_size*3/4) + lerp * t2
			alphaFade 0.5

			shader Smoke_Puff
			sprite
			}	
		}
			random dir
		}
	}
}
weapon/prox/impactflesh {
if (fx_enable == 0) {
	vibrate fx_prox_vibrate
	sound	sound/weapons/rocket/rocklx1a.wav
	// Mark on the wall, using direction from parent

	// Animating sprite of the explosion
	repeat 1 {
	shader rocketExplosion
	size 50
	// Will be the light colour
	color 1 0.75 0
	
	emitter 1 {
		Sprite
		// size will goto zero after 0.5 of the time
	}
}
emitter 1 {
		size 300 * clip(2 - 2*lerp)
		Light
		}
}
if (fx_enable == 1) {
	vibrate fx_prox_vibrate
	
	sound	sound/weapons/rocket/rocklx1a.wav

	red fx_prox_impact_r
	green fx_prox_impact_g
	blue fx_prox_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_prox_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_prox_impact_style == 1) {
		repeat fx_prox_impact_size*2 {
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
			t3 fx_prox_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_prox_impact_size/15+(fx_prox_impact_size/13*t3)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_prox_impact_style == 2) {
	repeat fx_prox_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/6*rand+fx_prox_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/2+(fx_prox_impact_size/2+fx_prox_impact_size/2*t0)*sin(fx_prox_impact_size/3+lerp*fx_prox_impact_size*2.0+lerp*fx_prox_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_prox_impact_style == 3) {
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_prox_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/10+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 4) {

		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_prox_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/12+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_prox_impact_style == 5) {


		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_prox_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_prox_impact_size/12+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.8+lerp*fx_prox_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 6) {
	repeat fx_prox_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/4.5*rand+fx_prox_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/3+(fx_prox_impact_size/3.2+fx_prox_impact_size/4*t0)*sin(fx_prox_impact_size/2.6+lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*3+lerp*fx_prox_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_prox_impact_style == 7) {
	repeat fx_prox_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_prox_impact_size/5*rand+fx_prox_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_prox_impact_size/5+(fx_prox_impact_size/3.2+fx_prox_impact_size/2*t0)*sin(fx_prox_impact_size/2+lerp*fx_prox_impact_size*3+lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_prox_impact_style == 8) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_prox_impact_size/14+(fx_prox_impact_size/13*t0)*sin(lerp*fx_prox_impact_size*1.4+lerp*fx_prox_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 9) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*2+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_prox_impact_style == 10) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*1.5+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_prox_impact_style == 11) {

		
		repeat fx_prox_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size*2.3+(fx_prox_impact_size/5*t0)*sin(lerp*fx_prox_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_prox_impact_style == 12) {


		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_prox_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_prox_impact_size/14+(fx_prox_impact_size/8*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_prox_impact_style == 13) {


		repeat fx_prox_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_prox_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_prox_impact_size/20+(fx_prox_impact_size/8*t0)*sin(lerp*fx_prox_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_prox_impact_style == 14) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/7*t0)*sin(lerp*fx_prox_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_prox_impact_style == 15) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/7*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_prox_impact_style == 16) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/4+(fx_prox_impact_size/10*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 17) {
		repeat fx_prox_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/2+(fx_prox_impact_size/10*t0)*sin(lerp*fx_prox_impact_size*2+lerp*fx_prox_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_prox_impact_style == 18) {
		repeat fx_prox_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/30*t0)*sin(lerp*fx_prox_impact_size+lerp*fx_prox_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_prox_impact_style == 19) {
		repeat fx_prox_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_prox_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_prox_impact_size/15+(fx_prox_impact_size/22*t0)*sin(lerp*fx_prox_impact_size+lerp*fx_prox_impact_size/4)
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
}
