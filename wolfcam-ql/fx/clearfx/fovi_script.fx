fovi {
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