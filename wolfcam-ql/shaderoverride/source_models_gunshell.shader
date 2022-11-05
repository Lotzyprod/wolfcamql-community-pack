source/models/gun_shell
{
    {
        map source/models/fx.tga
        tcgen environment
		rgbgen lightingdiffuse
		tcmod scale 3 3
	}   
	{
		map source/models/gun_shell.tga
        blendfunc add
		rgbgen lightingdiffuse
		tcmod scale 3 3
	}
}

source/models/gun_shell1
{
    {
        map source/models/fx2.tga
        tcgen environment
		rgbgen lightingdiffuse
		tcmod scale 3 3
	}  
	{
		map source/models/gun_shell1.jpg
		blendfunc add
		rgbgen lightingdiffuse
		tcmod scale 3 3
	}
}