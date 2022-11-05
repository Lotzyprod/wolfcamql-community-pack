//******************************//
//								
//		models/players			
//								
//******************************//

//******************************************//
//	trail/anarki subfolder			
//******************************************//
//orb

trail/orbb/orbb_h2
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/orbb_h2.tga
		
		blendfunc gl_one gl_zero
		tcmod stretch sin 1 0.025 1 0.25
	} 
	{
		map textures/effects/tinfx.tga
		
		blendfunc add
		tcgen environment
		tcmod rotate 1
		tcmod scroll 0.02 0.02
	}
	{
		map models/players/orbb/orbb_h21.tga
		
		blendfunc add

		tcmod stretch sin 1 0.025 1 0.25
		blendfunc add
	}
}
///
trail/anarki/anarki
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/anarki.tga
            
		blendfunc add
	}
}

trail/anarki/anarki_b
{
	nopicmip
	{
		map textures/effects/envmapbfg.tga
            tcgen environment
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
	{
		map models/players/anarki/anarki_b.tga
            blendfunc add
            
	} 
}

trail/anarki/anarki_g
{
	nopicmip
	{
		map models/players/anarki/anarki_g.tga
	}
	{	
		map models/players/anarki/anarki_g_fx.tga
		
		rgbgen wave triangle 0 1 0 .5
		blendfunc add 		
		blendfunc add
	}
}

trail/anarki/anarki_h
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/anarki_h.tga
            
		blendfunc add
	}
}

trail/anarki/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/blue.tga
            
		blendfunc add
	}
}

trail/anarki/blue_g
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/blue_g.tga
            
		blendfunc add
	}
}

trail/anarki/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/anarki_h.tga
            
		blendfunc add
	}
}

trail/anarki/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/bright.tga
	}
	{
		map models/players/anarki/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/anarki/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/anarki/bright_b
{
	nopicmip
	novlcollapse
	{
		map textures/effects/tinfx.tga
        tcgen environment
        tcmod rotate 350
        tcmod scroll 3 1
        blendfunc gl_one gl_zero
		
	} 
    {
      	map models/players/anarki/bright_b.tga
        blendfunc gl_one gl_zero
		blendfunc add
		
    }
}

trail/anarki/bright_g
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/bright_g.tga
	}
	{
		map models/players/anarki/bright_g.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
		blendfunc add
	}
}

trail/anarki/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/bright_h.tga
	}
	{
		map models/players/anarki/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/anarki/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/anarki/red
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/red.tga
            
		blendfunc add
	}
}

trail/anarki/red_g
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/red_g.tga
            
		blendfunc add
	}
}

trail/anarki/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/anarki/anarki_h.tga
            
		blendfunc add
	}
}

trail/anarki/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport.tga
		blendfunc add
		
	}
	{
		map models/players/anarki/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/anarki/sport_b
{
	nopicmip
	novlcollapse
	{
		map textures/effects/envmaprail.tga
            tcgen environment
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
      {
      	map models/players/anarki/sport_b.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_b.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}  
}

trail/anarki/sport_g
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport_g.tga
            
	}
	{
		map models/players/anarki/brightglow_g.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/anarki/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/anarki/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/anarki/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/anarki/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/anarki/sport_blue_b
{
	nopicmip
	novlcollapse
	{
		map textures/effects/envmapweapblue.tga
            tcgen environment
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
      {
      	map models/players/anarki/sport_b_blue.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_b_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}  
}

trail/anarki/sport_blue_g
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport_g_blue.tga
            
	}
	{
		map models/players/anarki/brightglow_g_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/anarki/sport_blue_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/anarki/sport_blue_h.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/anarki/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/anarki/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/anarki/sport_red_b
{
	nopicmip
	novlcollapse
	{
		map textures/effects/envmapweapred.tga
            tcgen environment
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
      {
      	map models/players/anarki/sport_b_red.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_b_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}  
}

trail/anarki/sport_red_g
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/anarki/sport_g_red.tga
            
	}
	{
		map models/players/anarki/brightglow_g_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/anarki/sport_red_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/anarki/sport_red_h.tga
            blendfunc add
            
      }
	{
		map models/players/anarki/brightglow_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/anarki/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/biker subfolder			
//******************************************//

trail/biker/biker
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/biker.tga
		
		blendfunc add
	}
}

trail/biker/biker_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/biker/biker_h.tga trail/biker/biker_h.tga trail/biker/biker_h.tga trail/biker/biker_h.tga trail/biker/biker_h2.tga trail/biker/biker_h.tga
		
		blendfunc add
	}
}

trail/biker/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/blue.tga
		
		blendfunc add
	}
}

trail/biker/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/blue_h.tga
		
		blendfunc add
	}
}

trail/biker/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/bright.tga
	}
	{
		map models/players/biker/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/biker/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/biker/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/bright_h.tga
	}
	{
		map models/players/biker/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/biker/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/biker/hossman
{
	nopicmip
	novlcollapse
	{
        	map models/players/biker/hossman.tga
		
	}        
}

trail/biker/hossman_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/hossman_h.tga
		
		blendfunc add
	}
}

trail/biker/red
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/red.tga
		
		blendfunc add
	}
}

trail/biker/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/red_h.tga
		
		blendfunc add
	}
}

trail/biker/slammer
{
	nopicmip
	novlcollapse
	{
        	map models/players/biker/slammer.tga
		
	}        
}

trail/biker/slammer_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/slammer_h.tga
		
		blendfunc add
	}
}

trail/biker/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/biker/sport.tga
		blendfunc add
		
	}
	{
		map models/players/biker/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/biker/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/biker/brightglow_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/biker/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/biker/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/biker/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/biker/brightglow_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/biker/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/biker/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/biker/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/biker/brightglow_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/biker/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/biker/stroggo
{
	nopicmip
	novlcollapse
	{
        	map models/players/biker/stroggo.tga
		
	}        
}

trail/biker/stroggo_h
{
	nopicmip
	novlcollapse
	{
		map models/players/biker/stroggo_h.tga
		
		blendfunc add
	}
}

//******************************************//
//	trail/bitterman subfolder			
//******************************************//

trail/bitterman/bitterman
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/bitterman.tga
		
		blendfunc add
	}
}

trail/bitterman/h_bitterman
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/h_bitterman.tga
		
		blendfunc add
	}
}

trail/bitterman/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/blue.tga
		
		blendfunc add
	}
}

trail/bitterman/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/bright.tga
	}
	{
		map models/players/bitterman/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/bitterman/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/bitterman/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/bright_h.tga
	}
	{
		map models/players/bitterman/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/bitterman/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/bitterman/h_blue
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/h_blue.tga
		
		blendfunc add
	}
}

trail/bitterman/red
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/red.tga
		
		blendfunc add
	}
}

trail/bitterman/h_red
{
	nopicmip
	novlcollapse
	{
		map models/players/bitterman/h_red.tga
		
		blendfunc add
	}
}

