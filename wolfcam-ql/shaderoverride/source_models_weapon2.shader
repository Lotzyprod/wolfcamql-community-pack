models/weapons/vulcan/vulcan
{
	cull disable
	nopicmip
	{
		map	source/models/weapons/vulcan/vulcan.tga
		rgbgen lightingdiffuse	
	}
	{
        stage normalparallaxmap
        map source/models/weapons/vulcan/vulcan_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons/vulcan/vulcan_spec.tga
		specularreflectance 0.50
        specularexponent 16
    }
}

models/weapons/proxmine/proxmine3
{
	cull disable
	nopicmip
	{
		map	source/models/weapons/proxmine/proxmine3.tga
		rgbgen lightingdiffuse	
	}
	{
        stage normalparallaxmap
        map source/models/weapons/proxmine/proxmine3_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons/proxmine/proxmine3_spec.tga
		specularreflectance 0.50
        specularexponent 16
    }
}

models/weapons/nailgun/nailgun
{
	cull disable
	nopicmip
	{
		map	source/models/weapons/nailgun/nailgun.tga
		rgbgen lightingdiffuse	
	}
	{
        stage normalparallaxmap
        map source/models/weapons/nailgun/nailgun_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons/nailgun/nailgun_spec.tga
		specularreflectance 0.50
        specularexponent 16
    }
}


models/weapons3/hmg/hmg
{
	cull disable
	nopicmip
	{
		map	source/models/weapons3/hmg/hmg.tga
		rgbgen lightingdiffuse	
	}
	{
        stage normalparallaxmap
        map source/models/weapons3/hmg/hmg_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons3/hmg/hmg_spec.tga
		specularreflectance 0.50
        specularexponent 16
    }
}

models/weapons3/hmg/f_hmg
{
	nopicmip
	sort additive
	cull disable
	{
		map	source/models/weapons3/hmg/f_hmg.tga
		blendfunc add
	}
}


models/weapons2/bfg/bfg_e
{	
	nopicmip
	{
                map textures/effects/envmapbfg2.tga
				blendfunc gl_one gl_zero                   
                tcmod turb 0 .5 0 .1
                tcmod scale 1 1
                tcmod scroll .2 -.2         
                rgbgen identity             
        }	
        {
                map textures/effects/envmapbfg2.tga
				blendfunc add                   
                tcmod turb 0 .5 0 .1
                tcmod scale 1 1
                tcmod scroll .3 .6         
                rgbgen identity             
        }	      
}


models/weapons2/bfg/f_bfg
{
	nopicmip
	sort additive
	
        {
		map source/models/weapons2/bfg/f_bfg.tga
		blendfunc gl_one gl_one
        }

}

models/weapons2/gauntlet/gauntlet3
{
	nopicmip
	
	{
		animmap 10 models/weapons2/gauntlet/gauntlet3.tga models/weapons2/gauntlet/gauntlet4.tga
		blendfunc add
		rgbgen lightingdiffuse	
	}
}

