models/weapons/vulcan/vulcan_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons/vulcan/vulcan.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		blendfunc add
		tcmod scale 0.3 0.3
		tcgen environment
	}
	{
		map	source/models/weapons/vulcan/vulcan.tga
		blendfunc blend
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

models/weapons/proxmine/proxmine3_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons/proxmine/proxmine3.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcmod scale 0.3 0.3
		blendfunc add
		tcgen environment
	}
	{
		map	source/models/weapons/proxmine/proxmine3.tga
		blendfunc blend
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

models/weapons/nailgun/nailgun_refl
{
	cull disable
	nopicmip
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
	}
	{
		map	source/models/weapons/nailgun/nailgun.tga
		blendfunc blend
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



models/weapons3/hmg/hmg_refl
{
	cull disable
	nopicmip
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
	}
	{
		map	source/models/weapons3/hmg/hmg.tga
		blendfunc blend
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

models/weapons2/lightning/lightning2_refl
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


models/weapons2/lightning/button_refl
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

models/weapons2/lightning/glass_refl
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

models/weapons2/gauntlet/gauntlet2_refl
{      
	cull disable
	nopicmip
	{
		map source/models/weapons2/gauntlet/gauntlet2.tga
		rgbgen lightingdiffuse
	}	
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
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

models/weapons2/rocketl/rocketl_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/rocketl/rocketl.tga
		rgbgen lightingdiffuse
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
	}
	{
		map	source/models/weapons2/rocketl/rocketl_norefl.tga
		blendfunc blend
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

models/weapons2/rocketl/rocketl2_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/rocketl/rocketl2.tga
		rgbgen lightingdiffuse
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
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

models/weapons2/grenadel/grenadel_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/grenadel/grenadel.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
	}
	{
		map	source/models/weapons2/grenadel/grenadel_norefl.tga
		blendfunc blend
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

models/weapons2/machinegun/machinegun_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/machinegun/machinegun.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
	}
	{
		map	source/models/weapons2/machinegun/machinegun_norefl.tga
		blendfunc blend
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

models/weapons2/shotgun/shotgun_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/shotgun/shotgun.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
	}
	{
		map	source/models/weapons2/shotgun/shotgun_norefl.tga
		blendfunc blend
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

models/weapons2/railgun/railgun1_refl
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
models/weapons2/bfg/bfg_k_refl
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

models/weapons2/bfg/bfg_refl
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

models/weapons2/plasma/plasma_refl
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

models/weapons2/railgun/railgun3_refl
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

models/weapons2/gauntlet/gauntlet1_refl
{
	cull disable
	nopicmip
	{
		map	source/models/weapons2/gauntlet/gauntlet1.tga
		rgbgen lightingdiffuse	
	}
	{
		screenmap
		rgbgen lightingdiffuse
		tcgen environment
		blendfunc add
	}
	{
		map	source/models/weapons2/gauntlet/gauntlet1_norefl.tga
		blendfunc blend
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