trail/bitterman/sport
{
	nopicmip
	novlcollapse
    {
        map textures/effects/envmapgreen.tga
        tcgen environment
        
    }
	{
		map models/players/bitterman/sport.tga
		blendfunc add
		
	}
	{
		map models/players/bitterman/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bitterman/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/bitterman/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/bitterman/brightglow_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bitterman/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/bitterman/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/bitterman/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bitterman/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/bitterman/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/bitterman/brightglow_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bitterman/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/bitterman/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/bitterman/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bitterman/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/bitterman/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/bitterman/brightglow_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bitterman/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/bones subfolder			
//******************************************//

trail/bones/blue
{
	nopicmip   
	novlcollapse 
    cull disable
        {
        map models/players/bones/blue.tga
        blendfunc add
		
		
        }
}

trail/bones/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/bones/bright.tga
		blendfunc add
		
		
	}
	{
		map models/players/bones/bright1.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/bones/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/bones/red
{
	nopicmip   
	novlcollapse 
    	cull disable
        {
            map models/players/bones/red.tga
            blendfunc add
		
		
        }
}

trail/bones/sport
{
	nopicmip
	novlcollapse
    cull disable
	{             
        map models/mapobjects/bitch/hologirl2.tga
        
        tcgen environment
        tcmod scroll -6 -.2
        tcmod scale 1 1
		blendfunc add
	} 
	{
        map models/players/bones/sport.tga
        blendfunc add
		
        
    }
	{
		map models/players/bones/brightglow2.tga
		blendfunc add
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bones/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bones/sport_blue
{
	nopicmip
	novlcollapse
	{             
        map models/mapobjects/bitch/hologirl2.tga
        
        tcgen environment
        tcmod scroll -6 -.2
        tcmod scale 1 1
		blendfunc add
	} 
	{
        map models/players/bones/sport_blue.tga
        blendfunc add
		
        
    }
	{
		map models/players/bones/brightglow2_blue.tga
		blendfunc add
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bones/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bones/sport_red
{
	nopicmip
	novlcollapse
	{             
        map models/mapobjects/bitch/hologirl2.tga
        
        tcgen environment
        tcmod scroll -6 -.2
        tcmod scale 1 1
		blendfunc add
	} 
	{
        map models/players/bones/sport_red.tga
        blendfunc add
		
        
    }
	{
		map models/players/bones/brightglow2_red.tga
		blendfunc add
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/bones/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/bones/stiff
{
	nopicmip   
	novlcollapse
    	cull disable
        {
            map models/players/bones/stiff.tga
            blendfunc add
		
		
        }
}

trail/bones/xray
{
	nopicmip
	novlcollapse
	cull disable
        {
        map models/players/bones/xray.tga
        blendfunc add
		
		
        }  
}

//******************************************//
//	trail/crash subfolder			
//******************************************//

trail/crash/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/bright.tga
	}
	{
		map models/players/crash/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/crash/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/crash/bright_t
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/bright_t.tga
	}
	{
		map models/players/crash/bright_t.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/crash/bright2_t.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/crash/crash
{
	nopicmip
	novlcollapse
	{
		map textures/effects/envmapblue.tga
		tcgen environment
		
	}
	{
		map models/players/crash/crash.tga
		
		blendfunc add
		blendfunc add
	}
}

trail/crash/crash_f
{
	nopicmip
	novlcollapse
        {
		map textures/sfx/snow.tga
            tcmod scale .5 .5
            tcmod scroll  9 0.3
            
        }
        {
            map textures/effects/tinfx2b.tga
            tcgen environment
            blendfunc add
            
        }
}

trail/crash/crash_t
{
	nopicmip
	novlcollapse
    {
		map textures/effects/envmapblue.tga
		tcgen environment
		
	}
	{
		map models/players/crash/crash_t.tga
		
		blendfunc add
		blendfunc add
	}
}

trail/crash/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/blue.tga
		
		blendfunc add
	}
}

trail/crash/blue_t
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/blue_t.tga
		
		blendfunc add
	}
}

trail/crash/red
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/red.tga
		
		blendfunc add
	}
}

trail/crash/red_t
{
	nopicmip
	novlcollapse
	{
		map models/players/crash/red_t.tga
		
		blendfunc add
	}
}

trail/crash/crash_sport
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_sport.tga
            blendfunc add
      	
      }
	{
		map models/players/crash/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_t_sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_t_sport.tga
            blendfunc add
            
      }
	{
		map models/players/crash/brightglow_t2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow_t.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_sport_blue
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_sport_blue.tga
            blendfunc add
      	
      }
	{
		map models/players/crash/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_t_sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_t_sport_blue.tga
            blendfunc add
            
      }
	{
		map models/players/crash/brightglow_t2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow_t_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_sport_red
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_sport_red.tga
            blendfunc add
      	
      }
	{
		map models/players/crash/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_t_sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/crash/crash_t_sport_red.tga
            blendfunc add
            
      }
	{
		map models/players/crash/brightglow_t2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/crash/brightglow_t_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/crash/crash_trainer
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            
      }
	{
		map textures/sfx/tesla2.tga
		blendfunc add
		tcmod scroll 0 0.75
	}
      {
            map models/players/crash/crash_trainer.tga
            blendfunc add
            
      }
	{
		map models/players/crash/trainerglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 0.75
		blendfunc add
	}
}

trail/crash/crash_t_trainer
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            
      }
	{
		map textures/sfx/tesla2.tga
		blendfunc add
		tcmod scroll 0 0.75
	}
      {
            map models/players/crash/crash_t_trainer.tga
            blendfunc add
            
      }
	{
		map models/players/crash/trainerglow_t.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 0.75
		blendfunc add
	}
}

trail/crash/crash_f_trainer
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/snow.tga
            tcmod scroll  9 0.3
            
      }
	{
		map textures/sfx/teslacoil2.tga
		blendfunc add
            tcmod scroll  9 0.3
	}
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            blendfunc add
            
       }
}

//******************************************//
//	trail/doom subfolder			
//******************************************//

trail/doom/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/blue.tga
            
		blendfunc add
	}
}

trail/doom/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/bright.tga
	}
	{
		map models/players/doom/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/doom/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/doom/doom
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/doom.tga
            
		blendfunc add
	}
}

trail/doom/doom_f
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/doom_f.tga	
            
	}
      {
		
		map models/players/doom/doom_fx.tga
		tcgen environment
		blendfunc add 		
		blendfunc add
	}
}

trail/doom/phobos
{
	nopicmip
	novlcollapse
      {
            map models/players/doom/phobos_fx.tga
            blendfunc gl_one gl_zero
            tcmod scale 7 7
            tcmod scroll 5 -5
            tcmod rotate 360
	}
      {
		map models/players/doom/phobos.tga
            blendfunc add
            
		blendfunc add
	}
}

trail/doom/phobos_f
{
	nopicmip
	novlcollapse
      {
		map textures/effects/tinfx.tga
            tcgen environment
            blendfunc gl_one gl_zero              
	} 
      {
		map models/players/doom/phobos_f.tga
            blendfunc add
            
		blendfunc add
	}
}

trail/doom/red
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/red.tga
            
		blendfunc add
	}
}

trail/doom/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/doom/sport.tga
		blendfunc add
		
	}
	{
		map models/players/doom/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/doom/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/doom/sport_f
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/sport_f.tga	
            
	}
      {
		
		map models/players/doom/doom_fx.tga
		tcgen environment
		blendfunc add 		
		blendfunc add
	}
}

trail/doom/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/doom/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/doom/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/doom/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/doom/sport_blue_f
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/sport_blue_f.tga	
            
	}
      {
		
		map models/players/doom/doom_fx.tga
		tcgen environment
		blendfunc add 		
		blendfunc add
	}
}

trail/doom/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/doom/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/doom/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/doom/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/doom/sport_red_f
{
	nopicmip
	novlcollapse
	{
		map models/players/doom/sport_red_f.tga	
            
	}
      {
		
		map models/players/doom/doom_fx.tga
		tcgen environment
		blendfunc add 		
		blendfunc add
	}
}

//******************************************//
//	trail/grunt subfolder			
//******************************************//

trail/fritzkrieg/fritz_fx
{     
    cull disable
	nopicmip
	novlcollapse
    {
        map models/players/fritzkrieg/fritz_fx2.tga
        tcgen environment
        
    }
    {
        map models/players/fritzkrieg/fritz_fx.tga
        blendfunc add
        
    }
}

