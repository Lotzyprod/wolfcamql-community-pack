

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

player/talk {
}

player/impressive {
}

player/excellent {
}


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

			colorfade 0

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
			colorfade 0
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

			colorfade 0

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
			colorfade 0
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

weapon/machinegun/flash {
if fx_enable == 0 {
if (fx_machinegun_flash == 1) {
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
if (fx_machinegun_flash == 1) {
	emitter 0.07 {
		red fx_machinegun_r
		green fx_machinegun_g
		blue fx_machinegun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}
weapon/machinegun/trail {
if (fx_enable == 0) {
if (fx_machinegun_tracer == 1) {
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
if (fx_machinegun_tracer == 1) {
		red fx_machinegun_r
		green fx_machinegun_g
		blue fx_machinegun_b
	
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

weapon/machinegun/fire {
	soundweapon sound/weapons/machinegun/machgf1b
if ( fx_machinegun_shells == 1 ) {
vibrate fx_machinegun_vibrate
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

weapon/machinegun/impact {
if (fx_enable == 0) {
	vibrate fx_machinegun_vibrate
	
		shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}
	size fx_machinegun_impact_size*3
	rotate 360 * rand
	Decal

	size fx_machinegun_impact_size*0.2
	shader smoke_animated3
	color	1 0.6 0.3
	model		models/weaphits/bullet.md3
	rotate		rand*360
	emitter 0.6 {
		dirModel
	}

	wobble	dir velocity 10 + rand*30
	scale	velocity velocity 200 + rand*50
	size	fx_machinegun_impact_size*0.5
	shader	prt_sun
	alpha	1

	emitter 0.6 + rand*0.3 {
		moveGravity 200
		colorFade 0.6
		Sprite
	}
}

if (fx_enable == 1) {

		red fx_machinegun_r
		green fx_machinegun_g
		blue fx_machinegun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
	emitter 0.1 {
	size fx_machinegun_impact_size*10 + fx_machinegun_impact_size*5 * rand
	light
	}
	
	vibrate fx_machinegun_vibrate

	shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}

	size fx_machinegun_impact_size*3
	rotate 360 * rand
	decal

	size fx_machinegun_impact_size*0.2
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
		t0 rand*fx_machinegun_impact_size*10 + fx_machinegun_impact_size*2.5
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
		wobble dir velocity fx_machinegun_impact_size*2.5 + rand * fx_machinegun_impact_size*5
		scale velocity velocity fx_machinegun_impact_size*75 + rand * fx_machinegun_impact_size*50
		size fx_machinegun_impact_size*0.015 + fx_machinegun_impact_size*0.005 * rand
		shader stone1
		emitter 3 {
			moveBounce 800 0.67
			dirModel
		}
	}

repeat 5 + fx_machinegun_impact_size*0.05 {
	color 0.2 0.2 0.2
	shader smoke_puff
	alpha 0.5
	t0 fx_machinegun_impact_size*2.5 + rand * fx_machinegun_impact_size*7.5
		
	wobble dir velocity fx_machinegun_impact_size*7.5 + rand * fx_machinegun_impact_size*20
	scale velocity velocity fx_machinegun_impact_size*5 + rand * fx_machinegun_impact_size*50
		
	emitter 0.45 {
			size fx_machinegun_impact_size*0.5 + lerp * t0
			colorFade 0.1
			moveBounce 80 0.67
			sprite
			}
		}
	}
}

weapon/machinegun/impactflesh {
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

weapon/shotgun/flash {
if (fx_enable == 0) {
if (fx_shotgun_flash == 1) {
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
if (fx_enable == 1) {
if (fx_shotgun_flash == 1) {
	emitter 0.07 {
		red fx_shotgun_r
		green fx_shotgun_g
		blue fx_shotgun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}
weapon/shotgun/trail {
if (fx_enable == 0) {
if (fx_shotgun_tracer == 1) {
		color	1 0.6 0.3
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
        if (rand > 0.4) {
            return
        }
		
repeat 5 {
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
if (fx_shotgun_tracer == 1) {
		red fx_shotgun_r
		green fx_shotgun_g
		blue fx_shotgun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
        if (rand > cg_tracerChance) {
            return
        }
		
repeat 5 {
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

weapon/shotgun/fire {
	soundweapon sound/weapons/shotgun/sshotf1b
if ( fx_shotgun_shells == 1 ) {
	repeat 2 {
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

weapon/shotgun/impact {
if (fx_enable == 0) {
	vibrate fx_shotgun_vibrate
	
		shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}
	size fx_machinegun_impact_size*3
	rotate 360 * rand
	Decal

	size fx_machinegun_impact_size*0.2
	shader smoke_animated3
	color	1 0.6 0.3
	model		models/weaphits/bullet.md3
	rotate		rand*360
	emitter 0.6 {
		dirModel
	}

	wobble	dir velocity 10 + rand*30
	scale	velocity velocity 200 + rand*50
	size	fx_machinegun_impact_size*0.4
	shader	prt_sun
	alpha	1

	emitter 0.6 + rand*0.3 {
		moveGravity 200
		colorFade 0.6
		Sprite
	}
}

if (fx_enable == 1) {

		red fx_shotgun_r
		green fx_shotgun_g
		blue fx_shotgun_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2) 
		
	emitter 0.1 {
	size fx_shotgun_impact_size*10 + fx_shotgun_impact_size*5 * rand
	light
	}
	
	vibrate fx_shotgun_vibrate

	shaderList rand {
		impact1
		impact2
		impact3
		impact4
		impact5
	}

	size fx_shotgun_impact_size*3
	rotate 360 * rand
	decal

	size fx_shotgun_impact_size*0.2
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
		t0 rand*fx_shotgun_impact_size*10 + fx_shotgun_impact_size*2.5
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
		wobble dir velocity fx_shotgun_impact_size*2.5 + rand * fx_shotgun_impact_size*5
		scale velocity velocity fx_shotgun_impact_size*75 + rand * fx_shotgun_impact_size*50
		size fx_shotgun_impact_size*0.015 + fx_shotgun_impact_size*0.005 * rand
		shader stone1
		emitter 3 {
			moveBounce 800 0.67
			dirModel
		}
	}

repeat 5 + fx_shotgun_impact_size*0.05 {
	color 0.2 0.2 0.2
	shader smoke_puff
	alpha 0.5
	t0 fx_shotgun_impact_size*2.5 + rand * fx_shotgun_impact_size*7.5
		
	wobble dir velocity fx_shotgun_impact_size*7.5 + rand * fx_shotgun_impact_size*20
	scale velocity velocity fx_shotgun_impact_size*5 + rand * fx_shotgun_impact_size*50
		
	emitter 0.45 {
			size fx_shotgun_impact_size*0.5 + lerp * t0
			colorFade 0.1
			moveBounce 80 0.67
			sprite
			}
		}
	}
}

weapon/shotgun/impactflesh {
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

weapon/grenade/flash {
if ( fx_enable == 0 ) {
if (fx_grenade_flash == 1) {
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
if (fx_grenade_flash == 1) {
	emitter 0.05 {
		red fx_grenade_impact_r
		green fx_grenade_impact_g
		blue fx_grenade_impact_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}

weapon/grenade/impact {
if (fx_enable == 0) {
	vibrate fx_grenade_vibrate
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
	size fx_grenade_impact_size*2
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
	vibrate fx_grenade_vibrate
	
	size fx_grenade_impact_size + rand
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

	red fx_grenade_impact_r
	green fx_grenade_impact_g
	blue fx_grenade_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_grenade_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_grenade_impact_style == 1) {
		repeat fx_grenade_impact_size*2 {
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
			t3 fx_grenade_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/13*t3)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_grenade_impact_style == 2) {
	repeat fx_grenade_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/6*rand+fx_grenade_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/2+(fx_grenade_impact_size/2+fx_grenade_impact_size/2*t0)*sin(fx_grenade_impact_size/3+lerp*fx_grenade_impact_size*2.0+lerp*fx_grenade_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_grenade_impact_style == 3) {
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_grenade_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/10+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 4) {

		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_grenade_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/12+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_grenade_impact_style == 5) {


		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_grenade_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_grenade_impact_size/12+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 6) {
	repeat fx_grenade_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/4.5*rand+fx_grenade_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/3+(fx_grenade_impact_size/3.2+fx_grenade_impact_size/4*t0)*sin(fx_grenade_impact_size/2.6+lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*3+lerp*fx_grenade_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_grenade_impact_style == 7) {
	repeat fx_grenade_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/5*rand+fx_grenade_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/5+(fx_grenade_impact_size/3.2+fx_grenade_impact_size/2*t0)*sin(fx_grenade_impact_size/2+lerp*fx_grenade_impact_size*3+lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_grenade_impact_style == 8) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_grenade_impact_size/14+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.4+lerp*fx_grenade_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 9) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*2+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_grenade_impact_style == 10) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*1.5+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_grenade_impact_style == 11) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*2.3+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_grenade_impact_style == 12) {


		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size/14+(fx_grenade_impact_size/8*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_grenade_impact_style == 13) {


		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_grenade_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/20+(fx_grenade_impact_size/8*t0)*sin(lerp*fx_grenade_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_grenade_impact_style == 14) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/7*t0)*sin(lerp*fx_grenade_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_grenade_impact_style == 15) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/7*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_grenade_impact_style == 16) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/4+(fx_grenade_impact_size/10*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 17) {
		repeat fx_grenade_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/2+(fx_grenade_impact_size/10*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 18) {
		repeat fx_grenade_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/30*t0)*sin(lerp*fx_grenade_impact_size+lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_grenade_impact_style == 19) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/22*t0)*sin(lerp*fx_grenade_impact_size+lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_grenade_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_grenade_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_grenade_impact_size*3+fx_grenade_impact_size*7*rand
 
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
                                                size fx_grenade_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_grenade_impact_size/37 * rand
                        sprite
                }
        }
}
if (fx_grenade_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_grenade_impact_particles2_value/1.5 +rand*fx_grenade_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_grenade_impact_size*2+fx_grenade_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_grenade_impact_size/30 * rand
                        sprite
                }
        }
}	

if (fx_grenade_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_grenade_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_grenade_impact_size*12+fx_grenade_impact_size*6*rand
 
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
                                                size fx_grenade_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_grenade_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_grenade_impact_stones == 1) {
	movegravity 400
	repeat fx_grenade_impact_stones_value/1.5+fx_grenade_impact_stones_value/3*rand {
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
			addScale    parentVelocity v0 velocity fx_grenade_impact_size*4+fx_grenade_impact_size*4*rand
			emitter 5+5*rand
			{
				size fx_grenade_impact_size/2500+rand*fx_grenade_impact_size/500
				moveBounce 500 .5
				anglesModel  
			}
		}
	}
}
}


weapon/grenade/projectile {
if (fx_enable == 0) {
	model		"source/models/ammo/grenade/grenade1.md3"
        if velocity {
           rotate time * 1000 / 4
        }
	size (fx_grenade_projectile_size/12)
	anglesModel
	color 1 0.5 0.1
	emitter 0.005 {
	size 30+ 20*rand
	light
	}
	}

if (fx_enable == 1) {
if (fx_grenade_projectile_type == 1) {
	model		"source/models/ammo/grenade/grenade1.md3"
        if velocity {
           rotate time * 1000 / 4
        }
	size (fx_grenade_projectile_size/12)
	anglesModel
	}
if (fx_grenade_projectile_type == 2) {
	model		"source/models/ammo/grenade2/grenade1.md3"
        if velocity {
           rotate time * 1000 / 4
        }
	size (fx_grenade_projectile_size/12)
	anglesModel
	}
if (fx_grenade_projectile_type == 3) {
	model		"source/models/ammo/grenade3/grenade1.md3"
        if velocity {
           rotate time * 1000 / 4
        }
	size (fx_grenade_projectile_size/12)
	anglesModel
	}
if (fx_grenade_projectile_type == 4) {
	model		"source/models/ammo/grenade4/grenade1.md3"
        if velocity {
           rotate time * 1000 / 4
        }
	size (fx_grenade_projectile_size/12)
	anglesModel
	}
	distance 0.5+rand {	
	if (fx_grenade_projectile_smoke2 = 1) {	
		alpha fx_grenade_projectile_smoke2_alpha
		color 1 0.5 0
		t0 360 * rand
		t1 10 * rand
		t2 (fx_grenade_projectile_smoke2_size)/4*rand
		random dir

		red fx_grenade_projectile_smoke2_whiteratio
		blue fx_grenade_projectile_smoke2_whiteratio
		green fx_grenade_projectile_smoke2_whiteratio

		emitter (fx_grenade_projectile_smoke2_length)*rand {
			if( lerp > 0.8 ) {
				alpha 1 - ( 1 - lerp ) * 5	
			}

			rotate t0 
			size (fx_grenade_projectile_smoke2_size*3/4) + lerp * t2
			alphaFade 0.0

			shader Smoke_Puff
			sprite
			}	
		}
			random dir
	if (fx_grenade_projectile_smoke1 = 1) {	
		color 1 1 1
				t0 360 * rand
			t1 10 * rand
		t2 (fx_grenade_projectile_smoke1_size)/4*rand
		emitter (fx_grenade_projectile_smoke1_length)*rand {
			shaderList rand {
				prt_fire1
				prt_fire2
				prt_fire3
				prt_fire4
				prt_fire5
				prt_fire6
			}
			rotate t0 
			size (fx_grenade_projectile_size/18) + lerp * t2 / 2

			colorFade 0
			alphaFade 0

			quad
				}
			}
		}
	}
}


weapon/grenade/impactflesh {
if (fx_enable == 0) {
	vibrate 70
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
	vibrate fx_grenade_vibrate
	
	sound	sound/weapons/rocket/rocklx1a.wav

	red fx_grenade_impact_r
	green fx_grenade_impact_g
	blue fx_grenade_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_grenade_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_grenade_impact_style == 1) {
		repeat fx_grenade_impact_size*2 {
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
			t3 fx_grenade_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/13*t3)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_grenade_impact_style == 2) {
	repeat fx_grenade_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/6*rand+fx_grenade_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/2+(fx_grenade_impact_size/2+fx_grenade_impact_size/2*t0)*sin(fx_grenade_impact_size/3+lerp*fx_grenade_impact_size*2.0+lerp*fx_grenade_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_grenade_impact_style == 3) {
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_grenade_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/10+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 4) {

		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_grenade_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/12+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_grenade_impact_style == 5) {


		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_grenade_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_grenade_impact_size/12+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.8+lerp*fx_grenade_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 6) {
	repeat fx_grenade_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/4.5*rand+fx_grenade_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/3+(fx_grenade_impact_size/3.2+fx_grenade_impact_size/4*t0)*sin(fx_grenade_impact_size/2.6+lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*3+lerp*fx_grenade_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_grenade_impact_style == 7) {
	repeat fx_grenade_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_grenade_impact_size/5*rand+fx_grenade_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_grenade_impact_size/5+(fx_grenade_impact_size/3.2+fx_grenade_impact_size/2*t0)*sin(fx_grenade_impact_size/2+lerp*fx_grenade_impact_size*3+lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_grenade_impact_style == 8) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_grenade_impact_size/14+(fx_grenade_impact_size/13*t0)*sin(lerp*fx_grenade_impact_size*1.4+lerp*fx_grenade_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 9) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*2+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_grenade_impact_style == 10) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*1.5+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_grenade_impact_style == 11) {

		
		repeat fx_grenade_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size*2.3+(fx_grenade_impact_size/5*t0)*sin(lerp*fx_grenade_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_grenade_impact_style == 12) {


		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_grenade_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_grenade_impact_size/14+(fx_grenade_impact_size/8*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_grenade_impact_style == 13) {


		repeat fx_grenade_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_grenade_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_grenade_impact_size/20+(fx_grenade_impact_size/8*t0)*sin(lerp*fx_grenade_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_grenade_impact_style == 14) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/7*t0)*sin(lerp*fx_grenade_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_grenade_impact_style == 15) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/7*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_grenade_impact_style == 16) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/4+(fx_grenade_impact_size/10*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 17) {
		repeat fx_grenade_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/2+(fx_grenade_impact_size/10*t0)*sin(lerp*fx_grenade_impact_size*2+lerp*fx_grenade_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_grenade_impact_style == 18) {
		repeat fx_grenade_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/30*t0)*sin(lerp*fx_grenade_impact_size+lerp*fx_grenade_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_grenade_impact_style == 19) {
		repeat fx_grenade_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_grenade_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_grenade_impact_size/15+(fx_grenade_impact_size/22*t0)*sin(lerp*fx_grenade_impact_size+lerp*fx_grenade_impact_size/4)
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

weapon/grenade/trail {
if (fx_enable == 0) {
	color	1 0.5 0.1

	size	200
	Light

	// The standard smoke puff trail thing
	color	0.3 0.3 0.3
	alpha	0.15
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
if (fx_grenade_trail == 1) {
	distance  0.4+rand {
if (fx_grenade_trail_type == 1) {
	shaderlist rand {
	prt_fire1
	prt_fire2
	prt_fire3
	prt_fire4
	prt_fire5
	prt_fire6
		}
	}
if (fx_grenade_trail_type == 2) {
	shaderlist rand {
	prt_lightning1
	prt_lightning2
	prt_lightning3
	prt_lightning4
	prt_lightning5
	prt_lightning6
		}
	}
if (fx_grenade_trail_type == 3) {
	shaderlist rand {
	prt_circle_blur
		}
	}
if (fx_grenade_trail_type == 4) {
	shaderlist rand {
	prt_circle
		}
	}
if (fx_grenade_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_grenade_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_grenade_trail_type == 6) {
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


	t0 fx_grenade_projectile_size*1.3
	t1 fx_grenade_projectile_size/7
	t2 1
	t4 t2
	
	t5 fx_grenade_trail_r
	t6 fx_grenade_trail_g
	t7 fx_grenade_trail_b
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	
repeat t0 {
	
		if ( fx_grenade_trail_gradient == 1 ) {
			t5 (t5 + (fx_grenade_trail_b+0.001)/t0)
			t6 t6
			t7 (t7 - (fx_grenade_trail_b+0.001)/t0)
				if t5 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}	
		if ( fx_grenade_trail_gradient == 2 ) {
			t5 (t5 - (fx_grenade_trail_r+0.001)/t0)
			t6 t6
			t7 (t7 + (fx_grenade_trail_r+0.001)/t0)
				if t7 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}
		if ( fx_grenade_trail_gradient == 3 ) {
			t5 (t5 - (fx_grenade_trail_r+0.001)/t0)
			t6 (t6 + (fx_grenade_trail_r+0.001)/t0)
			t7 t7
				if t6 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}
		if ( fx_grenade_trail_gradient == 4 ) {
			t5 (t5 + (fx_grenade_trail_g+0.001)/t0)
			t6 (t6 - (fx_grenade_trail_g+0.001)/t0)
			t7 t7
				if t5 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}
		if ( fx_grenade_trail_gradient == 5 ) {
			t5 t5
			t6 (t6 - (fx_grenade_trail_g+0.001)/t0)
			t7 (t7 + (fx_grenade_trail_g+0.001)/t0)
				if t7 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}
		if ( fx_grenade_trail_gradient == 6 ) {
			t5 t5
			t6 (t6 + (fx_grenade_trail_b+0.001)/t0)
			t7 (t7 - (fx_grenade_trail_b+0.001)/t0)
				if t6 == 1 {
					t5 fx_grenade_trail_r
					t6 fx_grenade_trail_g
					t7 fx_grenade_trail_b
					}
			}
 
	
	red t5
	green t6 
	blue t7 
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1)	
			
	t4 t4+t2
	rotate rand*360*rand
	if t4 >= t0 {
	t4 t2
	}
		
	emitter t4*(fx_grenade_trail_length/12)/1000 {	
		random dir
		size t1*(fx_grenade_trail_size/12)/4
		width t1*(fx_grenade_trail_width/12)/2
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
}
if (fx_grenade_trail_particles == 1) {
	emitter 0.06 {
	size fx_grenade_projectile_size*3+ fx_grenade_projectile_size*2*rand
	light
	}
repeat 0+rand*1.5 {
	interval 0.006+rand*0.01 {
			
	red t5
	green t6 
	blue t7 
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
		wobble	dir velocity rand * (120/fx_grenade_trail_length)
		movegravity 50
		scale	velocity velocity (450/fx_grenade_trail_length) + rand * (350/fx_grenade_trail_length)
		width fx_grenade_trail_size/25 + rand*fx_grenade_trail_size/33
		size fx_grenade_trail_size/25 + rand*fx_grenade_trail_size/33
		shader prt_sun
				
							emitter fx_grenade_trail_length/20 + rand * fx_grenade_trail_length/50 {
							moveBounce 500 0.8
							spark
							quad
							}
					}
			}
		}
	}
}

weapon/rocket/flash {
if ( fx_enable == 0 ) {
if (fx_rocket_flash == 1) {
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
if (fx_rocket_flash == 1) {
	emitter 0.05 {
		red fx_rocket_impact_r
		green fx_rocket_impact_g
		blue fx_rocket_impact_b
	
		red clip(red+0.2)
		green clip(green+0.2)
		blue clip(blue+0.2)  

        size 200 + rand * 25
        Light
		}
	}
}
}

weapon/rocket/impact {
if (fx_enable == 0) {
	vibrate fx_rocket_vibrate
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
	size fx_rocket_impact_size*2
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
	vibrate fx_rocket_vibrate
	
	size fx_rocket_impact_size + rand
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

	red fx_rocket_impact_r
	green fx_rocket_impact_g
	blue fx_rocket_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_rocket_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_rocket_impact_style == 1) {
		repeat fx_rocket_impact_size*2 {
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
			t3 fx_rocket_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/13*t3)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_rocket_impact_style == 2) {
	repeat fx_rocket_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/6*rand+fx_rocket_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/2+(fx_rocket_impact_size/2+fx_rocket_impact_size/2*t0)*sin(fx_rocket_impact_size/3+lerp*fx_rocket_impact_size*2.0+lerp*fx_rocket_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_rocket_impact_style == 3) {
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_rocket_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/10+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 4) {

		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_rocket_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/12+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_rocket_impact_style == 5) {


		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_rocket_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_rocket_impact_size/12+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 6) {
	repeat fx_rocket_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/4.5*rand+fx_rocket_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/3+(fx_rocket_impact_size/3.2+fx_rocket_impact_size/4*t0)*sin(fx_rocket_impact_size/2.6+lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*3+lerp*fx_rocket_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_rocket_impact_style == 7) {
	repeat fx_rocket_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/5*rand+fx_rocket_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/5+(fx_rocket_impact_size/3.2+fx_rocket_impact_size/2*t0)*sin(fx_rocket_impact_size/2+lerp*fx_rocket_impact_size*3+lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_rocket_impact_style == 8) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_rocket_impact_size/14+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.4+lerp*fx_rocket_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 9) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*2+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_rocket_impact_style == 10) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*1.5+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_rocket_impact_style == 11) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*2.3+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_rocket_impact_style == 12) {


		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size/14+(fx_rocket_impact_size/8*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_rocket_impact_style == 13) {


		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_rocket_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/20+(fx_rocket_impact_size/8*t0)*sin(lerp*fx_rocket_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_rocket_impact_style == 14) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/7*t0)*sin(lerp*fx_rocket_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_rocket_impact_style == 15) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/7*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_rocket_impact_style == 16) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/4+(fx_rocket_impact_size/10*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 17) {
		repeat fx_rocket_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/2+(fx_rocket_impact_size/10*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 18) {
		repeat fx_rocket_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/30*t0)*sin(lerp*fx_rocket_impact_size+lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_rocket_impact_style == 19) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/22*t0)*sin(lerp*fx_rocket_impact_size+lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_rocket_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_rocket_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_rocket_impact_size*3+fx_rocket_impact_size*7*rand
 
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
                                                size fx_rocket_impact_size/60
                                                colorFade 0
                                                moveGravity 0
												
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_rocket_impact_size/37 * rand
                        sprite
                }
        }
}
if (fx_rocket_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_rocket_impact_particles2_value/1.5 +rand*fx_rocket_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_rocket_impact_size*2+fx_rocket_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_rocket_impact_size/30 * rand
                        sprite
                }
        }
}	

if (fx_rocket_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_rocket_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_rocket_impact_size*12+fx_rocket_impact_size*6*rand
 
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
                                                size fx_rocket_impact_size/60
                                                colorFade 0
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_rocket_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_rocket_impact_stones == 1) {
	movegravity 400
	repeat fx_rocket_impact_stones_value/1.5+fx_rocket_impact_stones_value/3*rand {
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
			addScale    parentVelocity v0 velocity fx_rocket_impact_size*4+fx_rocket_impact_size*4*rand
			emitter 5+5*rand
			{
				size fx_rocket_impact_size/2500+rand*fx_rocket_impact_size/500
				moveBounce 500 .5
				anglesModel  
			}
		}
	}
}
}







weapon/rocket/projectile {
if (fx_enable == 0) {
	model		"source/models/ammo/rocket3/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	color 1 0.5 0.1
	emitter 0.005 {
	size 30+ 20*rand
	light
	}
}

if (fx_enable == 1) {
if (fx_rocket_projectile_type == 1) {
	model		"source/models/ammo/rocket/rocket1.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 2) {
	model		"source/models/ammo/rocket/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 3) {
	model		"source/models/ammo/rocket2/rocket1.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 4) {
	model		"source/models/ammo/rocket2/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 5) {
	model		"source/models/ammo/rocket3/rocket1.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 6) {
	model		"source/models/ammo/rocket3/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/12)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 7) {
	model		"source/models/ammo/rocket4/rocket1.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/20)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 8) {
	model		"source/models/ammo/rocket4/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/20)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 9) {
	model		"source/models/ammo/rocket5/rocket1.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/20)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
if (fx_rocket_projectile_type == 10) {
	model		"source/models/ammo/rocket5/rocket.md3"
	rotate time * 1000 / 4
	size (fx_rocket_projectile_size/20)
	dirModel
	loopSound "sound/weapons/rocket/rockfly.wav"
	}
	distance 0.5+rand {	
	if (fx_rocket_projectile_smoke2 = 1) {	
		alpha fx_rocket_projectile_smoke2_alpha
		color 1 0.5 0
		t0 360 * rand
		t1 10 * rand
		t2 (fx_rocket_projectile_smoke2_size)/4*rand
		random dir

		red fx_rocket_projectile_smoke2_whiteratio
		blue fx_rocket_projectile_smoke2_whiteratio
		green fx_rocket_projectile_smoke2_whiteratio

		emitter (fx_rocket_projectile_smoke2_length)*rand {
			if( lerp > 0.8 ) {
				alpha 1 - ( 1 - lerp ) * 5	
			}

			rotate t0 
			size (fx_rocket_projectile_smoke2_size*3/4) + lerp * fx_rocket_projectile_smoke2_size/3*rand
			alphaFade 0.0

			shader Smoke_Puff
			sprite
			}	
		}
			random dir
	if (fx_rocket_projectile_smoke1 = 1) {	
		color 1 1 1
				t0 360 * rand
			t1 10 * rand
		t2 (fx_rocket_projectile_smoke1_size)/4*rand
		emitter (fx_rocket_projectile_smoke1_length)*rand {
			shaderList rand {
				prt_fire1
				prt_fire2
				prt_fire3
				prt_fire4
				prt_fire5
				prt_fire6
			}
			rotate t0 
			size (fx_rocket_projectile_size/18) + lerp * t2 / 0.4

			colorFade 0
			alphaFade 0

			quad
				}
			}
		}
	}
}


weapon/rocket/impactflesh {
if (fx_enable == 0) {
	vibrate fx_rocket_vibrate
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
	vibrate fx_rocket_vibrate
	
	sound	sound/weapons/rocket/rocklx1a.wav

	red fx_rocket_impact_r
	green fx_rocket_impact_g
	blue fx_rocket_impact_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_rocket_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_rocket_impact_style == 1) {
		repeat fx_rocket_impact_size*2 {
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
			t3 fx_rocket_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/13*t3)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_rocket_impact_style == 2) {
	repeat fx_rocket_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/6*rand+fx_rocket_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/2+(fx_rocket_impact_size/2+fx_rocket_impact_size/2*t0)*sin(fx_rocket_impact_size/3+lerp*fx_rocket_impact_size*2.0+lerp*fx_rocket_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_rocket_impact_style == 3) {
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_rocket_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/10+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 4) {

		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_rocket_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/12+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_rocket_impact_style == 5) {


		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_rocket_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_rocket_impact_size/12+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.8+lerp*fx_rocket_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 6) {
	repeat fx_rocket_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/4.5*rand+fx_rocket_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/3+(fx_rocket_impact_size/3.2+fx_rocket_impact_size/4*t0)*sin(fx_rocket_impact_size/2.6+lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*3+lerp*fx_rocket_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_rocket_impact_style == 7) {
	repeat fx_rocket_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_rocket_impact_size/5*rand+fx_rocket_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_rocket_impact_size/5+(fx_rocket_impact_size/3.2+fx_rocket_impact_size/2*t0)*sin(fx_rocket_impact_size/2+lerp*fx_rocket_impact_size*3+lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_rocket_impact_style == 8) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_rocket_impact_size/14+(fx_rocket_impact_size/13*t0)*sin(lerp*fx_rocket_impact_size*1.4+lerp*fx_rocket_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 9) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*2+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_rocket_impact_style == 10) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*1.5+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_rocket_impact_style == 11) {

		
		repeat fx_rocket_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size*2.3+(fx_rocket_impact_size/5*t0)*sin(lerp*fx_rocket_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_rocket_impact_style == 12) {


		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_rocket_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_rocket_impact_size/14+(fx_rocket_impact_size/8*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_rocket_impact_style == 13) {


		repeat fx_rocket_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_rocket_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_rocket_impact_size/20+(fx_rocket_impact_size/8*t0)*sin(lerp*fx_rocket_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_rocket_impact_style == 14) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/7*t0)*sin(lerp*fx_rocket_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_rocket_impact_style == 15) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/7*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_rocket_impact_style == 16) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/4+(fx_rocket_impact_size/10*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 17) {
		repeat fx_rocket_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/2+(fx_rocket_impact_size/10*t0)*sin(lerp*fx_rocket_impact_size*2+lerp*fx_rocket_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_rocket_impact_style == 18) {
		repeat fx_rocket_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/30*t0)*sin(lerp*fx_rocket_impact_size+lerp*fx_rocket_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_rocket_impact_style == 19) {
		repeat fx_rocket_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_rocket_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_rocket_impact_size/15+(fx_rocket_impact_size/22*t0)*sin(lerp*fx_rocket_impact_size+lerp*fx_rocket_impact_size/4)
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

weapon/rocket/trail {
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
if (fx_rocket_trail == 1) {
	distance  0.25+rand {
if (fx_rocket_trail_type == 1) {
	shaderlist rand {
	prt_fire1
	prt_fire2
	prt_fire3
	prt_fire4
	prt_fire5
	prt_fire6
		}
	}
if (fx_rocket_trail_type == 2) {
	shaderlist rand {
	prt_lightning1
	prt_lightning2
	prt_lightning3
	prt_lightning4
	prt_lightning5
	prt_lightning6
		}
	}
if (fx_rocket_trail_type == 3) {
	shaderlist rand {
	prt_circle_blur
		}
	}
if (fx_rocket_trail_type == 4) {
	shaderlist rand {
	prt_circle
		}
	}
if (fx_rocket_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_rocket_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_rocket_trail_type == 6) {
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


	t0 fx_rocket_projectile_size*1.3
	t1 fx_rocket_projectile_size/7
	t2 1
	t4 t2
	
	t5 fx_rocket_trail_r
	t6 fx_rocket_trail_g
	t7 fx_rocket_trail_b
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	
repeat t0 {
	
		if ( fx_rocket_trail_gradient == 1 ) {
			t5 (t5 + (fx_rocket_trail_b+0.001)/t0)
			t6 t6
			t7 (t7 - (fx_rocket_trail_b+0.001)/t0)
				if t5 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}	
		if ( fx_rocket_trail_gradient == 2 ) {
			t5 (t5 - (fx_rocket_trail_r+0.001)/t0)
			t6 t6
			t7 (t7 + (fx_rocket_trail_r+0.001)/t0)
				if t7 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}
		if ( fx_rocket_trail_gradient == 3 ) {
			t5 (t5 - (fx_rocket_trail_r+0.001)/t0)
			t6 (t6 + (fx_rocket_trail_r+0.001)/t0)
			t7 t7
				if t6 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}
		if ( fx_rocket_trail_gradient == 4 ) {
			t5 (t5 + (fx_rocket_trail_g+0.001)/t0)
			t6 (t6 - (fx_rocket_trail_g+0.001)/t0)
			t7 t7
				if t5 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}
		if ( fx_rocket_trail_gradient == 5 ) {
			t5 t5
			t6 (t6 - (fx_rocket_trail_g+0.001)/t0)
			t7 (t7 + (fx_rocket_trail_g+0.001)/t0)
				if t7 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}
		if ( fx_rocket_trail_gradient == 6 ) {
			t5 t5
			t6 (t6 + (fx_rocket_trail_b+0.001)/t0)
			t7 (t7 - (fx_rocket_trail_b+0.001)/t0)
				if t6 == 1 {
					t5 fx_rocket_trail_r
					t6 fx_rocket_trail_g
					t7 fx_rocket_trail_b
					}
			}
 
	
	red t5
	green t6 
	blue t7 
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1)	
			
	t4 t4+t2
	rotate rand*360*rand
	if t4 >= t0 {
	t4 t2
	}
		
	emitter t4*(fx_rocket_trail_length/12)/1000 {	
		random dir
		size t1*(fx_rocket_trail_size/12)/4
		width t1*(fx_rocket_trail_width/12)/2
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
}
if (fx_rocket_trail_particles == 1) {
repeat 0+rand*1.5 {
	interval 0.006+rand*0.01 {
			
	red t5
	green t6 
	blue t7 
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
		wobble	dir velocity rand * (120/fx_rocket_trail_length)
		movegravity 50
		scale	velocity velocity (450/fx_rocket_trail_length) + rand * (350/fx_rocket_trail_length)
		width fx_rocket_trail_size/25 + rand*fx_rocket_trail_size/33
		size fx_rocket_trail_size/25 + rand*fx_rocket_trail_size/33
		shader prt_sun
				
							emitter fx_rocket_trail_length/20 + rand * fx_rocket_trail_length/50 {
							moveBounce 500 0.8
							spark
							quad
							}
					}
			}
		}
	}
	emitter 0.06 {
	size fx_rocket_projectile_size*3+ fx_rocket_projectile_size*2*rand
	light
	}
}

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

weapon/bfg/flash {
if ( fx_enable == 0 ) {
if (fx_bfg_flash == 1) {
	emitter 0.05 {
		color 0 1 0.1
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1)  

        size 200 + rand * 25
        Light
		}
	}
}
if ( fx_enable == 1 ) {
if (fx_bfg_flash == 1) {
	emitter 0.05 {
		red fx_bfg_r
		green fx_bfg_g
		blue fx_bfg_b
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1)  

        size 200 + rand * 25
        Light
		}
	}
}
}

weapon/bfg/impact {

if (fx_enable == 0) {
	vibrate fx_bfg_vibrate
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
	shader bfgExplosion
	size fx_bfg_impact_size*2.2
	// Will be the light colour
			color 0 1 0.1
	
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
	vibrate fx_bfg_vibrate
	
	size fx_bfg_impact_size + rand
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

	red fx_bfg_r
	green fx_bfg_g
	blue fx_bfg_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_bfg_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
if (fx_bfg_impact_shockwave == 1) {
repeat 5 {
		shaderlist rand {
		shockwave1
		shockwave2
		shockwave3
		shockwave4
		shockwave5
		shockwave6
		shockwave7
		shockwave8
		shockwave9
		shockwave10
		shockwave11
		shockwave12
		shockwave13
		shockwave14
		shockwave15
		shockwave16
		shockwave17
		shockwave18		
		}
		//random dir
	t3 fx_bfg_impact_size*1+ rand*fx_bfg_impact_size*1
		emitter 0.65 {
			rotate t0 + t1 * time +lerp*360
			size (fx_railgun_impact_size/10) + lerp* t3
			colorFade 0.2

			quad
		}
	}
}
	if (fx_bfg_impact_smoke == 1) {
	copy origin v3

	repeat fx_bfg_impact_size {
	alpha 0.5
		copy v3 origin
		random velocity
		addScale origin velocity origin 45
		width fx_bfg_impact_size*3
		size fx_bfg_impact_size*3
		shader smoke_shot

		emitter 0.35 {
			colorFade 0.2
			spark
		}
		addScale origin velocity origin -45
	}
}	

if (fx_bfg_impact_style == 1) {
		repeat fx_bfg_impact_size*2 {
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
			t3 fx_bfg_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/13*t3)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_bfg_impact_style == 2) {
	repeat fx_bfg_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/6*rand+fx_bfg_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/2+(fx_bfg_impact_size/2+fx_bfg_impact_size/2*t0)*sin(fx_bfg_impact_size/3+lerp*fx_bfg_impact_size*2.0+lerp*fx_bfg_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_bfg_impact_style == 3) {
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_bfg_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/10+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 4) {

		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_bfg_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/12+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_bfg_impact_style == 5) {


		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_bfg_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_bfg_impact_size/12+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 6) {
	repeat fx_bfg_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/4.5*rand+fx_bfg_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/3+(fx_bfg_impact_size/3.2+fx_bfg_impact_size/4*t0)*sin(fx_bfg_impact_size/2.6+lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*3+lerp*fx_bfg_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_bfg_impact_style == 7) {
	repeat fx_bfg_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/5*rand+fx_bfg_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/5+(fx_bfg_impact_size/3.2+fx_bfg_impact_size/2*t0)*sin(fx_bfg_impact_size/2+lerp*fx_bfg_impact_size*3+lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_bfg_impact_style == 8) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_bfg_impact_size/14+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.4+lerp*fx_bfg_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 9) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*2+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_style == 10) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*1.5+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_bfg_impact_style == 11) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*2.3+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_bfg_impact_style == 12) {


		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size/14+(fx_bfg_impact_size/8*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_bfg_impact_style == 13) {


		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_bfg_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/20+(fx_bfg_impact_size/8*t0)*sin(lerp*fx_bfg_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_bfg_impact_style == 14) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/7*t0)*sin(lerp*fx_bfg_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_bfg_impact_style == 15) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/7*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_bfg_impact_style == 16) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/4+(fx_bfg_impact_size/10*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 17) {
		repeat fx_bfg_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/2+(fx_bfg_impact_size/10*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 18) {
		repeat fx_bfg_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/30*t0)*sin(lerp*fx_bfg_impact_size+lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_style == 19) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/22*t0)*sin(lerp*fx_bfg_impact_size+lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_bfg_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*3+fx_bfg_impact_size*7*rand
 
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
                                                size fx_bfg_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_bfg_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_bfg_impact_particles2_value/1.5 +rand*fx_bfg_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*2+fx_bfg_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/30 * rand
                        sprite
                }
        }
}	

if (fx_bfg_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_bfg_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*12+fx_bfg_impact_size*6*rand
 
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
                                                size fx_bfg_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_bfg_impact_stones == 1) {
	movegravity 400
	repeat fx_bfg_impact_stones_value/1.5+fx_bfg_impact_stones_value/3*rand {
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
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*4+fx_bfg_impact_size*4*rand
			emitter 5+5*rand
			{
				size fx_bfg_impact_size/2500+rand*fx_bfg_impact_size/500
				moveBounce 500 .5
				anglesModel  
				}
			}
		}
	}	
}

weapon/bfg/impactflesh {

if (fx_enable == 0) {
	vibrate fx_bfg_vibrate
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
	shader bfgExplosion
	size fx_bfg_impact_size*2.2
	// Will be the light colour
			color 0 1 0.1
	
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
	vibrate fx_bfg_vibrate
	sound	sound/weapons/rocket/rocklx1a.wav

	red fx_bfg_r
	green fx_bfg_g
	blue fx_bfg_b	
	
		red clip(red+0.1)
		green clip(green+0.1)
		blue clip(blue+0.1) 
	emitter 0.7 {
		size fx_bfg_impact_size*8.3 * clip( 2 - 2 * lerp )
		Light
	}
	if (fx_bfg_impact_smoke == 1) {
	copy origin v3

	repeat fx_bfg_impact_size {
	alpha 0.5
		copy v3 origin
		random velocity
		addScale origin velocity origin 45
		width fx_bfg_impact_size*3
		size fx_bfg_impact_size*3
		shader smoke_shot

		emitter 0.35 {
			colorFade 0.2
			spark
		}
		addScale origin velocity origin -45
	}
}	

if (fx_bfg_impact_style == 1) {
		repeat fx_bfg_impact_size*2 {
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
			t3 fx_bfg_impact_size*rand
			emitter 0.60 +rand*0.2 {
				rotate 15*lerp
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/13*t3)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}	
if (fx_bfg_impact_style == 2) {
	repeat fx_bfg_impact_size*4
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/6*rand+fx_bfg_impact_size/2
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .4+.7*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/2+(fx_bfg_impact_size/2+fx_bfg_impact_size/2*t0)*sin(fx_bfg_impact_size/3+lerp*fx_bfg_impact_size*2.0+lerp*fx_bfg_impact_size*2.0)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorFade 0.1
			quad
		}
	}
}

if (fx_bfg_impact_style == 3) {
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom2
				}

			random dir
			rotate rand*360
			t0 fx_bfg_impact_size*rand
			emitter 0.7 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/10+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 4) {

		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom3
				}

			random dir
			rotate rand*360
			t0 fx_bfg_impact_size*rand
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/12+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}	

if (fx_bfg_impact_style == 5) {


		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom4
				}

			random dir
			rotate rand*360
					t0 fx_bfg_impact_size*rand
			emitter 0.8 + rand*0.3 {
				roll lerp*7*t0
				size fx_bfg_impact_size/12+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.8+lerp*fx_bfg_impact_size*1.8)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 6) {
	repeat fx_bfg_impact_size*3
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/4.5*rand+fx_bfg_impact_size/1.5
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .70+.3*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/3+(fx_bfg_impact_size/3.2+fx_bfg_impact_size/4*t0)*sin(fx_bfg_impact_size/2.6+lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*3+lerp*fx_bfg_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			colorFade 0.1
			movegravity 0
			quad
		}
	}
}

if (fx_bfg_impact_style == 7) {
	repeat fx_bfg_impact_size*8
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
		addScale    parentVelocity v0 velocity fx_bfg_impact_size/5*rand+fx_bfg_impact_size/1.6
		t0 rand
		t1 crand
		t2 crand
		t3 crand	

		emitter .30+.7*rand
		{
			
			roll lerp*7*t0
			size fx_bfg_impact_size/5+(fx_bfg_impact_size/3.2+fx_bfg_impact_size/2*t0)*sin(fx_bfg_impact_size/2+lerp*fx_bfg_impact_size*3+lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
			dir0	t1+t1*.5
			dir1	t2+t2*.5
			dir2	t3+t3*.5
			movegravity 0
			colorfade 0.1
			quad
		}
	}
}

if (fx_bfg_impact_style == 8) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				smoke_animated3
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.60 +rand*0.2 {
				rotate 13*lerp
				size fx_bfg_impact_size/14+(fx_bfg_impact_size/13*t0)*sin(lerp*fx_bfg_impact_size*1.4+lerp*fx_bfg_impact_size*1.4)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 9) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom5
				}
			
			random dir
			rotate rand*360
		t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*2+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_style == 10) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom6
				}

			random dir
			rotate rand*360
		t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*1.5+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}


if (fx_bfg_impact_style == 11) {

		
		repeat fx_bfg_impact_size*2 {
			shaderList rand {
				rocketboom7
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size*2.3+(fx_bfg_impact_size/5*t0)*sin(lerp*fx_bfg_impact_size/5)
				colorFade 0.1
				quad
				}
			}
}	

if (fx_bfg_impact_style == 12) {


		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom8
				}

			random dir
			rotate rand*360
					t0 rand*fx_bfg_impact_size
			emitter 1.35 +rand*0.15 {
				roll lerp*7*t0
				size fx_bfg_impact_size/14+(fx_bfg_impact_size/8*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size*2)
				colorFade 0
				quad
				}
			}
			
}	
if (fx_bfg_impact_style == 13) {


		repeat fx_bfg_impact_size*4 {
			shaderList rand {
				rocketboom1
				}

			random dir
			rotate rand*360
					t0 rand*fx_bfg_impact_size
			emitter 0.9 +rand*0.1 {
				roll lerp*7*t0
				size fx_bfg_impact_size/20+(fx_bfg_impact_size/8*t0)*sin(lerp*fx_bfg_impact_size*1.5)
				colorFade 0.1
				quad
				}
			}
}
if (fx_bfg_impact_style == 14) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom9
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/7*t0)*sin(lerp*fx_bfg_impact_size*2)
				colorFade 0.1
				quad
				}
			}
}
if (fx_bfg_impact_style == 15) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom10
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/7*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size/5)
				colorFade 0
				quad
				}
		}
}

if (fx_bfg_impact_style == 16) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom11
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/4+(fx_bfg_impact_size/10*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size/4)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 17) {
		repeat fx_bfg_impact_size*5 {
			shaderList rand {
				rocketboom12
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/2+(fx_bfg_impact_size/10*t0)*sin(lerp*fx_bfg_impact_size*2+lerp*fx_bfg_impact_size)
				colorFade 0
				quad
				}
			}
}

if (fx_bfg_impact_style == 18) {
		repeat fx_bfg_impact_size*5 {
			shaderList rand {
				rocketboom13
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/30*t0)*sin(lerp*fx_bfg_impact_size+lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_style == 19) {
		repeat fx_bfg_impact_size*3 {
			shaderList rand {
				rocketboom14
				}

			random dir
			rotate rand*360
			t0 rand*fx_bfg_impact_size*5
			emitter 0.85 +rand*0.1 {
				size fx_bfg_impact_size/15+(fx_bfg_impact_size/22*t0)*sin(lerp*fx_bfg_impact_size+lerp*fx_bfg_impact_size/4)
				colorFade 0.1
				quad
				}
			}
}

if (fx_bfg_impact_particles1 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 5 +rand*fx_bfg_impact_particles1_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*3+fx_bfg_impact_size*7*rand
 
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
                                                size fx_bfg_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/37 * rand
                        sprite
                }
        }
}

if (fx_bfg_impact_particles2 == 1) {
		movegravity 400
		shader prt_circle_blur
		repeat fx_bfg_impact_particles2_value/1.5 +rand*fx_bfg_impact_particles2_value/3 {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*2+fx_bfg_impact_size*5*rand
 
                emitter 3 + rand * 1.75 {
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/30 * rand
                        sprite
                }
        }
}	

if (fx_bfg_impact_particles3 == 1) {	
		shader prt_circle_blur
		repeat 1 + rand * 2 +rand*fx_bfg_impact_particles3_value {
			random v0
			v02            v02+rand*2
			addScale    parentVelocity v0 velocity fx_bfg_impact_size*12+fx_bfg_impact_size*6*rand
 
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
                                                size fx_bfg_impact_size/60
                                                colorFade 0.2
                                                moveGravity 0
                                                sprite
                                        }
                                }
                        }
 
                        colorFade 0
                        shader prt_circle_blur
                        size fx_bfg_impact_size/37 * rand
                        sprite
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
weapon/bfg/projectile {
if (fx_enable == 0) {
	size (fx_bfg_projectile_size/8)
	model		models/weaphits/bfg.md3
	rotate time * 1000 / 2
	dirModel

	// ze flight sound
	loopSound	"sound/weapons/rocket/rockfly.wav"
}
if (fx_enable == 1) {
loopSound	"sound/weapons/rocket/rockfly.wav"
	model source/models/sphere.md3

	red fx_bfg_r
	green fx_bfg_g
	blue fx_bfg_b
	repeat 3 {
		rotate time * 360 * loopCount
		size (fx_bfg_projectile_size*2) * loop + sin( time * 1000 ) * 1
		shader models/powerups/health/sphere

		dirModel
	}

	copy origin v1
	repeat fx_bfg_projectile_size*2 {
		copy v1 origin

		t0 -1
		if( loop > 0.5 ) {
			t0 1
		}

		t1 -1 
		if( loop < 0.25 || loop > 0.75 ) {
			t1 1
		}

		t2 -1
		if( loop > 0.15 && loop < 0.65 ) {
			t2 1
		}

		dir0 sin( time * 1000 + t0 * loop * 1000 )
		dir1 cos( time * 1000 + t1 * loop * 1000 )
		dir2 sin( time * 1000 + t2 * loop * 1000 )

		random v0
		rotate 360 * time + 360 * loop
		scale v0 v0 0.01
		normalize dir
		add dir v0 dir
		size (fx_bfg_projectile_size*0.6)

		addScale origin dir origin fx_bfg_projectile_size*0.75
		shadertime cgtime + 1000 * loop
		shaderlist rand {
		prt_lightning1
		prt_lightning2
		prt_lightning3
		prt_lightning4
		prt_lightning5
		}
		quad
	}
	copy v1 origin
	repeat fx_bfg_projectile_size*5 {
		random velocity
		size (fx_bfg_projectile_size*2) + (fx_bfg_projectile_size*4) * rand
		width fx_bfg_projectile_size/20 + fx_bfg_projectile_size/3.6 * rand
		spark
	}
	emitter 0.005 {
	size (fx_bfg_projectile_size*5) + (fx_bfg_projectile_size*15) * rand
	light
	}
	}
}
weapon/bfg/trail {
if (fx_enable == 0) {
	color 0 1 0.3
	size	150
	Light
}


if (fx_enable == 1) {
	red fx_bfg_r
	green fx_bfg_g 
	blue fx_bfg_b	
if (fx_bfg_trail == 1) {
	distance  0.20+rand {
if (fx_bfg_trail_type == 1) {
	shaderlist rand {
	prt_fire1
	prt_fire2
	prt_fire3
	prt_fire4
	prt_fire5
	prt_fire6
		}
	}
if (fx_bfg_trail_type == 2) {
	shaderlist rand {
	prt_lightning1
	prt_lightning2
	prt_lightning3
	prt_lightning4
	prt_lightning5
	prt_lightning6
		}
	}
if (fx_bfg_trail_type == 3) {
	shaderlist rand {
	prt_circle_blur
		}
	}
if (fx_bfg_trail_type == 4) {
	shaderlist rand {
	prt_circle
		}
	}
if (fx_bfg_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_bfg_trail_type == 5) {
	shaderlist rand {
	prt_sun
		}
	}
if (fx_bfg_trail_type == 6) {
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
if (fx_bfg_trail_type == 7) {
	shaderlist rand {
	prt_ring
		}
	}

	t0 fx_bfg_projectile_size*1.3
	t1 fx_bfg_projectile_size/7
	t2 1
	t4 t2
if (fx_bfg_trail_style == 1) {
repeat t0 {
			
	t4 t4+t2
	rotate rand*360*rand
	if t4 >= t0 {
	t4 t2
	}
		
	emitter t4*(fx_bfg_trail_length/10)/1000 {	
		random dir
		size t1*(fx_bfg_trail_size/1.5)/4
		width t1*(fx_bfg_trail_width/1.5)/2
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
if (fx_bfg_trail_style == 2) {

	copy origin v3

	normalize dir
t1 fx_bfg_projectile_size*800
repeat 3 {
		perpendicular dir v0
		scale v0 v0 fx_bfg_projectile_size/2
		copy v0 v3

		rotatearound v0 dir v1 ( time * t1 )
		t1 t1+fx_bfg_projectile_size*50
		add origin v1 origin
		
		emitter fx_bfg_trail_length/300 {
			size fx_bfg_trail_size/6
			width fx_bfg_trail_width/6
			spark
			sprite
		}
			perpendicular dir v0
			scale v0 v0 fx_bfg_projectile_size/5
			copy v0 v3

			rotatearound v0 dir v1 ( time * t1 )
			t1 t1+fx_bfg_projectile_size*60
			add origin v1 origin
			}
		}
	}
}
}
	emitter 0.06 {
	size fx_bfg_projectile_size*20+ fx_bfg_projectile_size*15*rand
	light
	}
}

weapon/rail/impactflesh {
}


weapon/rail/trail {	
if (fx_enable == 0) {
	// Color1 gets set before calling
	// The beam
	size  r_railCoreWidth*0.5
	shader railCore
	emitter cg_railTrailTime * 0.001 {
		colorFade 0
		Beam
	}
	shader railDisc
	// color2 is stored in the parent input structure, retrieve it like this
	pushparent color2
	pop color
        if cg_railQL {  // wolfcam: 'cg_oldrail' doesn't exist
		// Do the rail rings -- inside the rail beam
		size r_railWidth*0.5
		// Rings take their stepsize from the width variable
		width r_railSegmentLength
		emitter cg_railTrailTime * 0.001 {
			colorFade 0.1
			Rings
		}
	}

        if cg_railRings {  // wolfcam: 'cg_oldrail' doesn't exist
		repeat 2 {
		// Do a spiral around the rail direction
		// Get length in t0
		t0 dir
		normalize dir
		// Create a perpendicular vector to the beam
		perpendicular dir v0
		// Radius around center
		scale v0 v0 3
		size 2
		// Set the rotate around angle to start value
		t1 rand*360
		// Go through length of beam in repeat steps
		repeat ( t0 ) {
			rotatearound v0 dir v1 t1 -50
			t1 t1 + 10.1
			addScale v1 dir origin loop * t0
			add parentOrigin origin origin
			emitter cg_railTrailTime * 0.002 {
				addScale origin v1 origin lerp * 0.5
				colorfade 0
				Sprite
				}
			}
		}
	}
}
if (fx_enable == 1) {
if (fx_railgun_railcore_style == 1) {
	copy dir v3
	t0 v3
	normalize dir
	pushparent color1
	pop color

	repeat (fx_railgun_railcore_size/2)*(t0 / 0.75) {
		t1 1 + rand * 0.4
		t2 360 * rand
		t3 100 * crand
		shaderList rand {
			prt_fire1
			prt_fire2
			prt_fire3
			prt_fire4
			prt_fire5
			prt_fire6
		}
	
		addScale v1 dir origin loop * t0
		add parentOrigin origin origin

		origin0 origin0 + crand * 1
		origin1 origin1 + crand * 1
		origin2 origin2 + crand * 1
		
		velocity0 crand * 1
		velocity1 crand * 1
		velocity2 crand * 1

		copy dir v2
		random dir

		emitter fx_railgun_trail_time {
			size fx_railgun_railcore_size/3  + lerp * 0.5
			rotate t2 + time * t3

			moveGravity 0
			colorFade 0
			quad
		}

		copy v2 dir
	}
}
if (fx_railgun_railcore_style == 2) {
	pushparent color1
	pop color
	// Color1 gets set before calling
	// The beam
	repeat 4 {
	size  fx_railgun_railcore_size*1.5
	shader railCore
	emitter fx_railgun_trail_time {
		colorfade 0
		Beam
		}
	}
		repeat 5 {
		t0 dir
		normalize dir
		// Create a perpendicular vector to the beam
		perpendicular dir v0
		// Radius around center
		scale v0 v0 fx_railgun_railcore_size/1.2
		size fx_railgun_railcore_size/3
		// Set the rotate around angle to start value
		t1 rand*360
		// Go through length of beam in repeat steps
		repeat ( t0 ) {
				shaderList rand {
			prt_fire1
			prt_fire2
			prt_fire3
			prt_fire4
			prt_fire5
			prt_fire6
		}
			rotatearound v0 dir v1 t1 -20
			t1 t1 + 6
			addScale v1 dir origin loop * t0
			add parentOrigin origin origin
			emitter fx_railgun_trail_time {
				addScale origin v1 origin lerp * 0.5
				colorfade 0
				Sprite
			}
		}
	}
}
if (fx_railgun_railcore_style == 3) {
        copy                    dir v3
        t0                      v3
        normalize               dir
        perpendicular   dir v0
        scale                   v0 v0 fx_railgun_railcore_size/3
        t1                      360    
	pushparent color1
	pop color		
        repeat          ( t0 / 0.7 ) {
		shaderList rand {
			prt_fire1
			prt_fire2
			prt_fire3
			prt_fire4
			prt_fire5
			prt_fire6
		}  
                size                    fx_railgun_railcore_size/3 + rand * fx_railgun_railcore_size/10
                rotatearound    v0 dir v1 t1+20
                t1                      t1 + 80.1
                addScale                v1 dir origin loop * t0
                add                     parentOrigin origin origin
                origin0                 origin0 + crand * fx_railgun_railcore_size/3
                origin1                 origin1 + crand * fx_railgun_railcore_size/3
                origin2                 origin2 + crand * fx_railgun_railcore_size/3
                velocity0               crand * ( loop - 1.5 ) * fx_railgun_railcore_size/1.5
                velocity1               crand * ( loop - 1.5 ) * fx_railgun_railcore_size/1.5
                velocity2               crand * ( loop - 1.5 ) * fx_railgun_railcore_size/1.5
                emitter                 fx_railgun_trail_time/2 + loop * t1 * 0.000029 {
                        moveGravity     0
                        colorFade               0
                        Sprite
                }
                }
       
       
        scale                   v0 v0 fx_railgun_railcore_size/30
        t1                      360
    pushparent color2
	pop color

        repeat ( t0 / 0.7 ) {
		shaderList rand {
			prt_fire1
			prt_fire2
			prt_fire3
			prt_fire4
			prt_fire5
			prt_fire6
		}  
                rotatearound    v0 dir v1 t1
                t1                      t1 + 5.1
                addScale                v1 dir origin loop * t0
                add                     parentOrigin origin origin
                origin0         origin0 + crand
                origin1         origin1 + crand  
                velocity0               crand * ( loop - 1.5 ) * 0.6
                velocity1               crand * ( loop - 1.5 ) * 0.6
                emitter                 fx_railgun_trail_time + loop * t1 * 0.00003 {
                        size                    fx_railgun_railcore_size/5 + fx_railgun_railcore_size/10 * rand * lerp
                        moveGravity     0
                        colorFade               0
                        Sprite         
                }
                }
}
if (fx_railgun_railcore_style == 4) {
	pushparent color1
	pop color
	// Color1 gets set before calling
	// The beam
	repeat 4 {
	size  fx_railgun_railcore_size*1.5
	shader railCore
	emitter fx_railgun_trail_time {
		colorfade 0
		Beam
		}
	}
}
}
}

weapon/rail/impact {
if fx_enable == 0 {
vibrate fx_railgun_vibrate
	sound	sound/weapons/plasma/plasmx1a.wav

	pushparent color1
	pop color
	size  fx_railgun_impact_size*0.1
	// The white expanding impact disc
	rotate    rand*360
	shader	railExplosion
	model	models/weaphits/ring02.md3
	emitter 0.6 {
		dirModel
	}

	// Plasma style impact mark
	size fx_railgun_impact_size*2
	shader	gfx/damage/plasma_mrk
	Decal energy
}
if fx_enable == 1 {
vibrate fx_railgun_vibrate
	sound		sound/weapons/plasma/plasmx1a.wav

	size fx_railgun_impact_size*2
	shaderList	rand {
			impact1
			impact2
			impact3
			impact4
			impact5
				}
	Decal energy

	pushparent color1
	pop color
	red clip( red + 0.2 )
	green clip( green + 0.2 )
	blue clip( blue + 0.2 )
	
	
	emitter 0.35 {
		size (fx_railgun_impact_size*30) * ( 1 - lerp ) + (fx_railgun_impact_size*5) * rand
		light
	}


if (fx_railgun_impact_shockwave == 1) {
repeat 5 {
		shaderlist rand {
		shockwave1
		shockwave2
		shockwave3
		shockwave4
		shockwave5
		shockwave6
		shockwave7
		shockwave8
		shockwave9
		shockwave10
		shockwave11
		shockwave12
		shockwave13
		shockwave14
		shockwave15
		shockwave16
		shockwave17
		shockwave18		
		}
		//random dir
	t3 fx_railgun_impact_size+ rand*fx_railgun_impact_size*2
		emitter 0.8 {
			rotate t0 + t1 * time +lerp*360
			size (fx_railgun_impact_size/10) + lerp* t3
			colorFade 0

			quad
		}
	}
}
if (fx_railgun_impact_explosion == 1) {
	repeat fx_railgun_impact_size*10 {
		t0 (fx_railgun_impact_size*3) + rand * (fx_railgun_impact_size*3)
		width (fx_railgun_impact_size/5) + rand

		shader prt_circle
		random velocity
		emitter 0.2 {
			size t0 * ( 1 - lerp )
			colorFade 0
			spark
		}
	}

	copy origin v3



	repeat (fx_railgun_impact_size*2.5) {
		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shader smoke_animated1

		t0 rand * 360
		t1 10 * crand

		emitter 0.8 {
			size fx_railgun_impact_size + (fx_railgun_impact_size/2) * lerp
			rotate t0 + t1 * time
			colorFade 0
			sprite
		}
	}
}

	
if (fx_railgun_impact_particles1 == 1) {
	repeat fx_railgun_impact_particles1_value {

		wobble	dir velocity (fx_railgun_impact_size*10) + (fx_railgun_impact_size*8) * rand
		scale	velocity velocity (fx_railgun_impact_size*10) + rand * (fx_railgun_impact_size*15)				
		size 			(fx_railgun_impact_size*0.06) + rand
		width 			(fx_railgun_impact_size*0.06) + rand
		shader	prt_circle
		emitter 2 {
			size ( 1 - lerp ) * (fx_railgun_impact_size*0.06) + rand
			
			moveBounce 	180 0.9
			colorFade 0
			sprite
		}

		size fx_railgun_impact_size*0.02
		shader prt_circle
		emitter 1 {
			size (fx_railgun_impact_size*0.02)

			colorFade 0
			sprite
		}
	}	
}

if (fx_railgun_impact_particles2 == 1) {
	repeat fx_railgun_impact_particles2_value * rand {

		wobble	dir velocity (fx_railgun_impact_size*10) + (fx_railgun_impact_size*8) * rand
		scale			velocity velocity (fx_railgun_impact_size*10) + rand * (fx_railgun_impact_size*8)
		t0				(fx_railgun_impact_size*0.25) + rand
		size 			t0
		width 			(fx_railgun_impact_size*0.15)*rand
		shader	prt_circle
		emitter 2 {
			size ( 1 - lerp ) * t0
			
			distance 0.35 {
				clear velocity
				rotate rand * 360

				shader prt_circle
				repeat 1 {
					sink 0
					normalize dir v0
					inverse v0
					random velocity
					scale velocity velocity (fx_railgun_impact_size/2) + (fx_railgun_impact_size/2) * rand


					shader	prt_circle
					emitter ( 0.05 + 0.1 * rand ) * ( 1 - lerp ) {
						size (fx_railgun_impact_size*0.07) - lerp * (fx_railgun_impact_size*0.03)
						colorFade 0.1
						moveGravity 0
						sprite
					}
				}
			}

			moveBounce 	130 0.9
			colorFade		0.75
			sprite
		}

	}
}

if (fx_railgun_impact_smoke == 1 ) {
	repeat fx_railgun_impact_size*3 {
		wobble dir velocity (fx_railgun_impact_size*2) + (fx_railgun_impact_size*3) * rand
		scale velocity velocity (fx_railgun_impact_size*5) + rand * (fx_railgun_impact_size*5)

		copy v3 origin

		origin0 origin0 + crand * 7.5
		origin1 origin1 + crand * 7.5
		origin2 origin2 + crand * 7.5

		shader Smoke_Puff

		t0 rand * 360
		t1 10 * crand

		color 0.3 0.3 0.3
		alpha 0.5

		emitter 0.495 {
			size (fx_railgun_impact_size*3) + (fx_railgun_impact_size/2) * lerp
			rotate t0 + t1 * time
			moveGravity 80
			sprite
			}
		}
	}
}
}

weapon/rail/flash {
if (fx_railgun_flash == 1) {
	pushparent color1
	pop color
		emitter 0.002 {
        size 200 + rand * 25
        Light
		}
	}
}

weapon/rail/fire {
soundweapon sound/weapons/railgun/railgf1a
if (fx_enable == 1) {
if (fx_railgun_fire == 1) {
vibrate fx_railgun_vibrate

	pushparent color1
	pop color

	red clip( red * 1.5 )
	green clip( green * 1.5 )
	blue clip( blue * 1.5 )

	normalize dir

	scale dir dir 15
	add origin dir origin
	normalize dir

	copy dir v3
	copy origin v2

	t3 6 // loop count -1
	t0 rand * 60

	copy parentDir dir

	shader prt_circle

	repeat 3 {
		emitter 0.5 {
			clear velocity
			
			copy v3 dir
			copy v2 origin

			clear v0
			clear v1

			normalize dir
			perpendicular dir v0

			rotatearound v0 dir v1 ( loop * 360 + time * 360 * 8 )
			normalize v1

			scale v1 v1 4 - lerp * 3
			copy v1 dir

			add origin dir origin
			addScale origin v3 origin sin( lerp * 90 ) * 30

			distance 0.5 + 0.5 * lerp {
				pushparent color1
				pop color

					shaderList rand {
						prt_fire1
						prt_fire2
						prt_fire3
						prt_fire4
						prt_fire5
						prt_fire6
					}
				t4 crand * 360
				t5 rand * 100 + 100

				emitter fx_railgun_trail_time {			
					size (fx_railgun_railcore_size/4) + rand * (fx_railgun_railcore_size/35) + lerp * (fx_railgun_railcore_size/13)

					rotate t4 + t5 * time

					random velocity
					moveGravity 0
					colorFade 0
					
					sprite
				}
			}

			size (fx_railgun_railcore_size/1.5)
			sprite
		}
	}

}
}
}

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
		repeat fx_plasma_impact_particles2_value/1.5 +rand*fx_plasma_impact_particles2_value/3 {
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

player/gibbed {
if ( fx_gibs_style == 1 ) {
	sound sound/player/gibsplt1.wav
	color 1 1 1

	repeat 55 {
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

	repeat 250 {
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

					size 10 + rand * 15
					rotate 360 * rand

					t0 0.5 + rand * 0.1
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

	shaderClear
	repeat 23 {
		modellist loop {
			models/gibsq3/abdomen.md3
			models/gibsq3/abdomen.md3
			models/gibsq3/arm.md3
			models/gibsq3/arm.md3
			models/gibsq3/chest.md3
			models/gibsq3/fist.md3
			models/gibsq3/fist.md3
			models/gibsq3/fist.md3
			models/gibsq3/fist.md3
			models/gibsq3/foot.md3
			models/gibsq3/foot.md3
			models/gibsq3/foot.md3
			models/gibsq3/foot.md3
			models/gibsq3/forearm.md3
			models/gibsq3/forearm.md3
			models/gibsq3/intestine.md3
			models/gibsq3/intestine.md3
			models/gibsq3/intestine.md3
			models/gibsq3/intestine.md3
			models/gibsq3/leg.md3
			models/gibsq3/leg.md3
			models/gibsq3/skull.md3
			models/gibsq3/brain.md3
		}

		random		v0
		v02			v02 + 1
		addScale	parentVelocity v0 velocity 550 + rand * 200
		scale		velocity velocity 0.5
		yaw			360 * rand
		pitch		360 * rand
		roll		360 * rand
		emitter 5 + rand * 3 {
			sink 0.9 50

			impact 5 {
				if rand < 0.25 {
					t0 rand * 3
					if t0 < 1 {
						sound sound/player/gibimp1.wav
					} else if t0 < 2 {
						sound sound/player/gibimp2.wav
					} else {
						sound sound/player/gibimp3.wav
					}
				}

				shaderList rand {
					BloodHit1
					BloodHit2
					BloodHit3
					BloodHit4	
					BloodHit5
				}

				color 0.6 0.6 0.6

				size 10 + rand * 4
				decal alpha

			///

				repeat 15 {
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
					t0 15 + rand * 15 

					color 0.5 0.5 0.5
					
			
					t2 rand * 10
					emitter 0.68 {
						size 5 + t0 * clip( lerp * 6 ) + 10 * lerp + t2

						if lerp > 0.7 {
							alpha 1 - ( lerp - 1 ) * 3.3
						}

						clear velocity
						moveGravity 1

						colorfade 0
						quad
					}
				}

			///
			}


			distance 15 + rand * 16 {
				color 0.5 0.5 0.5

				repeat 5 {
					t1 clip( 1 - lerp * 15 ) * 0.35 + rand * 0.3
					random dir

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

					emitter t1 {
						moveBounce 0 0.35
						size 20 + lerp * 20

						colorfade 0
						quad
					}
				}
			}

			size 0.75 + rand * 0.25
			moveBounce 800 0.35
			anglesModel
		}
	}
}
if ( fx_gibs_style == 2 ){
	repeat 30 {
		shaderList rand {
			smoke_animated3
			}
			red fx_gibs_sparks_r
			green fx_gibs_sparks_g
			blue fx_gibs_sparks_b
			rotate 360 + rand*360

			random dir
			t0 rand * 60 * loop + 20
			t1 rand * 25 + 20
			t3 rand*20
			alpha 100
			emitter 0.8 {
				size 8 + t3 + rand*2
				colorfade 0
			quad
			}
		}
           copy v3 velocity

           repeat 15 {
                // aim v0 in random direction, giving more height to upwards vector and scale add to velocity
		random		v0
		v02			v02+1
		addScale	parentVelocity v0 velocity 350
		yaw			360*rand
		pitch		360*rand
		roll		360*rand
                model models/gibs/sphere.md3
                size 0.8
		emitter 10 {
			moveBounce 800 0.6
                        // wolfcam  this is called after impact and distance
			//anglesModel
			impact 50 {
                                if rand < 0.5 {
                                    t0 rand * 4
                                    if t0 < 1 {
                                        sound sound/misc/electrogib_bounce_01.ogg
                                    } else if t0 < 2 {
                                        sound sound/misc/electrogib_bounce_02.ogg
                                    } else if t0 < 3 {
                                        sound sound/misc/electrogib_bounce_03.ogg
                                    } else {
                                        sound sound/misc/electrogib_bounce_04.ogg
                                    }
                                }
			}
			distance 4 {
				clear velocity
                                shader flareshader
                                size 1 + rand * 0.4
				emitter 2 {                                
					rotate rotate + 10*lerp
					sprite
				}
			}
                        anglesModel
		}
	}
}
if ( fx_gibs_style == 0 ) {}
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
			alphaFade 0.0

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
		repeat fx_prox_impact_particles2_value/1.5 +rand*fx_prox_impact_particles2_value/3 {
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
			alphaFade 0.0

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


fovi {

red clip(red+0.2)
green clip(green+0.2)
blue clip(blue+0.2)  
size 200 * ( 1 - lerp ) + 50 * rand
light

t1 cg_fov1
t2 cg_fov2
t3 cg_fov3
t4 fovtime
t5 fovtime2
	command cvarinterp cg_fov %t1 %t2 %t4 game
		emitter t4 {
		if ( t5 > 0 ) {
			if (lerp >= 0.980) {
			command cvarinterp cg_fov %t2 %t3 %t5 game
			}
		}
	}
}



