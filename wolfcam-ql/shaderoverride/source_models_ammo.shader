source/models/ammo/rocket/rocket
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket/rocket.tga
		rgbgen lightingdiffuse
	}
}
source/models/ammo/rocket/rockfls2
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket/rockfls2.tga
		blendfunc add
	}
}
source/models/ammo/rocket/rockflar
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket/rockflar.tga
		blendfunc add
	}
}

source/models/ammo/rocket2/rockfls2
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket2/rockfls2.tga
		blendfunc add
	}
}

source/models/ammo/rocket2/rockflar
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket2/rockflar.tga
		blendfunc add
	}
}

source/models/ammo/rocket2/rocketfn
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket2/rocketfn.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/rocket2/rocket
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket2/rocket.tga
		rgbgen lightingdiffuse
	}
}


source/models/ammo/rocket3/rockfls2
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket3/rockfls2.tga
		blendfunc add
	}
}
source/models/ammo/rocket3/rockflar
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket3/rockflar.tga
		blendfunc add
	}
}

source/models/ammo/rocket3/rocketfn
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket3/rocketfn.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/rocket3/rocket
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket3/rocket.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/rocket4/rocket
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket4/rocket.tga
		rgbgen lightingdiffuse
	}
}
source/models/ammo/rocket4/rockfls2
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket4/rockfls2.tga
		blendfunc add
	}
}
source/models/ammo/rocket4/rockflar
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket4/rockflar.tga
		blendfunc add
	}
}


source/models/ammo/rocket5/rockfls2
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket5/rockfls2.tga
		blendfunc add
	}
}
source/models/ammo/rocket5/rockflar
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket5/rockflar.tga
		blendfunc add
	}
}

source/models/ammo/rocket5/rocketfn
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket5/rocketfn.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/rocket5/rocket
{
	nopicmip
	cull disable
	{
		map source/models/ammo/rocket5/rocket.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/grenade
{
    {
        map source/models/ammo/grenade/refl.jpg  
		tcmod scale 1 1
        tcgen environment
        rgbgen lightingdiffuse
	}   
	{
		map source/models/ammo/grenade/grenade.tga
        blendfunc blend
		rgbgen lightingdiffuse
	}
	{
		animmap 7 source/models/ammo/grenade/grenade_r.jpg source/models/ammo/grenade/grenade_g.jpg
		blendfunc gl_one gl_one
		rgbgen entity
	}
}

source/models/ammo/grenade2/grenadeglow
{
	nopicmip
	nomipmaps
	deformvertexes autosprite
	{
		map source/models/ammo/grenade2/nade_flash.tga
		blendfunc gl_one gl_one
		rgbgen wave sin .5 .4 0 8
		//rgbgen identity
	}
}


source/models/ammo/grenade2/grenadecpma
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade2/nade.tga
		rgbgen lightingdiffuse
	}
	{
		map source/models/ammo/grenade2/nade_core.tga
		tcgen environment
		rgbgen lightingdiffuse
		blendfunc add
	}
	{
		map source/models/ammo/grenade2/fx.tga
		tcgen environment
		rgbgen lightingdiffuse
		blendfunc add
	}
}

source/models/ammo/grenade3/glow
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade3/fx.tga
		rgbgen lightingdiffuse
		tcgen environment
		tcmod scroll 2 2
	}
	{
		map source/models/ammo/grenade3/glow.tga
		blendfunc add
	}
}

source/models/ammo/grenade3/grenade
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade3/fx2.tga
		rgbgen lightingdiffuse
		tcgen environment
	}
	{
		map source/models/ammo/grenade3/grenade.tga
		rgbgen lightingdiffuse
		blendfunc add
	}

}

source/models/ammo/grenade4/grenade
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade4/grenade.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/grenade4/hfront
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade4/hfront.tga
		rgbgen lightingdiffuse
	}
}

source/models/ammo/grenade4/cfront
{
	nopicmip
	nomipmaps
	{
		map source/models/ammo/grenade4/cfront.tga
		rgbgen lightingdiffuse
	}
}