trail/fritzkrieg/fritz_c
{
	cull none
	nopicmip
	novlcollapse
	{
		map models/players/fritzkrieg/fritz_c.tga
		blendfunc add
		
		
	}    
}

trail/fritzkrieg/beam
{
    deformvertexes autosprite2
    cull disable
	nopicmip
	novlcollapse
    {
        map models/players/fritzkrieg/beam.tga
        blendfunc add
        
    }
}

trail/fritzkrieg/beam2
{
    deformvertexes autosprite
    cull disable
	nopicmip
	novlcollapse
	{
        map models/players/fritzkrieg/beam2.tga
        blendfunc add
        
    }
}

//******************************************//
//	trail/grunt subfolder			
//******************************************//

trail/grunt/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/blue.tga
            
		blendfunc add
	}
}

trail/grunt/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/blue_h.tga
            
		blendfunc add
	}
}

trail/grunt/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/bright.tga
	}
	{
		map models/players/grunt/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/grunt/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/grunt/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/bright_h.tga
	}
	{
		map models/players/grunt/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/grunt/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/grunt/grunt
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/grunt.tga
            
		blendfunc add
	}
}

trail/grunt/grunt_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/grunt/grunt_h.tga trail/grunt/grunt_h.tga trail/grunt/grunt_h.tga trail/grunt/grunt_h.tga trail/grunt/grunt_h.tga trail/grunt/grunt_h2.tga
            
		blendfunc add
	}
}

trail/grunt/red
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/red.tga
            
		blendfunc add
	}
}

trail/grunt/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/red_h.tga
            
		blendfunc add
	}
}

trail/grunt/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/grunt/sport.tga
		blendfunc add
		
	}
	{
		map models/players/grunt/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/grunt/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/grunt/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/grunt/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/grunt/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/grunt/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/grunt/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/grunt/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/grunt/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/grunt/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/grunt/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/grunt/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/grunt/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/grunt/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/grunt/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/grunt/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/grunt/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/grunt/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/grunt/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/grunt/stripe
{
	nopicmip
	novlcollapse
	{
		map models/players/grunt/stripe.tga
            
		blendfunc add
	}
}

trail/grunt/stripe_h
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/electricgrade3.tga
            tcmod scroll 0 -.5
		blendfunc gl_one gl_zero
      }
      {
		map models/players/grunt/stripe_h.tga
            blendfunc add
            
	}     
}

//******************************************//
//	trail/hunter subfolder			
//******************************************//

trail/hunter/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/blue.tga
            
		blendfunc add
	}
}

trail/hunter/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/blue_h.tga
            
		blendfunc add
	}
}

trail/hunter/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/bright.tga
	}
	{
		map models/players/hunter/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/hunter/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/hunter/bright_f
{
	nopicmip
	novlcollapse
	deformvertexes wave 100 sin 0 .3 0 .2
    cull disable
	{
		map models/players/hunter/bright_f.tga
        
        blendfunc add
		
	}
	{
		map models/players/hunter/bright2_f.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
		blendfunc add
	}
}

trail/hunter/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/bright_h.tga
	}
	{
		map models/players/hunter/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/hunter/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/hunter/harpy
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmaproc.tga
            tcgen environment
      }
      {
            map models/players/hunter/hunter2.tga
            
            blendfunc add
      }
}

trail/hunter/harpy_f
{
	nodefault
	surfaceparm	nodraw
}

trail/hunter/harpy_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmaproc.tga
            tcgen environment
      }
      {
            map models/players/hunter/hunter_h.tga
            
            blendfunc add
      }
}

trail/hunter/hunter2
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/hunter2.tga
            
		blendfunc add
	}
}

trail/hunter/hunter_h
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/hunter_h.tga
            
		blendfunc add
	}
}

trail/hunter/hunter_f
{
	nopicmip
	novlcollapse
	deformvertexes wave 100 sin 0 .3 0 .2
      cull disable
      {
            map models/players/hunter/hunter_f.tga
            
            blendfunc add
		
      }
}

trail/hunter/red
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/red.tga
            
		blendfunc add
	}
}

trail/hunter/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/hunter/red_h.tga
            
		blendfunc add
	}
}

trail/hunter/red_f
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .3 0 .2
      cull disable
      {
            map models/players/hunter/red_f.tga
            
            blendfunc add
		
      }
}

trail/hunter/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/hunter/sport.tga
		blendfunc add
		
	}
	{
		map models/players/hunter/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/hunter/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/hunter/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/hunter/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/hunter/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/hunter/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/hunter/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/hunter/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/hunter/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/hunter/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/hunter/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/hunter/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/hunter/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/hunter/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/hunter/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/hunter/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/hunter/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/hunter/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/hunter/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/james subfolder			
//******************************************//

trail/james/blue
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/james/blue.tga
            blendfunc add
            
      }
}

trail/james/james_e_blu
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad2.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/james_e_blu.tga
            blendfunc add
            
      }
}

trail/james/blue_h
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/james/james_blu.tga
            blendfunc add
            
      }
}

trail/james/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/james/bright.tga
	}
	{
		map models/players/james/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/james/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/james/bright_e
{
	nopicmip
	novlcollapse
      {
            map models/players/james/yellowshade.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/bright_e.tga
            blendfunc add
            
      }
}

trail/james/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/james/bright_h.tga
	}
	{
		map models/players/james/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/james/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/james/james
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            
      }
	{
		map models/players/james/james.tga
		blendfunc add
            
		blendfunc add
	}
}

trail/james/james_e
{
	nopicmip
	novlcollapse
      {
            map models/players/james/james_e_red.tga
      }
      {
            map models/players/james/james_e_red.tga
            blendfunc add
            rgbgen	wave sin 0.2 0.1 0 0.8
      }
}

trail/james/james_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            
      }
	{
		map models/players/james/james_h.tga
		blendfunc add
            
		blendfunc add
	}
}

trail/james/red
{
	nopicmip
	novlcollapse
      {
            map models/players/james/redshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/james/red.tga
            blendfunc add
            
      }
}

trail/james/james_e_red
{
	nopicmip
	novlcollapse
      {
            map models/players/james/redshad2.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/james_e_red.tga
            blendfunc add
            
      }
}

trail/james/red_h
{
	nopicmip
	novlcollapse
      {
            map models/players/james/redshad2.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/james/james_redh.tga
            blendfunc add
            
      }
}

