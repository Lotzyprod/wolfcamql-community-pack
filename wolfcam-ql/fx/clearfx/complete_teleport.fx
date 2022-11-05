//╔════╦═══╦╗─╔═══╦═══╦══╦═══╦════╗──╔══╦══╗╔══╗
//╚═╗╔═╣╔══╣║─║╔══╣╔═╗║╔╗║╔═╗╠═╗╔═╝──║╔═╩═╗║║╔═╝
//──║║─║╚══╣║─║╚══╣╚═╝║║║║╚═╝║─║║────║╚═╗─║╚╝║
//──║║─║╔══╣║─║╔══╣╔══╣║║║╔╗╔╝─║║────║╔═╝─║╔╗║
//──║║─║╚══╣╚═╣╚══╣║──║╚╝║║║║──║║────║║─╔═╝║║╚═╗
//──╚╝─╚═══╩══╩═══╩╝──╚══╩╝╚╝──╚╝────╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//fx_teleport_style       "1"  - [eng] TELEPORT STYLE (1-custom ql, 2-lgls, 3-custom quake3) [ru] СТИЛЬ ТЕЛЕПОРТА (1-QL, 2-LGLS, 3-QUAKE3)
//fx_teleport_r          "1.0" - [eng] RED COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА
//fx_teleport_g          "1.0" - [eng] GREEN COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА
//fx_teleport_b          "1.0" - [eng] BLUE COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА
//...
//...
//fx_enable               "1"  - [eng] ENABLE CUSTOM FX [ru] ВКЛЮЧАЕТ ОСОБЫЕ ЭФФЕКТЫ

player/teleportIn {
if ( fx_enable == 0 ) {
sound	sound/world/telein.wav
model models/powerups/pop.md3
	emitter 0.5 {
		colorFade 0
		anglesModel
	}
}

if ( fx_enable == 1 ) {

red fx_teleport_r
green fx_teleport_g
blue fx_teleport_b

red clip(red+0.2)
green clip(green+0.2)
blue clip(blue+0.2)  

	sound sound/world/telein.wav
	
	emitter 0.5 {
	size 150 * ( 1 - lerp ) + 50 * rand
	light
	}

if ( fx_teleport_style == 1 ) {

	shader prt_circle_blur

	repeat 4 {
		t0 360 * rand
		t1 30 + rand * 90
		t2 70 + rand * 20

		if( rand > 0.5 ) {
			t1 -t1
		}

		shader Shockwave3
		//random dir

		emitter 0.8 {
			rotate t0 + t1 * time
			width 5
			size 1 + lerp * t2

			colorFade 0.5

			quad
		}
	}

	repeat 30 {
		t0 50 + rand * 50
		width 2 + rand

		shader prt_circle_blur
		random velocity
		emitter 0.15 {
			size t0 * ( 1 - lerp )
			spark
		}
	}

	copy origin v3

	repeat 25 {
		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shader prt_circle_blur

		emitter 1 {
			colorFade 0
			size 20
			sprite
		}
	}

	repeat 10 {
		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shaderlist rand {
			smoke_animated3
		}

		t0 rand * 360
		t1 10 * crand

		emitter 0.7 {
			size 25 + 5 * lerp
			rotate t0 + t1 * time
			sprite
		}
	}

	copy v3 origin

	shader flareshader
	repeat 25 {
		random velocity
		width 2
		emitter 0.6 {
			size 35 * ( 1 - lerp )
			colorFade 0.5
			spark
		}
	}
}
if ( fx_teleport_style == 2 ) {

	origin2 origin2 -5

	shader flareshader
	repeat 25 {
		emitter 0.45 {
			random velocity

			width 28 - 16 * lerp
			size 50 - 50 * lerp + 120 * clip( lerp * 8 )
			colorFade 0
			spark
		}
	}

	shader flareshader

	repeat 4 + 4 * rand {
		random dir

		wobble	dir velocity 100 + 80 * rand
		scale			velocity velocity 100 + rand * 100
		t0				2.5 + rand
		size 			t0
		width 			1.5*rand
		shader	flareshader
		emitter 		1.5 {
			size ( 1 - lerp ) * t0
			
			distance 0.65 {
			clear v0
				clear velocity
				rotate rand * 360

				shader flareshader
				repeat 1 {
					sink 0
					normalize dir v0
					inverse v0
					random velocity
					scale velocity velocity 5 + 5 * rand

					emitter ( 0.25 + 0.2 * rand ) * ( 1 - lerp ) {
						size 0.7 - lerp * 0.3
						colorFade 0
						moveGravity 0
						sprite
					}
				}
			}

			moveBounce 	130 0.75
			colorFade		0.75
			sprite
		}

		size 0.3
		shader flareshader
		emitter 0.95 {
			size 0.3 * ( 1 - lerp )
			sprite
		}
	}


	repeat 50 + 50 * rand {
		random velocity 
		scale velocity velocity 150 + rand * 100

		emitter 1.5 {
			moveBounce 375 0.9

			colorFade 0

			shader flareshader
			size 1.5 * ( 1 - lerp ) + 1.5 * rand
			sprite

			shader flareshader
			size 0.75
			sprite
		}
	}

	clear velocity

	repeat 10 {
		random dir
		normalize dir

		copy dir v5

		normalize dir

		copy dir v3
		copy origin v2

		copy parentDir dir

		t1 800 + rand * 800 // speed
		if( rand > 0.5 ) {
			t1 t1 * -1
		}

		emitter 0.5 {
			copy v3 dir
			copy v2 origin

			clear v0
			clear v1
			normalize dir
			perpendicular dir v0

			rotatearound v0 dir v1 ( time * t1 )
			normalize v1
			size 12
			scale v1 v1 34
			copy v1 dir

			dir0 dir0 / 1.3
			dir1 dir1 / 1.3

			add origin dir origin

			size 1

			distance 2 + 1 * rand {
				repeat 2 {
					if( loopCount == 0 ) {
						scale v1 velocity 2
					} else {
						scale v1 velocity -1
					}

					emitter 0.6 {
						moveBounce 0 0.7
						colorFade 0

						shader flareshader
						size 6 * ( 1 - lerp ) + 1.5 * rand
						sprite

						shader flareshader
						size 0.75 * ( 1 - lerp ) 
						sprite
					}
				}
			}

			sprite

			sub origin dir origin
		}
	}
}
if ( fx_teleport_style == 3 ) {

	
    shader     prt_sun
	t1 crand+0.5
	t2 crand
	origin0 origin0 
	origin1 origin1 - 35
	origin2 origin2 + 40
	random velocity
	velocity2 -300
	emitter .15
	{
		interval .01
		{
			repeat 45
			{
				t2 rand
				origin0    origin0  + 3.5*cos(loop*360) //* cos(loop*3600) //* cos(loop*180*2*t2)
				origin1    origin1  + 3.5*sin(loop*360) //* sin(loop*3600)//* sin(loop*180*2*t2)
				origin2    origin2	//+ 3*cos(loop*180*2*t1)*cos(loop*180*2*t1)	
				emitter     .2
				{	
					
					size t2*7 - lerp *t2*5			
					movegravity 1
					Sprite

					}
				}			
			}
		}	
	}
}
}