models/weapons2/grapple/f_grapple
{
	nopicmip
	
	sort additive
	{
		map source/models/weapons2/grapple/f_grapple.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/grapple/grapple
{      
	nopicmip
    {
		map source/models/weapons2/grapple/grapple.tga
        blendfunc gl_one gl_zero
		rgbgen lightingdiffuse
	} 
    {
        map textures/sfx/specular.tga
        blendfunc add
        tcmod scroll .1 .1
        tcgen environment
        rgbgen lightingdiffuse
	}  
    {
		map source/models/weapons2/grapple/grapple.tga
        blendfunc blend
		rgbgen lightingdiffuse
	}   
	{
		map source/models/weapons2/grapple/grapple_brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
	}      
}

models/weapons2/grapple/grapple_h
{
	nopicmip
    
	{
        map source/models/weapons2/grapple/grapple_h.tga
        alphafunc ge128
		depthwrite
		rgbgen lightingdiffuse
    }
}

models/weapons2/grapple/grapple_j
{
	nopicmip
    
    {
        map source/models/weapons2/grapple/grapple_j.tga
        blendfunc gl_one gl_zero
        tcmod scroll 0.5 0
        rgbgen identity
    }
    {
        map textures/liquids/slimeteal.tga
        blendfunc add
        tcmod scale .7 .7
        tcmod turb 0 .4 0 .3
        tcmod scroll .7 -.4
        rgbgen identity
    }
    {
		map textures/effects/tinfx2c.tga
        tcgen environment
        blendfunc add              
        rgbgen lightingdiffuse
	}   
}

models/weapons2/grenadel/f_grenadel
{
	nopicmip
	sort additive
	
	{
		map	source/models/weapons2/grenadel/f_grenadel.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/grenadel/ring
{
	nopicmip
	
	{
		map source/models/weapons2/grenadel/ring.tga
        }

        {
                map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc add
                //rgbgen identity
        }
}



models/weapons2/lightning/ball
{
	nopicmip
   deformvertexes autosprite
        {
		map source/models/weapons2/lightning/ball.tga
		blendfunc add
                rgbgen wave triangle 1 2 0 7
                tcmod rotate 360
	}
        {
		map source/models/weapons2/lightning/ball.tga
		blendfunc add
                rgbgen wave triangle 1 5 1 3
                tcmod rotate -200
	}
	
}

models/weapons2/lightning/ball1
{
	nopicmip
	sort additive
	
	
	{
		animmap 15 models/weapons2/lightning/ball1.tga models/weapons2/lightning/ball2.tga
		blendfunc add
		rgbgen vertex				
	}
	
}



models/weapons2/lightning/crackle1
{
	nopicmip
	sort additive
	
	
	{
		animmap 15 models/weapons2/lightning/crackle1.tga models/weapons2/lightning/crackle2.tga models/weapons2/lightning/crackle3.tga models/weapons2/lightning/crackle4.tga models/weapons2/lightning/crackle5.tga models/weapons2/lightning/crackle6.tga models/weapons2/lightning/crackle7.tga models/weapons2/lightning/crackle8.tga
		blendfunc add
	}
		
}


models/weapons2/lightning/f_lightning
{
	nopicmip
	sort additive
	
	{
		map source/models/weapons2/lightning/f_lightning.tga
		blendfunc gl_one gl_one
	}
	{
		map source/models/weapons2/lightning/f_lightning.tga
		blendfunc gl_one gl_one
	}
}



models/weapons2/lightning/trail
{
	nopicmip
	{
		map source/models/weapons2/lightning/trail.tga
		tcmod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc add
	}
        {
		map source/models/weapons2/lightning/trail.tga
		tcmod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc add
	}
}

models/weapons2/lightning/trail1
{
	nopicmip
	sort additive
	
	
	{
		animmap 15 models/weapons2/lightning/trail1.tga models/weapons2/lightning/trail2.tga models/weapons2/lightning/trail3.tga models/weapons2/lightning/trail4.tga
		blendfunc add
		rgbgen vertex				
	}
	
}

models/weapons2/lightning/trail2
{
	nopicmip
	{
		map source/models/weapons2/lightning/trail2.tga
		tcmod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc add
	}
        {
		map source/models/weapons2/lightning/trail2.tga
		tcmod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc add
	}
}

models/weapons2/machinegun/f_machinegun
{
	nopicmip
	sort additive
	
	{
		map	source/models/weapons2/machinegun/f_machinegun.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/plasma/f_plasma
{
	nopicmip
	
	sort additive
	{
		map source/models/weapons2/plasma/f_plasma.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/plasma/plasma_glass
{
	nopicmip

	{
		map source/models/weapons2/none.tga
		blendfunc blend
	}
}

models/weapons2/plasma/plasma_glo
{
	nopicmip
    
	{
		map source/models/weapons2/plasma/plasma_glo.tga
                tcmod rotate 33
				tcmod scale 2 2
                tcmod scroll .7 1
                rgbgen identity
	}
		{
		map source/models/weapons2/plasma/plasma_glo.tga
                tcmod rotate 33
				tcmod scale 1.5 1.5
                tcmod scroll 1.5 0.6
				blendfunc add
                rgbgen identity
	}
}

models/weapons2/railgun/f_railgun2
{
	sort additive
	
	nopicmip

	{
		map	source/models/weapons2/railgun/f_railgun2.tga
		blendfunc gl_one gl_one
		rgbgen entity
	}
}

models/weapons2/railgun/railgun2
{

	{
		map	source/models/weapons2/none.tga
		blendfunc blend
	}
}

models/weapons2/railgun/railgun3
{
	nopicmip
	{
		map	source/models/weapons2/railgun/railgun3.tga
		rgbgen lightingdiffuse				
	}

	{
		map	source/models/weapons2/railgun/railgun3.glow.tga
		blendfunc gl_one gl_one
		rgbgen entity	// identity
	}
	
}

models/weapons2/railgun/railgun4
{
	nopicmip
	{
		map source/models/weapons2/railgun/railgun4.tga
		tcmod scroll 0.05 1
		rgbgen entity	// identity
	}
			{
		map source/models/weapons2/railgun/rail_glo.tga
		blendfunc add
                tcmod rotate 33
				tcmod scale 1.5 1.5
                tcmod scroll .7 1.4
                rgbgen entity
	}
				{
		map source/models/weapons2/railgun/rail_glo.tga
		blendfunc add
                tcmod rotate 33
				tcmod scale 1 1
                tcmod scroll 1 0.7
                rgbgen entity
	}
}

models/weapons2/rocketl/f_rocketl
{
	nopicmip
	
	sort additive
	{
		map source/models/weapons2/rocketl/f_rocketl.tga
		blendfunc gl_one gl_one
	}
}

// this one can go away eventually
models/weapons2/rocketl/rocketl14
{
	nopicmip
	
	sort additive
	{
		map source/models/weapons2/rocketl/f_rocketl.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/shotgun/f_shotgun
{
	nopicmip
	sort additive
	
	{
		map	source/models/weapons2/shotgun/f_shotgun.tga
		blendfunc gl_one gl_one
	}
}

models/weapons2/shotgun/shotgun_laser
{
	nopicmip
	
	{
		map	source/models/weapons2/shotgun/shotgun_laser.tga
		blendfunc add
	}
}

models/weapons/vulcan/vulcan
{
	
	nopicmip
	{
		map	models/weapons/vulcan/vulcan.tga
		rgbgen lightingdiffuse	
	}
}

models/weapons/vulcan/f_vulcan
{
	nopicmip
	sort additive
	
	{
		map	models/weapons/vulcan/f_vulcan.tga
		blendfunc add
	}
}

models/weapons2/lightning/lightning2
{
	cull disable
	nopicmip
	{
		map source/models/weapons2/lightning/lightning2.tga
		rgbgen lightingdiffuse	
	}
	{
        stage normalparallaxmap
        map source/models/weapons2/lightning/lightning2_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/lightning/lightning2_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}


models/weapons2/lightning/button
{
	nopicmip
        {
		map source/models/weapons2/lightning/button.tga
		rgbgen lightingdiffuse
		rgbgen wave sin 1 1 0 1		
	}
	{
        stage normalparallaxmap
        map source/models/weapons2/lightning/button_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/lightning/button_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/lightning/glass
{
	nopicmip
    {
		map source/models/weapons2/lightning/glass.tga
		rgbgen lightingdiffuse
	}
	{
        stage normalparallaxmap
        map source/models/weapons2/lightning/glass_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/lightning/glass_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/gauntlet/gauntlet2
{      
	cull disable
	nopicmip
	{
		map source/models/weapons2/gauntlet/gauntlet2.tga
		rgbgen lightingdiffuse
	}	
    {
        stage normalparallaxmap
		map	source/models/weapons2/gauntlet/gauntlet2_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/gauntlet/gauntlet2_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/rocketl/rocketl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/rocketl/rocketl.tga
		rgbgen lightingdiffuse
	}
    {
        stage normalparallaxmap
        map source/models/weapons2/rocketl/rocketl_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/rocketl/rocketl_spec.tga
		specularreflectance 0.65
        specularexponent 32
    }

}

models/weapons2/rocketl/rocketl2
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/rocketl/rocketl2.tga
		rgbgen lightingdiffuse
	}
    {
        stage normalparallaxmap
        map source/models/weapons2/rocketl/rocketl2_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/rocketl/rocketl2_spec.tga
		specularreflectance 0.65
        specularexponent 32
    }

}

models/weapons2/grenadel/grenadel
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/grenadel/grenadel.tga
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
        map source/models/weapons2/grenadel/grenadel_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
        map source/models/weapons2/grenadel/grenadel_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/machinegun/machinegun
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/machinegun/machinegun.tga
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/machinegun/machinegun_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/machinegun/machinegun_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/shotgun/shotgun
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/shotgun/shotgun.tga
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/shotgun/shotgun_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/shotgun/shotgun_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}

models/weapons2/railgun/railgun1
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/railgun/railgun1.tga
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/railgun/railgun1_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/railgun/railgun1_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
	{
	map models\weapons2\railgun/railgun5_glow.tga
	blendfunc gl_one gl_one
	rgbgen entity
	}
}
models/weapons2/bfg/bfg_k
{     
	nopicmip
 
        {
                map textures/effects/envmapbfg.tga
                blendfunc gl_one gl_zero
                tcmod rotate 30
                tcmod scroll 1 1
                tcgen environment
                rgbgen identity
	}  
        {
		map source/models/weapons2/bfg/bfg_k.tga
                blendfunc blend
		rgbgen lightingdiffuse
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/bfg/bfg_k_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/bfg/bfg_k_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }       
}

models/weapons2/bfg/bfg
{   
	nopicmip
		{
                map textures/effects/envmapbfg2.tga
				blendfunc gl_one gl_zero                   
                tcmod turb 0 .5 0 .1
                tcmod scale 3 3
                tcmod scroll .2 -.2         
                rgbgen identity             
        }
	        {
                map textures/effects/envmapbfg2.tga
				blendfunc add                   
                tcmod turb 0 .5 0 .1
                tcmod scale 3 3
                tcmod scroll .3 .6         
                rgbgen identity             
        }	
        {
		map source/models/weapons2/bfg/bfg.tga
                blendfunc blend
		rgbgen lightingdiffuse
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/bfg/bfg_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/bfg/bfg_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }            
}

models/weapons2/plasma/plasma
{
	//cull disable
	nopicmip
	{
		map source/models/weapons2/plasma/plasma_glo.tga
                tcmod rotate 33
				tcmod scale 2 2
                tcmod scroll .7 1
                rgbgen identity
	}
	{
		map	source/models/weapons2/plasma/plasma.jpg
		blendfunc blend
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/plasma/plasma_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/plasma/plasma_spec.tga
		specularreflectance 0.50
        specularexponent 16
    } 
}

models/weapons2/railgun/railgun3
{
	nopicmip
	{
		map source/models/weapons2/railgun/railgun3.tga
		rgbgen lightingdiffuse				
	}
    {
        stage normalparallaxmap
		map source/models/weapons2/railgun/railgun3_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map source/models/weapons2/railgun/railgun3_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
	{
		map source/models/weapons2/railgun/railgun3.glow.tga
		blendfunc add
		rgbgen entity	// identity
	}
}

models/weapons2/gauntlet/gauntlet1
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/gauntlet/gauntlet1.tga
		rgbgen lightingdiffuse	
	}
    {
        stage normalparallaxmap
		map	source/models/weapons2/gauntlet/gauntlet1_norm.tga
		parallaxdepth 0.04
    }
    {
        stage specularmap
		map	source/models/weapons2/gauntlet/gauntlet1_spec.tga
		specularreflectance 0.5
        specularexponent 8
    }
}