trail/james/sport
{
	nopicmip
	novlcollapse
      {
            map models/players/james/greenshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
	{
		map models/players/james/sport.tga
		blendfunc add
		
	}
	{
		map models/players/james/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/james/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/james/sport_e
{
	nopicmip
	novlcollapse
      {
            map models/players/james/greenshad2.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/sport_e.tga
            blendfunc add
            
      }
}

trail/james/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/james/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/james/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/james/sport_blue
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
	{
		map models/players/james/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/james/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/james/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/james/sport_e_blue
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad2.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/sport_e_blue.tga
            blendfunc add
            
      }
}

trail/james/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/james/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/james/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/james/sport_red
{
	nopicmip
	novlcollapse
      {
            map models/players/james/redshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
	{
		map models/players/james/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/james/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/james/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/james/sport_e_red
{
	nopicmip
	novlcollapse
      {
            map models/players/james/redshad2.tga
            tcmod scale   1 .3
            tcmod scroll  0.1 2
            
      }
      {
            map models/players/james/sport_e_red.tga
            blendfunc add
            
      }
}

trail/james/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/james/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/james/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/janet subfolder			
//******************************************//

trail/janet/blue
{
	nopicmip
	novlcollapse
      {
            map models/players/james/blueshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/janet/blue.tga
            blendfunc add
            
      }
}

trail/janet/blue_h
{
	nopicmip
	novlcollapse
      {
            map models/players/janet/blueshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/janet/janet_blu.tga
            blendfunc add
            
      }
}

trail/janet/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/janet/bright.tga
	}
	{
		map models/players/janet/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/janet/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/janet/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/janet/bright_h.tga
	}
	{
		map models/players/janet/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/janet/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/janet/callisto
{
	nopicmip
	novlcollapse
      {
		animmap 4 trail/janet/callisto.tga trail/janet/callisto.tga trail/janet/callisto.tga trail/janet/callisto.tga trail/janet/callisto.tga trail/janet/callisto2.tga trail/janet/callisto.tga trail/janet/callisto2.tga
		
		blendfunc add
	}
}

trail/janet/callisto_b
{
	nopicmip
	novlcollapse
      {
		animmap 4 trail/janet/callisto_b.tga trail/janet/callisto_b.tga trail/janet/callisto_b.tga trail/janet/callisto_b.tga trail/janet/callisto_b.tga trail/janet/callisto2_b.tga trail/janet/callisto_b.tga trail/janet/callisto2_b.tga
		
	}    
}

trail/janet/callisto_blu
{
	nopicmip
	novlcollapse
      {
		map models/players/janet/callisto_blu.tga
		
		blendfunc add
	}
}

trail/janet/callisto_default
{
	nopicmip
	novlcollapse
      {
		map models/players/janet/callisto_default.tga
		
		blendfunc add
	}
}

trail/janet/callisto_r
{
	nopicmip
	novlcollapse
      {
		animmap 4 trail/janet/callisto_r.tga trail/janet/callisto_r.tga trail/janet/callisto_r.tga trail/janet/callisto_r.tga trail/janet/callisto_r.tga trail/janet/callisto2_r.tga trail/janet/callisto_r.tga trail/janet/callisto2_r.tga
		
		blendfunc add
	}
}

trail/janet/callisto_red
{
	nopicmip
	novlcollapse
      {
		map models/players/janet/callisto_red.tga
		
		blendfunc add
	}
}

trail/janet/janet
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2b.tga
            tcgen environment
            
      }
	{
		map models/players/janet/janet.tga
		blendfunc add
            
		blendfunc add
	}
}

trail/janet/red
{
	nopicmip
	novlcollapse
	{
            map models/players/james/redshad.tga
            tcmod scale 2 2
            tcgen environment
            
      }
      {
            map models/players/janet/red.tga
            blendfunc add
            
      }
}

trail/janet/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/janet/sport.tga
		blendfunc add
		
	}
	{
		map models/players/janet/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/janet/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/janet/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/janet/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/janet/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/janet/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/janet/sport_h
{
	nopicmip
	novlcollapse
	{
		map models/players/janet/sport_h.tga
		
		blendfunc add
	}
}

trail/janet/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/janet/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/janet/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/janet/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/keel subfolder			
//******************************************//

trail/keel/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/blue.tga
            
		blendfunc add
	}
}

trail/keel/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/blue_h.tga
            
		blendfunc add
	}
}

trail/keel/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/bright.tga
	}
	{
		map models/players/keel/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/keel/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/keel/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/bright_h.tga
	}
	{
		map models/players/keel/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/keel/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/keel/keel
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/keel.tga
            
		blendfunc add
	}
}

trail/keel/keel_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/keel/keel_h.tga trail/keel/keel_h.tga trail/keel/keel_h.tga trail/keel/keel_h.tga trail/keel/keel_h.tga trail/keel/keel_h2.tga
            
		blendfunc add
	}
}

trail/keel/red
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/red.tga
            
		blendfunc add
	}
}

trail/keel/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/keel/red_h.tga
            
		blendfunc add
	}
}

trail/keel/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/keel/sport.tga
		blendfunc add
		
	}
	{
		map models/players/keel/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/keel/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/keel/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/keel/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/keel/bright_h_glow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/keel/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/keel/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/keel/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/keel/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/keel/sport_h_blue
{
	nopicmip
	novlcollapse
	{
		map textures/effects/envmapblue.tga
		tcgen environment
		
	}
	{
		map models/players/keel/sport_h_blue.tga
		blendfunc add
		
	}
	{
		map models/players/keel/bright_h_glow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/keel/bright_h_glow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/keel/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/keel/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/keel/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/keel/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/keel/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/keel/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/keel/bright_h_glow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/keel/bright_h_glow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/klesk subfolder			
//******************************************//

trail/klesk/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/blue.tga
            
		blendfunc add
	}
}

trail/klesk/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/blue_h.tga
            
		blendfunc add
	}
}

trail/klesk/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/bright.tga
	}
	{
		map models/players/klesk/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/klesk/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/klesk/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/bright_h.tga
	}
	{
		map models/players/klesk/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/klesk/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/klesk/flisk
{
	nopicmip
	novlcollapse
      {
		map $whiteimage
	}
	{
        	map models/players/klesk/flisk.tga
            
		blendfunc gl_dst_color gl_src_alpha
		alphagen lightingspecular
	}
          
}

trail/klesk/flisk_h
{
	nopicmip
	novlcollapse
      {
		map models/players/klesk/flisk_h.tga
            
            blendfunc gl_one gl_zero
	} 
      {
            map textures/sfx/bolts.tga
            
            blendfunc add
            tcmod scale 2 2
            tcmod scroll 2 2
	}   
      {
		map models/players/klesk/flisk_h.tga
            
            blendfunc add
	}
       
         
}

trail/klesk/klesk
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/klesk.tga
            
		blendfunc add
	}
}

trail/klesk/klesk_h
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/klesk_h.tga
            
            blendfunc gl_one gl_zero
      }
	{
		map models/players/klesk/klesk_g.tga
            
		blendfunc add
		rgbgen wave triangle .5 1 0 .5
		blendfunc add
	}
}

trail/klesk/red
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/red.tga
            
		blendfunc add
	}
}

trail/klesk/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/klesk/red_h.tga
            
		blendfunc add
	}
}

trail/klesk/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/klesk/sport.tga
		blendfunc add
		
	}
	{
		map models/players/klesk/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/klesk/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/klesk/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/klesk/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/klesk/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/klesk/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/klesk/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/klesk/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/klesk/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/klesk/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/klesk/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/klesk/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/klesk/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/klesk/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/klesk/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/klesk/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/klesk/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/klesk/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/klesk/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/lucy subfolder			//
//******************************************//

trail/lucy/angel
{
	nopicmip
	novlcollapse
    cull none
    {
		map models/players/lucy/angel.tga
        
        blendfunc add
		
              
    }	
    {             
        map models/mapobjects/bitch/hologirl2.tga
        
        tcgen environment
        tcmod scroll -6 -.2
        tcmod scale 1 1
		blendfunc add
	}      
}

trail/lucy/angel_h
{
	nopicmip
	novlcollapse
      cull none
      {
            map models/players/lucy/angel_h.tga
            
            
      }
      {       
            map models/mapobjects/bitch/hologirl2.tga
            tcgen environment
            tcmod scroll -6 -.2
            tcmod scale 1 1
		blendfunc add
            
	}		
}

trail/lucy/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/lucy/blue.tga
            
		blendfunc add
	}
}

trail/lucy/blue_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/lucy/blue_h.tga trail/lucy/blue_h.tga trail/lucy/blue_h.tga trail/lucy/blue_h.tga trail/lucy/blue_h.tga trail/lucy/blue_h2.tga
            
		blendfunc add
	}
}

