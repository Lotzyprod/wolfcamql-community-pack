//╔═══╦══╦══╗╔══╗──╔══╦══╗╔══╗
//║╔══╩╗╔╣╔╗║║╔═╝──║╔═╩═╗║║╔═╝
//║║╔═╗║║║╚╝╚╣╚═╗──║╚═╗─║╚╝║
//║║╚╗║║║║╔═╗╠═╗║──║╔═╝─║╔╗║
//║╚═╝╠╝╚╣╚═╝╠═╝║──║║─╔═╝║║╚═╗
//╚═══╩══╩═══╩══╝──╚╝─╚══╝╚══╝

//coded by legless (qlaidaho)
//completed by lotzyprod

//- [eng] CVARS [ru] ПЕРЕМЕННЫЕ
//fx_gibs_style          "1"  - [eng] GIBS TYPE (1-blood(q3),2-sparks(ql) [ru] ТИП ГИБСОВ (1 - кровь, 2 - искры)
//fx_gibs_sparks_size    "1"  - [eng] GIBS SPARKS SIZE [ru] РАЗМЕР ИСКР
//fx_gibs_sparks_r      "1.0" - [eng] RED SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ КРАСНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_g      "1.0" - [eng] GREEN SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ ЗЕЛЕНОГО ЦВЕТА В ИСКРАХ
//fx_gibs_sparks_b      "1.0" - [eng] BLUE SPARKS COLOR RATIO [ru] СООТНОШЕНИЕ СИНЕГО ЦВЕТА В ИСКРАХ

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

						colorFade 1
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

						colorFade 0.3
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
				colorFade 1
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