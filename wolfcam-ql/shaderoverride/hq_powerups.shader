powerups/quadweapon
{	
	nopicmip
	cull none
	deformvertexes wave 1000 sin 0.35 0.1 1000 1

	{
		map textures/effects/quadmap.tga
		blendfunc add
		tcgen environment
		tcmod scale 2 2
		tcmod scroll .25 .25
	}
	{
		map textures/sfx/electric2.blend.jpg
		blendfunc add
		tcgen environment
		tcmod scroll -.5 -.5
	}
	{
		map textures/effects/lightning.jpg
		blendfunc add
		tcmod scale 2 2
		tcmod turb 0 .5 0 .1
		tcmod rotate -45

		tcgen environment
	}
}

powerups/regen
{
	nopicmip
	deformvertexes wave 120 sin 0.6 0.3 10 1
	{
		map textures/effects/regenmap2.tga
		blendfunc add
		tcgen environment
                tcmod rotate 30
				tcmod scale 2 2
		//tcmod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/battlesuit
{	
	nopicmip
	cull none
	deformvertexes wave 120 sin 0.6 0.3 10 1

	{
		map textures/effects/envmapgold.tga
		blendfunc add
		tcgen environment
		tcmod scroll 1 1
		tcmod rotate 90
		rgbgen wave sin 0.25 0.25 0 0
	}
	{
		map textures/sfx/kenelectric.tga
		tcmod scale 4 4
		tcmod rotate 30
		tcmod scroll 1 -1
		blendfunc add
	}
	{
		map textures/effects/lightning.jpg
		blendfunc add
		tcmod scroll -.5 1
		tcmod scale 2 2
		tcmod rotate 15
		tcgen environment
	}
	{
		map textures/effects/noise.tga
		tcmod scroll -0.1 0.1
		blendfunc add
		rgbgen wave sin 0.25 0.25 0 0
	}
}

powerups/quad
{	
	nopicmip
	cull none
	deformvertexes wave 1000 sin 0.45 0.1 1000 1

	{
		map textures/effects/quadmap.tga
		blendfunc add
		tcgen environment
		tcmod scroll .25 .25
	}

	{
		map textures/sfx/electric2.blend.jpg
		blendfunc add
		tcgen environment
		tcmod scroll -.5 -.5
	}

	{
		map textures/effects/lightning.jpg
		blendfunc add
		
		tcmod turb 0 .5 0 .1
		tcmod rotate -45

		tcgen environment
	}
}



powerups/battleweapon
{	
	cull none
	nopicmip
	deformvertexes wave 120 sin 0.25 0.15 10 1

	{
		map textures/effects/envmapgold.tga
		blendfunc add
		tcgen environment
		tcmod scroll 1 1
		tcmod rotate 90
		rgbgen wave sin 0.25 0.25 0 0
	}
	{
		map textures/sfx/kenelectric.tga
		tcmod scale 4 4
		tcmod rotate 30
		tcmod scroll 1 -1
		blendfunc add
	}
	{
		map textures/effects/lightning.jpg
		blendfunc add
		tcmod scroll -.5 1
		tcmod rotate 15
		tcgen environment
	}
	{
		map textures/effects/noise.tga
		tcmod scroll -0.1 0.1
		blendfunc add
		rgbgen wave sin 0.25 0.25 0 0
	}
}

models/powerups/instant/quad
{	
	nopicmip
	cull none

	{
		map textures/effects/quadmap.tga
		blendfunc gl_one gl_zero
		tcgen environment
		tcmod scroll 2 2
	}
	{
		map textures/effects/envmapbfg.tga
		blendfunc gl_one gl_one
		tcgen environment
		tcmod scroll 2 2
		tcmod rotate 90
	}
	{
		map textures/sfx/electric2.blend.jpg
		blendfunc add
		tcgen environment
		tcmod scroll -.5 -.5
	}
	{
		map textures/effects/lightning.jpg
		blendfunc add
		
		tcmod turb 0 .5 0 .1
		tcmod rotate -45

		tcgen environment
	}
}


models/powerups/holdable/medkit_base
{	
	{
		map textures/base_wall/chrome_env.jpg
		tcgen environment 
		rgbgen lightingdiffuse
		tcmod scale .5 .5
	}
}

models/powerups/holdable/medkit_plunger
{
	{
		map textures/effects/envmap.jpg
		tcgen environment
		blendfunc add
	}
}

models/powerups/holdable/medkit_slime
{	
	sort additive
	cull back
	{
		map models/powerups/holdable/medkit_fluid.jpg
		tcmod scroll 0 2
		blendfunc gl_one gl_one
	}
}

models/powerups/health/yellow
{
	
	{
		map textures/effects/envmapyel.tga
                tcgen environment
		//blendfunc gl_one gl_one
		
	}
        
}
models/powerups/health/sphere_orange
{
	{
		map textures/effects/envmapgold.tga
		tcgen environment
                tcmod rotate 44
                tcmod scroll 2 2
		blendfunc add
	}
}
models/powerups/health/red
{	
	
	{
		map textures/effects/envmapgold.tga
                tcgen environment
		blendfunc gl_one gl_zero
		
	}
        {
		map textures/sfx/kenelectric.tga
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc add
		
	}
}
models/powerups/health/mega2
{	
	
	{
		map textures/effects/envmapbfg.tga
                tcgen environment
		blendfunc gl_one gl_zero
		
	}
}
models/powerups/health/mega1
{
	{
		map textures/effects/envmapblue2.tga
                tcgen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc gl_one gl_one
	}
}
models/powerups/health/sphere_blue
{
        {
		map textures/effects/mhealth_sphere.tga
		tcmod rotate 45
                tcmod scroll 3 2
                tcgen environment
		blendfunc add
	}
}
models/powerups/health/blue_ring
{
	cull disable
        deformvertexes autosprite
	{
		map textures/effects/blue_ring.tga
		blendfunc gl_one gl_one
	}
}
models/powerups/health/green
{
	
	{
		map textures/effects/envmaprail.tga
		tcgen environment
		
	}
}
models/powerups/health/sphere_green
{
	{
		map textures/effects/envmaprail.tga
		tcmod rotate 45
                tcmod scroll 3 2
                tcgen environment
		rgbgen wave sin 0 0 0 0 
		blendfunc gl_one gl_one
	}
}
models/powerups/health/blue
{
	{
		map textures/effects/envmapbfg.tga
		tcgen environment
		
	}
}
models/powerups/health/sphere
{
	{
		map textures/effects/tinfx2c.tga
		tcmod rotate 22
                tcmod scroll 1 1
                tcgen environment
		blendfunc gl_one gl_one
	}
}
models/powerups/health/hp_small
{
	
	{
		map models/powerups/health/green.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
       }
	{
	        map models/powerups/health/hp_small.tga
		blendfunc blend
                rgbgen lightingdiffuse
     }
}
models/powerups/health/hp_med
{
	
	 {
		map models/powerups/health/yellow.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
       }
	{
	        map models/powerups/health/hp_small.tga
		blendfunc blend
                rgbgen lightingdiffuse
     }
}
models/powerups/health/hp_large
{	
	
	{
		map models/powerups/health/orange.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
       }
	{
	        map models/powerups/health/hp_small.tga
		blendfunc blend
                rgbgen lightingdiffuse
     }

}
models/powerups/health/hp_mega
{
	{
		map models/powerups/health/blue.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
    }
	{
	    map models/powerups/health/hp_small.tga
		blendfunc blend
        rgbgen lightingdiffuse
    }
}


models/powerups/armor/newredarmor
{      
	nopicmip
	{
        map textures/effects/tinfx2c.tga
        tcgen environment
        rgbgen lightingdiffuse
    }
    {
		map models/powerups/armor/newredarmor.tga
		blendfunc blend
		rgbgen lightingdiffuse
	} 
         
}

models/powerups/armor/newyellowarmor
{      
	nopicmip
 	{
		map models/powerups/armor/newyellowarmor.tga
		rgbgen lightingdiffuse
	}   
         
}

models/powerups/armor/newgreenarmor
{      
	nopicmip
    {
		map models/powerups/armor/newgreenarmor.tga
		rgbgen lightingdiffuse
	} 	
}

models/powerups/armor/shard2new
{
	nopicmip
        {
                map textures/effects/tinfx2c.tga
                tcgen environment
                rgbgen lightingdiffuse
        }
        {
                map models/powerups/armor/newshard2.tga
                blendfunc blend
                rgbgen lightingdiffuse
        }
}

models/powerups/ammo/bfgammo_new
{
	cull none
	{
		map models/powerups/ammo/blue.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_bfg
{
	{
		map models/powerups/ammo/ammo_bfg.tga
		blendfunc add
	}
	
}
models/powerups/ammo/grenammo_new
{
  	cull none
	{
		map models/powerups/ammo/green.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}

}
models/powerups/ammo/ammo_grenade
{
	{
		map models/powerups/ammo/ammo_grenade.tga
		blendfunc blend
	}
	
}
models/powerups/ammo/lighammo_new
{
	cull none
	{
	

		map models/powerups/ammo/pale_yellow.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}

}
models/powerups/ammo/ammo_lightning
{
	{
		map models/powerups/ammo/ammo_lightning.tga
		blendfunc add
	}
	
}
models/powerups/ammo/machammo_new
{
	cull none
	{
		map models/powerups/ammo/yellow.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}

}
models/powerups/ammo/ammo_machinegun
{
	{
		map models/powerups/ammo/ammo_machinegun.tga
		blendfunc add
	}
	
}
models/powerups/ammo/plasammo_new
{
	cull none
	{
		map models/powerups/ammo/purple.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_plasma
{
	{
		map models/powerups/ammo/ammo_plasma.tga
		blendfunc add
	}
	
}
models/powerups/ammo/railammo_new
{
	cull none
	{
		map models/powerups/ammo/bright_green.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_railgun
{
	{
		map models/powerups/ammo/ammo_railgun.tga
		blendfunc add
	}
	
}
models/powerups/ammo/rockammo_new
{
	cull none
	{
		map models/powerups/ammo/red.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_rocket
{
	{
		map models/powerups/ammo/ammo_rocket.tga
		blendfunc add
	}
	
}
models/powerups/ammo/shotammo_new
{
	cull none
	{
		map models/powerups/ammo/orange.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_shotgun
{
	{
		map models/powerups/ammo/ammo_shotgun.tga
		blendfunc add
	}
	
}

models/powerups/ammo/proxammo_new
{
	cull none
	{
		map models/powerups/ammo/purple.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}

}
models/powerups/ammo/ammo_proxmine
{
	{
		map models/powerups/ammo/ammo_proxmine.tga
		blendfunc add
	}
	
}

models/powerups/ammo/packammo_new
{
	cull none
	{
		map models/powerups/ammo/white.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_pack
{
	{
		map models/powerups/ammo/ammo_pack.tga
		blendfunc add
	}
	
}

models/powerups/ammo/chainammo_new
{
	cull none
	{
		map models/powerups/ammo/white.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_chaingun
{
	{
		map models/powerups/ammo/ammo_chaingun.tga
		blendfunc add
	}
	
}

models/powerups/ammo/nailammo_new
{
	cull none
	{
		map models/powerups/ammo/white.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_nailgun
{
	{
		map models/powerups/ammo/ammo_nailgun.tga
		blendfunc add
	}
	
}

models/powerups/ammo/hmgammo_new
{
	cull none
	{
		map models/powerups/ammo/yellow.tga
		tcgen environment
		blendfunc gl_one gl_zero
		rgbgen identity
	}
	{
		map models/powerups/ammo/ammobox_new.tga
		blendfunc blend
		rgbgen lightingdiffuse
	}
}
models/powerups/ammo/ammo_hmg
{
	{
		map models/powerups/ammo/ammo_hmg.tga
		blendfunc add
	}
	
}