trail/lucy/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/lucy/bright.tga
	}
	{
		map models/players/lucy/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/lucy/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/lucy/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/lucy/bright_h.tga
	}
	{
		map models/players/lucy/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/lucy/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/lucy/lucy
{
	nopicmip
	novlcollapse
	{
		map models/players/lucy/lucy.tga
            
		blendfunc add
	}
}

trail/lucy/lucy_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/lucy/lucy_h.tga trail/lucy/lucy_h.tga trail/lucy/lucy_h.tga trail/lucy/lucy_h.tga trail/lucy/lucy_h.tga trail/lucy/lucy_h2.tga
            
		blendfunc add
	}
}

trail/lucy/red
{
	nopicmip
	novlcollapse
	{
		map models/players/lucy/red.tga
            
		blendfunc add
	}
}

trail/lucy/red_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/lucy/red_h.tga trail/lucy/red_h.tga trail/lucy/red_h.tga trail/lucy/red_h.tga trail/lucy/red_h.tga trail/lucy/red_h2.tga
            
		blendfunc add
	}
}

trail/lucy/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/lucy/sport.tga
		blendfunc add
		
	}
	{
		map models/players/lucy/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/lucy/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/lucy/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/lucy/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/lucy/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/lucy/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/lucy/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/lucy/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/lucy/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/lucy/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/lucy/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/lucy/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/lucy/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/lucy/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/lucy/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/lucy/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/lucy/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/lucy/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/lucy/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/major subfolder			
//******************************************//

trail/major/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/major/blue.tga
            
		blendfunc add
	}
}

trail/major/blue_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/major/blue_h.tga trail/major/blue_h.tga trail/major/blue_h.tga trail/major/blue_h.tga trail/major/blue_h.tga trail/major/blue_h2.tga
            
		blendfunc add
	}
}

trail/major/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/major/bright.tga
	}
	{
		map models/players/major/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/major/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/major/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/major/bright_h.tga
	}
	{
		map models/players/major/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/major/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/major/daemia
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/electricslime.tga
            blendfunc gl_one gl_zero
            tcmod scale 3 3
            tcmod turb 0 .5 0 .7
            tcmod scroll 1 -1
            
	}   
      {
		map models/players/major/daemia.tga
            blendfunc add
            
	}        
}

trail/major/daemia2_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/major/daemia2_h.tga trail/major/daemia2_h.tga trail/major/daemia2_h.tga trail/major/daemia2_h.tga trail/major/daemia2_h.tga trail/major/daemia2_h2.tga
            
		blendfunc add
	}
}

trail/major/major
{
	nopicmip
	novlcollapse
	{
		map models/players/major/major.tga
            
		blendfunc add
	}
}

trail/major/major_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/major/major_h.tga trail/major/major_h.tga trail/major/major_h.tga trail/major/major_h.tga trail/major/major_h.tga trail/major/major_h2.tga
            
		blendfunc add
	}
}

trail/major/red
{
	nopicmip
	novlcollapse
	{
		map models/players/major/red.tga
            
		blendfunc add
	}
}

trail/major/red_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/major/red_h.tga trail/major/red_h.tga trail/major/red_h.tga trail/major/red_h.tga trail/major/red_h.tga trail/major/red_h2.tga
            
		blendfunc add
	}
}

trail/major/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/major/sport.tga
		blendfunc add
		
	}
	{
		map models/players/major/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/major/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/major/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/major/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/major/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/major/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/major/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/major/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/major/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/major/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/major/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/major/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/major/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/major/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/major/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/major/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/major/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/major/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/major/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/mynx subfolder			
//******************************************//

trail/mynx/blue_s
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/blue_s.tga
            
		blendfunc add
	}
}

trail/mynx/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/blue_h.tga
            
		blendfunc add
	}
}

trail/mynx/bright_t
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/bright_t.tga
	}
	{
		map models/players/mynx/bright_t.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/mynx/bright2_t.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/mynx/mynx
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/mynx.tga
            
		blendfunc add
	}
}

trail/mynx/mynx_shiny
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/specular5.tga  
                      
            blendfunc gl_one gl_zero
            tcgen environment
	}  
      {
		map models/players/mynx/mynx_shiny.tga
            
            blendfunc add
		blendfunc add
	}
}

trail/mynx/mynx_h
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/mynx_h.tga
            
		blendfunc add
	}
}

trail/mynx/red_s
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/red_s.tga
            
		blendfunc add
	}
}

trail/mynx/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/mynx/red_h.tga
            
		blendfunc add
	}
}

trail/mynx/sport_t
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/mynx/sport_t.tga
		blendfunc add
		
	}
	{
		map models/players/mynx/brightglow2_t.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/mynx/brightglow_t.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/mynx/sport_t_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/mynx/sport_t_blue.tga
		blendfunc add
		
	}
	{
		map models/players/mynx/brightglow2_t_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/mynx/brightglow_t_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/mynx/sport_t_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/mynx/sport_t_red.tga
		blendfunc add
		
	}
	{
		map models/players/mynx/brightglow2_t_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/mynx/brightglow_t_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}


//******************************************//
//	trail/orbb subfolder			
//******************************************//

trail/orbb/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/blue.tga
            
		blendfunc add
	}
}

trail/orbb/blue_h
{
	nopicmip
	novlcollapse	
	{
		map models/players/orbb/blue_h.tga
            
      }
      {
	      clampmap textures/base_floor/techfloor2.tga
            
		blendfunc add
            tcmod rotate 90
            tcmod stretch sin .8 0.2 0 .2
	} 
}

trail/orbb/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/bright.tga
	}
	{
		map models/players/orbb/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/orbb/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/orbb/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/bright_h.tga
	}
	{
		map models/players/orbb/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/orbb/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/orbb/orbb_light_blue
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/orbb_light_blue.tga
            
		rgbgen wave sin 1 1 0 1		
		blendfunc add
	}
}

trail/orbb/orbb_tail_blue
{
	nopicmip
	novlcollapse	
	{
		map models/players/orbb/orbb_tail_blue.tga
            
		blendfunc add
            tcmod scroll 0 .5
		rgbgen wave sin .5 .25 0 .5		
		blendfunc add
	}
}

trail/orbb/orbb
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/orbb.tga
            
		blendfunc add
	}
}

trail/orbb/orbb_h2
{
	nopicmip
	novlcollapse
      {
		map models/players/orbb/orbb_h2.tga
            
            blendfunc gl_one gl_zero
	} 
      {
            map textures/effects/tinfx.tga
            
            blendfunc add
            tcgen environment
	}  
      {
		map models/players/orbb/orbb_h2.tga
            
            blendfunc add
		blendfunc add
	}
}

trail/orbb/orbb_light
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/orbb_light.tga
            
		rgbgen wave sin 1 1 0 1
		blendfunc add
	}
}

trail/orbb/orbb_tail
{
	nopicmip
	novlcollapse	
	{
		map models/players/orbb/orbb_tail.tga
            
		blendfunc add
            tcmod scroll 0 .5
		rgbgen wave sin .5 .25 0 .5		
		blendfunc add
	}
}

trail/orbb/pumpkin_h
{
	nopicmip
	novlcollapse
	cull none
      {
		map models/players/orbb/pumpkin_h.tga
            
            blendfunc add
	}
      {
            map textures/sfx/firegorre.tga
            blendfunc gl_one gl_zero
            tcmod scroll 0 1
            tcmod scale 2 2
            
		rgbgen wave sin 0.75 0.25 0.75 2
	}  
      {
		map models/players/orbb/pumpkin_h.tga
            
            blendfunc add
		blendfunc add
	}
}

trail/orbb/red
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/red.tga
            
		blendfunc add
	}
}