//╔════╦═══╦╗─╔═══╦═══╦══╦═══╦════╦══╦╗╔╦════╗
//╚═╗╔═╣╔══╣║─║╔══╣╔═╗║╔╗║╔═╗╠═╗╔═╣╔╗║║║╠═╗╔═╝
//──║║─║╚══╣║─║╚══╣╚═╝║║║║╚═╝║─║║─║║║║║║║─║║
//──║║─║╔══╣║─║╔══╣╔══╣║║║╔╗╔╝─║║─║║║║║║║─║║
//──║║─║╚══╣╚═╣╚══╣║──║╚╝║║║║──║║─║╚╝║╚╝║─║║
//──╚╝─╚═══╩══╩═══╩╝──╚══╩╝╚╝──╚╝─╚══╩══╝─╚╝
//TELEPORTOUT

player/teleportOut {
if ( fx_enable == 0 ) {
	sound	sound/world/teleout.wav
    model models/powerups/pop.md3
	emitter 0.5 {
		colorFade 0
		anglesModel
	}
}
if ( fx_enable == 1 ) {
red fx_teleport_r
green fx_teleport_g
blue fx_teleport_b

	red clip(red+0.2)
	green clip(green+0.2)
	blue clip(blue+0.2)  

	sound sound/world/teleout.wav
	
	emitter 0.5 {
	size 150 * ( 1 - lerp ) + 50 * rand
	light
	}

if ( fx_teleport_style == 1 ) {

	shader prt_circle_blur

	repeat 4 {
		t0 360 * rand
		t1 30 + rand * 90
		t2 70 + rand * 20

		if( rand > 0.5 ) {
			t1 -t1
		}

		shader Shockwave3
		//random dir

		emitter 0.8 {
			rotate t0 + t1 * time
			width 5
			size 1 + lerp * t2

			colorFade 0.5

			quad
		}
	}

	repeat 30 {
		t0 50 + rand * 50
		width 2 + rand

		shader prt_circle_blur
		random velocity
		emitter 0.15 {
			size t0 * ( 1 - lerp )
			spark
		}
	}

	copy origin v3

	repeat 25 {
		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shader prt_circle_blur

		emitter 1 {
			colorFade 0
			size 20
			sprite
		}
	}

	repeat 10 {
		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shaderlist rand {
			smoke_animated3
		}

		t0 rand * 360
		t1 10 * crand

		emitter 0.7 {
			size 25 + 5 * lerp
			rotate t0 + t1 * time
			sprite
		}
	}

	copy v3 origin

	shader flareshader
	repeat 25 {
		random velocity
		width 2
		emitter 0.6 {
			size 35 * ( 1 - lerp )
			colorFade 0.5
			spark
		}
	}
}
if ( fx_teleport_style == 2 ) {

	origin2 origin2 -5

	shader flareshader
	repeat 25 {
		emitter 0.45 {
			random velocity

			width 28 - 16 * lerp
			size 50 - 50 * lerp + 120 * clip( lerp * 8 )
			colorFade 0
			spark
		}
	}

	shader flareshader

	repeat 4 + 4 * rand {
		random dir

		wobble	dir velocity 100 + 80 * rand
		scale			velocity velocity 100 + rand * 100
		t0				2.5 + rand
		size 			t0
		width 			1.5*rand
		shader	flareshader
		emitter 		1.5 {
			size ( 1 - lerp ) * t0
			
			distance 0.65 {
			clear v0
				clear velocity
				rotate rand * 360

				shader flareshader
				repeat 1 {
					sink 0
					normalize dir v0
					inverse v0
					random velocity
					scale velocity velocity 5 + 5 * rand

					emitter ( 0.25 + 0.2 * rand ) * ( 1 - lerp ) {
						size 0.7 - lerp * 0.3
						colorFade 0
						moveGravity 0
						sprite
					}
				}
			}

			moveBounce 	130 0.75
			colorFade		0.75
			sprite
		}

		size 0.3
		shader flareshader
		emitter 0.95 {
			size 0.3 * ( 1 - lerp )
			sprite
		}
	}


	repeat 50 + 50 * rand {
		random velocity 
		scale velocity velocity 150 + rand * 100

		emitter 1.5 {
			moveBounce 375 0.9

			colorFade 0

			shader flareshader
			size 1.5 * ( 1 - lerp ) + 1.5 * rand
			sprite

			shader flareshader
			size 0.75
			sprite
		}
	}

	clear velocity

	repeat 10 {
		random dir
		normalize dir

		copy dir v5

		normalize dir

		copy dir v3
		copy origin v2

		copy parentDir dir

		t1 800 + rand * 800 // speed
		if( rand > 0.5 ) {
			t1 t1 * -1
		}

		emitter 0.5 {
			copy v3 dir
			copy v2 origin

			clear v0
			clear v1
			normalize dir
			perpendicular dir v0

			rotatearound v0 dir v1 ( time * t1 )
			normalize v1
			size 12
			scale v1 v1 34
			copy v1 dir

			dir0 dir0 / 1.3
			dir1 dir1 / 1.3

			add origin dir origin

			size 1

			distance 2 + 1 * rand {
				repeat 2 {
					if( loopCount == 0 ) {
						scale v1 velocity 2
					} else {
						scale v1 velocity -1
					}

					emitter 0.6 {
						moveBounce 0 0.7
						colorFade 0

						shader flareshader
						size 6 * ( 1 - lerp ) + 1.5 * rand
						sprite

						shader flareshader
						size 0.75 * ( 1 - lerp ) 
						sprite
					}
				}
			}

			sprite

			sub origin dir origin
		}
	}
}
if ( fx_teleport_style == 3 ) {

	
    shader     prt_sun
	t1 crand+0.5
	t2 crand
	origin0 origin0 
	origin1 origin1 - 35
	origin2 origin2 
	random velocity
	velocity2 300
	emitter .15
	{
		interval .01
		{
			repeat 45
			{
				t2 rand
				origin0    origin0  + 3.5*cos(loop*360) //* cos(loop*3600) //* cos(loop*180*2*t2)
				origin1    origin1  + 3.5*sin(loop*360) //* sin(loop*3600)//* sin(loop*180*2*t2)
				origin2    origin2	//+ 3*cos(loop*180*2*t1)*cos(loop*180*2*t1)	
				emitter     .2
				{	
					
					size t2*7 - lerp *t2*5			
					movegravity 1
					Sprite

					}
				}			
			}
		}	
	}
}
}
