RSRC                     TileSet                                                                       resource_local_to_scene    resource_name    code    script    render_priority    shader    shader_param/frame_size    shader_param/frames    shader_param/anim_time    _sections_unfolded    0/name 
   0/texture    0/normal_map    0/tex_offset    0/material    0/modulate 	   0/region    0/is_autotile    0/occluder_offset    0/occluder    0/navigation_offset    0/navigation 	   0/shapes       Texture 0   res://images/lava_tiles/lava_spr_strip45(1).png    
   local://1 �      
   local://2 a         res://tiles/lava_tiles.res �         Shader          �  shader_type canvas_item;
uniform int frame_size;
uniform int frames;
uniform float anim_time;

void fragment(){
	ivec2 texsize = textureSize(TEXTURE,0);
	float uv_frame_size = float(frame_size) / float(texsize.x);
	float frame_time = anim_time / float(frames);
	float time = mod(TIME, anim_time);
	float frame = floor(time / frame_time);

	vec2 uv = vec2(UV.x + (uv_frame_size*frame), UV.y);
	COLOR = texture(TEXTURE, uv);
}    ShaderMaterial       (                          (             (   -                A	               shader_param    TileSet    
         Sprite                           
                               �?  �?  �?  �?                �A  �A             
      A   A             
      A   A                    RSRC