trail/orbb/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/red_h.tga
            
      }
      {
		clampmap textures/base_floor/techfloor2.tga
		blendfunc add
            tcmod rotate 90
            tcmod stretch sin .8 0.2 0 .2
		blendfunc add
	}
}

trail/orbb/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/orbb/sport.tga
		blendfunc add
		
	}
	{
		map models/players/orbb/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/orbb/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/orbb/sport_h
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/sport_h.tga
            
      }
      {
		clampmap textures/base_floor/techfloor2.tga
		blendfunc add
            tcmod rotate 90
            tcmod stretch sin .8 0.2 0 .2
		blendfunc add
	}
}

trail/orbb/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/orbb/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/orbb/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/orbb/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/orbb/sport_blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/sport_blue_h.tga
            
      }
      {
		clampmap textures/base_floor/techfloor2.tga
		blendfunc add
            tcmod rotate 90
            tcmod stretch sin .8 0.2 0 .2
		blendfunc add
	}
}

trail/orbb/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/orbb/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/orbb/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/orbb/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/orbb/sport_red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/orbb/sport_red_h.tga
            
      }
      {
		clampmap textures/base_floor/techfloor2.tga
		blendfunc add
            tcmod rotate 90
            tcmod stretch sin .8 0.2 0 .2
		blendfunc add
	}
}

//******************************************//
//	trail/ranger subfolder			
//******************************************//

trail/ranger/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/ranger/blue.tga
            
		blendfunc add
	}
}

trail/ranger/blue_h
{
	nopicmip
	novlcollapse
	{
		animmap 6 trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h2.tga trail/ranger/red_h3.tga
            
		blendfunc add
	}
}

trail/ranger/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/ranger/bright.tga
	}
	{
		map models/players/ranger/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/ranger/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/ranger/ranger
{
	nopicmip
	novlcollapse
	{
		map models/players/ranger/ranger.tga
            
		blendfunc add
	}
}

trail/ranger/ranger_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h2.tga trail/ranger/ranger_h3.tga trail/ranger/ranger_h2.tga
            
		blendfunc add
	}
}

trail/ranger/red
{
	nopicmip
	novlcollapse
	{
		map models/players/ranger/red.tga
            
		blendfunc add
	}
}

trail/ranger/red_h
{
	nopicmip
	novlcollapse
	{
		animmap 6 trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h.tga trail/ranger/red_h2.tga trail/ranger/red_h3.tga
            
		blendfunc add
	}
}

trail/ranger/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/ranger/sport.tga
		blendfunc add
		
	}
	{
		map models/players/ranger/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/ranger/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/ranger/sport_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h2.tga trail/ranger/ranger_h3.tga trail/ranger/ranger_h2.tga
            
		blendfunc add
	}
}

trail/ranger/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/ranger/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/ranger/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/ranger/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/ranger/sport_blue_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h2.tga trail/ranger/ranger_h3.tga trail/ranger/ranger_h2.tga
            
		blendfunc add
	}
}

trail/ranger/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/ranger/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/ranger/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/ranger/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/ranger/sport_red_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h.tga trail/ranger/ranger_h2.tga trail/ranger/ranger_h3.tga trail/ranger/ranger_h2.tga
            
		blendfunc add
	}
}

trail/ranger/wrack
{
	nopicmip
	novlcollapse
	{
        	map models/players/ranger/wrack.tga
            
	}
          
}

trail/ranger/wrack_h
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/ranger/wrack_h.tga trail/ranger/wrack_h.tga trail/ranger/wrack_h.tga trail/ranger/wrack_h.tga trail/ranger/wrack_h2.tga trail/ranger/wrack_h.tga
            
		blendfunc add
	}
}

//******************************************//
//	trail/razor subfolder			
//******************************************//

trail/razor/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/blue.tga
            
		blendfunc add
	}
}

trail/razor/h_blue
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/h_blue.tga
            
		blendfunc add
	}
}

trail/razor/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/bright.tga
	}
	{
		map models/players/razor/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/razor/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/razor/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/bright_h.tga
	}
	{
		map models/players/razor/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/razor/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/razor/id
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2d.tga
            
            tcgen environment
      }
      {
            map models/players/razor/id.tga
            
            blendfunc add
      }
}

trail/razor/h_id
{
	nopicmip
	novlcollapse
      {
            map textures/effects/tinfx2d.tga
            
            tcgen environment
      }
      {
            map models/players/razor/h_id.tga
            
            blendfunc add
      }
}

trail/razor/patriot
{
	nopicmip
	novlcollapse
      {
		map $whiteimage
		
	}
	{
        	map models/players/razor/patriot.tga
            
		blendfunc gl_dst_color gl_src_alpha
            alphagen lightingspecular
	}   
}

trail/razor/patriot_gogs
{
	nopicmip
	novlcollapse
      {
		map textures/effects/tinfx2d.tga
            
            tcgen environment
            blendfunc gl_one gl_zero              
 	}   
}

trail/razor/h_patriot
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/h_patriot.tga
            
		blendfunc add
	}
}

trail/razor/razor
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/razor.tga
            
		blendfunc add
	}
}

trail/razor/razor_gogs
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/razor_gogs.tga
            	
            tcgen environment
	}
	{
		map	trail/razor/razor_gogs_fx.tga	
            
		blendfunc add
		tcmod scroll 1.2 9.3
		blendfunc add
	}
}

trail/razor/h_razor
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/h_razor.tga
            
		blendfunc add
	}
}

trail/razor/red
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/red.tga
            
		blendfunc add
	}
}

trail/razor/h_red
{
	nopicmip
	novlcollapse
	{
		map models/players/razor/h_red.tga
            
		blendfunc add
	}
}

trail/razor/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/razor/sport.tga
		blendfunc add
		
	}
	{
		map models/players/razor/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/razor/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/razor/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/razor/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/razor/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/razor/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/razor/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/razor/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/razor/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/razor/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/razor/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/razor/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/razor/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/razor/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/razor/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/razor/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/razor/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/razor/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/razor/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

//******************************************//
//	trail/santa subfolder			
//******************************************//

trail/santa/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/bright.tga
	}
	{
		map models/players/santa/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
		blendfunc add
	}
}

trail/santa/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/bright_h.tga
	}
	{
		map models/players/santa/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
		blendfunc add
	}
}

trail/santa/santa
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/santa.tga
		
		blendfunc add
	}
}

trail/santa/santa_h
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/santa_h.tga
		
		blendfunc add
	}
}

trail/santa/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/blue.tga
		
		blendfunc add
	}
}

trail/santa/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/blue_h.tga
		
		blendfunc add
	}
}

trail/santa/green
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/green.tga
		
		blendfunc add
	}
}

trail/santa/green_h
{
	nopicmip
	novlcollapse
	{
		map models/players/santa/green_h.tga
		
		blendfunc add
	}
}

//******************************************//
//	trail/sarge subfolder			
//******************************************//

trail/sarge/band
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band.tga trail/sarge/band2.tga
            
		blendfunc add
	}
}

trail/sarge/blue
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue.tga trail/sarge/blue2.tga
            
		blendfunc add
	}
}

trail/sarge/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/sarge/bright.tga
	}
	{
		map models/players/sarge/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/sarge/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/sarge/cigar
{
	nopicmip
	novlcollapse
//	{
//		map models/players/sarge/cigar.tga
//            
//            blendfunc gl_one gl_zero
//    }
//	{
//		map models/players/sarge/cigar.glow.tga
//            
//		blendfunc add
//		rgbgen wave triangle .5 1 0 .2
//	}
	{
		map models/players/sarge/null.tga
        	blendfunc add
	}  
}

trail/sarge/krusade
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/firegorre.tga
            blendfunc gl_one gl_zero
            tcmod scroll 0 1
            tcmod turb 0 .25 0 1.6
            tcmod scale 4 4
            
	}  
      {
		map models/players/sarge/krusade.tga
            
            blendfunc add
		blendfunc add
	}
}

