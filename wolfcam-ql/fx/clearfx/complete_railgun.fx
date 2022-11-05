//╔═══╦══╦══╦╗─╔═══╦╗╔╦╗─╔╗──╔══╦══╗╔══╗
//║╔═╗║╔╗╠╗╔╣║─║╔══╣║║║╚═╝║──║╔═╩═╗║║╔═╝
//║╚═╝║╚╝║║║║║─║║╔═╣║║║╔╗─║──║╚═╗─║╚╝║
//║╔╗╔╣╔╗║║║║║─║║╚╗║║║║║╚╗║──║╔═╝─║╔╗║
//║║║║║║║╠╝╚╣╚═╣╚═╝║╚╝║║─║║──║║─╔═╝║║╚═╗
//╚╝╚╝╚╝╚╩══╩══╩═══╩══╩╝─╚╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ 
//fx_railgun_trail_time               "0.7" - [eng] BEAM TIME [ru] ВРЕМЯ ЛУЧА
//fx_railgun_railcore_style            "1"  - [eng] BEAM STYLE [ru] СТИЛЬ ЛУЧА
//fx_railgun_railcore_size             "3"  - [eng] BEAM SIZE [ru] РАЗМЕР ЛУЧА
//fx_railgun_fire                      "1"  - [eng] FIRE PARTICLES [ru] ЧАСТИЦЫ ВЫСТРЕЛА
//fx_railgun_vibrate                   "5"  - [eng] EXPLOSIVE VIBRATION [ru] ТРЯСКА ЭКРАНА ОТ ПОПАДАНИЯ
//fx_railgun_impact_explosion          "1"  - [eng] EXPLOSION [ru] ВЗРЫВ
//fx_railgun_impact_size               "10" - [eng] EXPLOSION SIZE [ru] РАЗМЕР ВЗРЫВА
//fx_railgun_flash                     "1"  - [eng] FLASH WHEN FIRED [ru] ВСПЫШКА ОТ ВЫСТРЕЛА
//fx_railgun_impact_particles1         "1"  - [eng] PARTICLES 1 [ru] ЧАСТИЦЫ 1
//fx_railgun_impact_particles1_value   "50" - [eng] PARTICLES 1 VALUE [ru] КОЛ-ВО ЧАСТИЦ 1
//fx_railgun_impact_particles2         "1"  - [eng] PARTICLES 2 [ru] ЧАСТИЦЫ 2
//fx_railgun_impact_particles2_value   "3"  - [eng] PARTICLES 2 VALUE [ru] КОЛ-ВО ЧАСТИЦ 2
//fx_railgun_impact_smoke              "1"  - [eng] SMOKE [ru] ДЫМ
//fx_railgun_impact_shockwave          "1"  - [eng] SHOCKWAVE [ru] ВОЛНА
//...
//...

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
				colorFade 1
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
		colorFade 0.3
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
				colorFade 1
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
		colorFade 0.3
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
			colorFade 0.5

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
			colorFade		1
			sprite
		}

		size fx_railgun_impact_size*0.02
		shader prt_circle
		emitter 1 {
			size (fx_railgun_impact_size*0.02)

			colorFade 1
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
					colorfade 0.5
					
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