trail/sarge/null
{       
	{
		map models/players/sarge/null.tga
        	blendfunc add
	}   
}

trail/sarge/red
{
	nopicmip
	novlcollapse
	{
		animmap 4 trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red.tga trail/sarge/red2.tga
            
		blendfunc add
	}
}

trail/sarge/roderic
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/firegorre.tga
            blendfunc gl_one gl_zero
            tcmod scroll 0 1
            tcmod turb 0 .25 0 1.6
            tcmod scale 4 4
            
	}  
      {
		map models/players/sarge/roderic.tga
            
            blendfunc add
	}
 }

trail/sarge/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/sarge/sport.tga
		blendfunc add
		
	}
	{
		map models/players/sarge/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sarge/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sarge/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/sarge/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/sarge/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sarge/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sarge/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/sarge/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/sarge/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sarge/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/slash subfolder			
//******************************************//

trail/slash/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/blue.tga
            
		blendfunc add
	}
}

trail/slash/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/blue_h.tga
            
		blendfunc add
	}
}

trail/slash/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/bright.tga
	}
	{
		map models/players/slash/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/slash/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/slash/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/bright_h.tga
	}
	{
		map models/players/slash/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/slash/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/slash/red
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/red.tga
            
		blendfunc add
	}
}

trail/slash/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/red_h.tga
            
		blendfunc add
	}
}

trail/slash/slash
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/slash.tga
            
		blendfunc add
	}
}

trail/slash/slash_h
{
	nopicmip
	novlcollapse
	{
		map models/players/slash/slash_h.tga
            
		blendfunc add
	}
}


trail/slash/slashskate
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
	{
		clampmap models/players/slash/slashskate.tga
		blendfunc add
            tcmod stretch sin .9 0.1 0 1.1
            
		blendfunc add
	}
}

trail/slash/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/slash/sport.tga
		blendfunc add
		
	}
	{
		map models/players/slash/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/slash/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/slash/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/slash/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/slash/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/slash/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/slash/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/slash/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/slash/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/slash/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/slash/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/slash/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/slash/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/slash/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/slash/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/slash/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/slash/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/slash/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/slash/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/slash/sport_skate
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
	{
		clampmap models/players/slash/sport_skate.tga
		blendfunc add
            tcmod stretch sin .9 0.1 0 1.1
            
		blendfunc add
	}
}

trail/slash/sport_skate_blue
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
	{
		clampmap models/players/slash/sport_skate_blue.tga
		blendfunc add
            tcmod stretch sin .9 0.1 0 1.1
            
		blendfunc add
	}
}

trail/slash/sport_skate_red
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
	{
		clampmap models/players/slash/sport_skate_red.tga
		blendfunc add
            tcmod stretch sin .9 0.1 0 1.1
            
		blendfunc add
	}
}

trail/slash/yuriko
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmaproc.tga
            tcgen environment
      }
      {
            map models/players/slash/yuriko.tga
            
            blendfunc add 
      }
}

trail/slash/yuriko_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmaproc.tga
            tcgen environment
      }
      {
            map models/players/slash/yuriko_h.tga
            
            blendfunc add
      }
}

trail/slash/yurikoskate
{
	nopicmip
	novlcollapse
	cull disable
      deformvertexes autosprite
      {
		clampmap models/players/slash/yurikoskate.tga
            
		blendfunc add
            tcmod rotate 999
	}
      {
		clampmap models/players/slash/yurikoskate.tga
            
		blendfunc add
            tcmod stretch sin .9 0 0 0
            tcmod rotate 20
		blendfunc add
	}
}

//******************************************//
//	trail/sorlag subfolder			
//******************************************//

trail/sorlag/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/blue.tga
		
		blendfunc add
	}
}

trail/sorlag/blue_t
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/blue_t.tga
		
		blendfunc add
	}
}

trail/sorlag/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/bright.tga
	}
	{
		map models/players/sorlag/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/sorlag/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/sorlag/bright_t
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/bright_t.tga
	}
	{
		map models/players/sorlag/bright_t.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/sorlag/bright2_t.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/sorlag/red
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/red.tga
		
		blendfunc add
	}
}

trail/sorlag/red_t
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/red_t.tga
		
		blendfunc add
	}
}

trail/sorlag/sorlag
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/sorlag.tga
		
		blendfunc add
	}
}

trail/sorlag/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sport_t
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport_t.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2_t.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow_t.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sport_t_blue
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport_t_blue.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2_t_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow_t_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sport_t_red
{
	nopicmip
	novlcollapse
	sort additive
	cull disable
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/sorlag/sport_t_red.tga
		blendfunc add
		
	}
	{
		map models/players/sorlag/brightglow2_t_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/sorlag/brightglow_t_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/sorlag/sorlag_t
{
	nopicmip
	novlcollapse
	{
		map models/players/sorlag/sorlag_t.tga
		
		blendfunc add
	}
}

//******************************************//
//	trail/tankjr subfolder			
//******************************************//

trail/tankjr/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/tankjr/blue.tga
		
		blendfunc add
	}
}

trail/tankjr/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/tankjr/bright.tga
	}
	{
		map models/players/tankjr/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/tankjr/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/tankjr/tankjr
{
	nopicmip
	novlcollapse
      {
		map $whiteimage
	}
	{
        	map models/players/tankjr/tankjr.tga
		blendfunc gl_dst_color gl_src_alpha
		
		alphagen lightingspecular
		blendfunc add
	}
}

trail/tankjr/red
{
	nopicmip
	novlcollapse
	{
		map models/players/tankjr/red.tga
		
		blendfunc add
	}
}

trail/tankjr/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/tankjr/sport.tga
		blendfunc add
		
	}
	{
		map models/players/tankjr/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/tankjr/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/tankjr/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/tankjr/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/tankjr/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/tankjr/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/tankjr/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/tankjr/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/tankjr/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/tankjr/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

//******************************************//
//	trail/uriel subfolder			
//******************************************//

trail/uriel/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/blue.tga
		
		blendfunc add
	}
}

trail/uriel/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/blue_h.tga
		
		blendfunc add
	}
}

trail/uriel/blue_w
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map models/players/uriel/blue_w.tga
		
            blendfunc add
		
      }
}

trail/uriel/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/bright.tga
	}
	{
		map models/players/uriel/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/uriel/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/uriel/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/uriel_h.tga
		
		blendfunc gl_one gl_zero
	} 
	{
		map models/players/uriel/bright_f.tga
		blendfunc add
		tcmod scroll -0.2 1
		rgbgen entity
	}
	{
		map models/players/uriel/uriel_h.tga
		
		blendfunc add
	}   
}

trail/uriel/bright_w
{
	nopicmip
	novlcollapse
	deformvertexes wave 100 sin 0 .5 0 .2
	{
		map models/players/uriel/bright_w.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/bright1_w.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/uriel/bright2_w.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/uriel/null
{       
    	{
		map models/players/uriel/null.tga
        	blendfunc add
    	}   
}

trail/uriel/red
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/red.tga
		
		blendfunc add
	}
}

trail/uriel/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/red_h.tga
		
		blendfunc add
	}
}

trail/uriel/red_w
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map models/players/uriel/red_w.tga
            blendfunc add
		
		
      }
}

trail/uriel/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
      {
            map models/players/uriel/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/uriel/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/uriel/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/uriel/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/uriel/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/uriel/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/uriel/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/uriel/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/uriel/sport_w
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport_w.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2_w.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow_w.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/sport_w_blue
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport_w_blue.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2_w_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow_w_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/sport_w_red
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/uriel/sport_w_red.tga
		blendfunc add
		
	}
	{
		map models/players/uriel/brightglow2_w_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/uriel/brightglow_w_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/uriel/uriel
{
	nopicmip
	novlcollapse
	{
		map models/players/uriel/uriel.tga
		
		blendfunc add
	}
}

trail/uriel/uriel_h
{
	nopicmip
	novlcollapse
      {
		map models/players/uriel/uriel_h.tga
		
            blendfunc gl_one gl_zero
	} 
      {
            map textures/sfx/proto_zzzt.tga
            blendfunc add
            tcmod scroll -0.2 1
            
	}  
      {
		map models/players/uriel/uriel_h.tga
		
            blendfunc add
	}   
}

trail/uriel/uriel_w
{
	nopicmip
	novlcollapse
      deformvertexes wave 100 sin 0 .5 0 .2
      {
            map models/players/uriel/uriel_w.tga
		
            blendfunc add
		
      }
}

trail/uriel/zael
{
	nopicmip
	novlcollapse
      {
		map $whiteimage
		
	}
	{
        	map models/players/uriel/zael.tga
		blendfunc gl_dst_color gl_src_alpha
		
		alphagen lightingspecular
	}      
}

trail/uriel/zael_h
{
	nopicmip
	novlcollapse
      {
		map models/players/uriel/zael_h.tga
		
            blendfunc gl_one gl_zero
	} 
      {
            map textures/sfx/proto_zzzt.tga
            blendfunc add
            tcmod scroll -0.2 1
            
	}  
      {
		map models/players/uriel/zael_h.tga
		
            blendfunc add
	}         
}

//******************************************//
//	trail/visor subfolder			
//******************************************//

trail/visor/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/visor/blue.tga
		
		blendfunc add
	}
}

trail/visor/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/visor/bright.tga
	}
	{
		map models/players/visor/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/visor/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/visor/gorre
{
	nopicmip
	novlcollapse
      {
            map textures/sfx/firegorre.tga
            blendfunc gl_one gl_zero
            tcmod scroll 0 1
            tcmod turb 0 .25 0 1.6
            tcmod scale 4 4
            
	}        
      {
		map models/players/visor/gorre.tga
		
            blendfunc add
		blendfunc add
	}
}

trail/visor/red
{
	nopicmip
	novlcollapse
	{
		map models/players/visor/red.tga
		
		blendfunc add
	}
}

trail/visor/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/visor/sport.tga
		blendfunc add
		
	}
	{
		map models/players/visor/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/visor/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/visor/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/visor/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/visor/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/visor/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/visor/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/visor/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/visor/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/visor/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/visor/visor
{
	nopicmip
	novlcollapse
	{
		map models/players/visor/visor.tga
		
		blendfunc add
	}
}

//******************************************//
//	trail/vixen subfolder			
//******************************************//

trail/vixen/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/vixen/blue.tga
            
		blendfunc add
	}
}

trail/vixen/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/vixen/blue_h.tga
            
		blendfunc add
	}
}

trail/vixen/default
{
	nopicmip
	novlcollapse
	{
		map models/players/vixen/default.tga
            
		blendfunc add
	}
}

trail/vixen/default_f
{
	nopicmip
	novlcollapse
	deformvertexes wave 100 sin 0 .3 0 .2
      cull disable
      {
            map models/players/vixen/default_f.tga
            
            blendfunc add
		
      }
}

trail/vixen/default_h
{
	nopicmip
	novlcollapse
	{
		map models/players/vixen/default_h.tga
            
		blendfunc add
	}
}

//******************************************//
//	trail/xaero subfolder			
//******************************************//

trail/xaero/blue
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/blue.tga
		
		blendfunc add
	}
}

trail/xaero/blue_h
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/blue_h.tga
		
		blendfunc add
	}
}

trail/xaero/bright
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/bright.tga
	}
	{
		map models/players/xaero/bright.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/xaero/bright2.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/xaero/bright_h
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/bright_h.tga
	}
	{
		map models/players/xaero/bright_h.tga
		blendfunc gl_one gl_zero
		blendfunc add
		rgbgen entity
	}
	{
		map models/players/xaero/bright2_h.tga
		blendfunc add
		blendfunc add
		
		blendfunc add
	}
}

trail/xaero/red
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/red.tga
		
		blendfunc add
	}
}

trail/xaero/red_h
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/red_h.tga
		
		blendfunc add
	}
}

trail/xaero/sport
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapgreen.tga
            tcgen environment
            
      }
	{
		map models/players/xaero/sport.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_a
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmaprail.tga
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
	{
		map models/players/xaero/sport_a.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2_a.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow_a.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_a_blue
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmapweapblue.tga
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
	{
		map models/players/xaero/sport_a.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2_a_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow_a_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_a_red
{
	nopicmip
	novlcollapse
      {
		map textures/effects/envmapweapred.tga
            tcmod rotate 350
            tcmod scroll 3 1
            blendfunc gl_one gl_zero
		
	} 
	{
		map models/players/xaero/sport_a.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2_a_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow_a_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_h
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmaprail.tga
            tcgen environment
            
      }
      {
            map models/players/xaero/sport_h.tga
            blendfunc add
            
      }
	{
		map models/players/xaero/brightglow2_h.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/xaero/sport_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
	{
		map models/players/xaero/sport_blue.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_h_blue
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapblue.tga
            tcgen environment
            
      }
      {
            map models/players/xaero/sport_h_blue.tga
            blendfunc add
            
      }
	{
		map models/players/xaero/brightglow2_h_blue.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/xaero/sport_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
	{
		map models/players/xaero/sport_red.tga
		blendfunc add
		
	}
	{
		map models/players/xaero/brightglow2_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
	}
	{
		map models/players/xaero/brightglow_red.tga
		blendfunc add
		rgbgen wave triangle 1 0.5 0.5 1
		blendfunc add
	}
}

trail/xaero/sport_h_red
{
	nopicmip
	novlcollapse
      {
            map textures/effects/envmapred.tga
            tcgen environment
            
      }
      {
            map models/players/xaero/sport_h_red.tga
            blendfunc add
            
      }
	{
		map models/players/xaero/brightglow2_h_red.tga
		blendfunc add
		rgbgen wave triangle 1 0 0 0
		blendfunc add
	}
}

trail/xaero/xaero
{
	nopicmip
	novlcollapse
	{
		map $whiteimage
		
		blendfunc gl_one gl_zero
	}
	{
		map models/players/xaero/xaero.tga
		blendfunc gl_dst_color gl_src_alpha
		alphagen lightingspecular
	}          
}

trail/xaero/xaero_a
{
	nopicmip
	novlcollapse
    {
		map textures/effects/envmapbfg.tga
        tcmod rotate 350
        tcmod scroll 3 1
        blendfunc gl_one gl_zero
		
	} 
	{
        map models/players/xaero/xaero_a.tga
		blendfunc add
		blendfunc add
	}
}

trail/xaero/xaero_h
{
	nopicmip
	novlcollapse
	{
		map models/players/xaero/xaero_h.tga
		
		blendfunc gl_one gl_zero
	} 
	{
        map textures/sfx/firewalla.tga
        blendfunc add
        tcmod scroll 0.1 1
	}  
	{
		map models/players/xaero/xaero_h.tga
		
		blendfunc add
	}       
}

trail/xaero/xaero_q
{
	nopicmip
	novlcollapse
    	cull disable
      {
            map models/players/xaero/xaero_q.tga
		
            blendfunc add
		
      }
}