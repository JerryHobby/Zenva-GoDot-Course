GDPC                �
                                                                         P   res://.godot/exported/133200997/export-0be6639b34e659039a9da31260b674f7-pink.res@!      L
      i�$,���E��9|��    P   res://.godot/exported/133200997/export-2ddd04d543d5858e7f20c9299a8b5096-main.scn�1      �      ��g������~�jC    P   res://.godot/exported/133200997/export-30130db486e5864fd9aad2a85eeeb2cb-coin.scn        F      Iaw�nK�j�[�1ddj    P   res://.godot/exported/133200997/export-5f5aa44fcbade2d83eea695a0e05fea3-Face.res�      w
      u�;I5
�����V.�3    \   res://.godot/exported/133200997/export-9314996b8c6776c50d7594c68e6f3224-blue transparent.resP      p
      b�"��J\��d��W    T   res://.godot/exported/133200997/export-d267b47f7e81a3258979164d56d0d9c2-player.scn  �+      G      ?#K�մ��IL��    \   res://.godot/exported/133200997/export-e574e9e9009d830787df9a9904fbe146-test_scene_3d.scn   �6      y      ��F�\Ċ�F"�1�    T   res://.godot/exported/133200997/export-f8e82ef5837b5b24dd5092cfccecbf3d-snowman.scn  >      �      Mo�|�tA��ՒY��    ,   res://.godot/global_script_class_cache.cfg  ��             ��Р�8���8~$}P�    D   res://.godot/imported/Coin.png-c2cd5c0bdd61476fb24bcd9448984ab7.ctex�E            ����mB����i:Mm    L   res://.godot/imported/Player.png-0662117005c6b9039deb63a286c8efe4.s3tc.ctex �G      d0      �T�e��8^-mk��Ņ    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexy            ：Qt�E�cO���       res://.godot/uid_cache.bin  `�      X      �o�y���*�m��       res://Coin/coin.gd  P      �       �E�8��� Y�ɴ       res://Coin/coin.tscn.remap   �      a       4�+'󲚯+Ƶȴe        res://Materials/Face.tres.remap ��      a       >�f~��qu��Yj��G�    ,   res://Materials/blue transparent.tres.remap p�      m       B�L�O�eǘ�^�dL        res://Materials/pink.tres.remap P�      a       p���)Oj9�Hڡ�H       res://Player/player.gd  �/      �      �gH�[����d�xtU�        res://Player/player.tscn.remap  ��      c       ��!��5a�j��s>       res://Scenes/main.tscn.remap0�      a       F�����X�����    (   res://Scenes/test_scene_3d.tscn.remap   ��      j       ��R�Yf�3�pI5       res://Snowman/snowman.gd <      �      ��ľ��I9�[E�         res://Snowman/snowman.tscn.remap�      d       BCMt�ptm���!��2i        res://Sprites/Coin.png.import   �F      �       ��e���4�&p� �b�b        res://Sprites/Player.png.import  x      �       ��ؘk�S���M���       res://icon.svg  ��      �      k����X3Y���f       res://icon.svg.import   0�      �       �w�rѽ����
G/	       res://project.binary��      �      ��}�>U��% r��                RSRC                    PackedScene            ��������                                               	   Sprite2D 	   rotation    scale    resource_local_to_scene    resource_name    custom_solver_bias    size    script    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    _data 	   _bundled       Script    res://Coin/coin.gd ��������
   Texture2D    res://Sprites/Coin.png �̧�$�)'      local://RectangleShape2D_n4ms0 a         local://Animation_l72w8 �         local://Animation_uag2e P         local://AnimationLibrary_is28f k         local://PackedScene_7073u �         RectangleShape2D          
   Animation          o�:         value                                                                    times !                transitions !        �?      values                    update                 value                                                                    times !                transitions !        �?      values       
     �?  �?      update              
   Animation             spin       333?         value                                                                    times !          333?      transitions !      ��?  �@      values              )   [B>���+@      update                 value                                                                    times !          ��L>333?      transitions !        �?  �?  �?      values       
     �?  �?
     @@  @@
   �{,�{,      update                 AnimationLibrary                   RESET                spin                   PackedScene          	         names "         Coin    script    Area2D 	   Sprite2D    texture    CollisionShape2D 	   rotation    scale    shape    AnimationPlayer 
   libraries    _on_area_entered    area_entered    _on_body_entered    body_entered (   _on_animation_player_animation_finished    animation_finished    	   variants                             ��L?
   M�?9��?                                      node_count             nodes     (   ��������       ����                            ����                           ����                                 	   	   ����   
                conn_count             conns                                                                                        node_paths              editable_instances              version             RSRC          extends Area2D
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	animation_player.play("spin")
	body.scale += Vector2(0.2, 0.2)


func _on_animation_player_animation_finished(anim_name):
	print("DEAD COIN")
	queue_free()
    RSRC                    StandardMaterial3D            ��������                                            o      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_bt00c 
         StandardMaterial3D                   ���=���>  �?��1?      �G!?      �z�>n      RSRCRSRC                    StandardMaterial3D            ��������                                            o      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    
   Texture2D    res://Sprites/Player.png �ȁ[��s   !   local://StandardMaterial3D_w7i84 @
         StandardMaterial3D                 n      RSRC         RSRC                    StandardMaterial3D            ��������                                            o      resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script        !   local://StandardMaterial3D_a1t87 
         StandardMaterial3D            �?���>  �?  �?n      RSRC    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Player/player.gd ��������
   Texture2D    res://Sprites/Player.png �ȁ[��s      local://RectangleShape2D_lduj5 �         local://PackedScene_scco8 �         RectangleShape2D       
   �w�=2UR@         PackedScene          	         names "         Player    script    CharacterBody2D    CollisionShape2D 	   position 	   rotation    scale    shape 	   Sprite2D 	   modulate    texture    	   variants                 
      ���kA   �I@
   F�6D/�A               �?��?  �?  �?               node_count             nodes     #   ��������       ����                            ����                                             ����   	      
                conn_count              conns               node_paths              editable_instances              version             RSRC         extends CharacterBody2D

var speed = 500;
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1 * speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1 * speed
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1 * speed
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1 * speed

	move_and_slide()

	

       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://Player/player.tscn \��&E+   PackedScene    res://Coin/coin.tscn niް:(�b      local://PackedScene_23heh F         PackedScene          	         names "         Main    Node2D    Player 	   Camera2D    zoom    Coins 	   position    Coin1    Coin2    Coin3    Coin4    Coin5    Coin6    	   variants    
             
     �?  �?
     �C ��C         
         �?
     ��  ��
         :�
     �B  ��
     '�  �
     C ���      node_count    
         nodes     V   ��������       ����                ���                            ����                           ����                    ���                          ���                          ���	                          ���
                          ���                          ���            	             conn_count              conns               node_paths              editable_instances              version             RSRC               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://Player/player.tscn \��&E+   PackedScene    res://Coin/coin.tscn niް:(�b      local://PackedScene_lhlt1 F         PackedScene          	         names "         TestScene3D    Node3D    Player 	   Camera3D 
   transform    OmniLight3D    light_energy    omni_range    Node2D    Coin 	   position    Coin2    Coin3    Coin4    Coin5    Coin6    	   variants                      �?              �?              �?    h�;?���@   Oa�    ��y?      �?    ��y�    Oa��K?    �u@   NbnA   `�=A         
         ��
     ��  ��
         :�
     �B  ��
     '�  �
     C ���      node_count             nodes     a   ��������       ����                ���                             ����                           ����                                       ����               ���	         
                 ���         
                 ���         
                 ���         
   	              ���         
   
              ���         
                conn_count              conns               node_paths              editable_instances              version             RSRC       extends Node3D

var direction : float = 1
var speed : float = 25
var range : float = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(position.x)
	print(direction)

	if position.x >= range:
		direction = -1;
	
	if position.x <= -range:
		direction  = 1;
	
	position.x += (speed * direction * delta);

RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    is_hemisphere    script    size    subdivide_width    subdivide_height    subdivide_depth 	   _bundled    	   Material    res://Materials/pink.tres �.ɸ��q$	   Material &   res://Materials/blue transparent.tres N�����	   Material    res://Materials/Face.tres �ꊽr��Z      local://SphereMesh_pbdlx          local://SphereMesh_jwwwa          local://SphereMesh_gnxdj 7         local://BoxMesh_rw5te R         local://PackedScene_3sdxg j         SphereMesh             SphereMesh             SphereMesh             BoxMesh             PackedScene          	         names "         Snowman 
   transform    Node3D    base    material_override    mesh    MeshInstance3D    belly    head 
   arm right 	   arn left    	   variants            �?              �?              �?    ���>         �?              �?              �?+��8�K� p�                         @?              @?              @?�{,-@?�{,                     ��mT;|����?<��?�א�:�?�=����    o�?                         ��>            ��>            ���>�{,0KC?��>            ��>            ��>            ���>�{,0KC?u�ƾ      node_count             nodes     J   ��������       ����                            ����                                       ����                                       ����                  	                  	   ����      
                              
   ����                               conn_count              conns               node_paths              editable_instances              version             RSRC GST2   @   @      ����               @ @        �   RIFF�   WEBPVP8L�   /?�������vx��=�	�o�m���!<�+�?�d��t��3����!�0��딚�0��mG3����;%v�\���i�86t����f��y=�C*�a�aX�G*XD���j`]7Q�@�W1հ���)� g�J�!���.S�s9��X�����6Y�?�ޤ��I./@V�!%bĝ��$��Ҁ���.ð���e      [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bgg8huai2mdv6"
path="res://.godot/imported/Coin.png-c2cd5c0bdd61476fb24bcd9448984ab7.ctex"
metadata={
"vram_texture": false
}
                GST2   `   `     �����                ` `               ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����   @        ����  UU        ����  UU        ����  UU        ����  UU        ��d�  UU        ����  UU        ����  UU        ����  UU        ����  UU        ����  UU        ����  UU        ��d�  UU        ��d�  UU        ����  U        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a  @@        ��a����� I�$I����UUUU� I�$� ���UUUU� I�$   ���UUUU� I�$   C��쥥�� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$   C�C�UUUU� I�$  C�C�UUUU� I�$�`c�C�UUUU I�$I�$c�C�UUUU        ��a
ZZ        ��a          ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@� �� ! ���UUUU�       ���UUUU�       C���5�       ��C������       ��C������       ��C������       ��C������       ��C������       ��C������       ��C������       ��C������       ��C������       ��C������ L�'X$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@�   ���UUUU�       ���UUUU�       C����       
�c������       
���U
  �       
���U   �       
���U   �       
���U   �       
���U   �       
���U   �       
���U   �       
���U�  �       
�c������ @$@$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@�   ���UUUU�       ���UUUU�       C����       
�c������       �g|  @ �       ʥB:�WU �       ʥB:	 �       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       ʥB:*UU �       ʥB: 	 �       
�c������ @$@$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@�   ���UUUU�       ���UUUU�       C����       
�c������       
�
�UUUU�       ʥB: XVW�       ʥB: %�       
�
�UUUU�       
�
�UUUU�       �&t  �@�       ʥB: \UU�       ʥB:  	�       
�c������ @$@$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@�   ���UUUU�       ���UUUU�       C����       
�c������       
�
�UUUU�       ʥB:VT� �       ʥB: �       
�
�UUUU�       
�
�UUUU�       
��@  �       ʥB:UU� �       ʥB:  �       
�c������ @$@$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        B�@�   ���UUUU�       ���UUUU�       C����       
�c������       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       ʥB:'�\��       ʥB: jU��       ʥB: �       
�
�UUUU�       
�
�UUUU�       
�c������ @$@$C�C�UUUU        �@PPPP        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@        b�@ �   ���UUUU�       ���UUUU�       C����       
�c������       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�
�UUUU�       
�c������ @$@$C���   @        �@@@@         ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@��        ���UUUU�  ` ���UUUU�       ���UUUU�       C����       ��c��ꪪ�       
�c������       
�c������       
�c������       
�c������       
�c������       
�c������       
�c������       
�c������       
�c������ �0 �C���PPPP        ���UUUU        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ���@@PP� I�$I�����UUUU��     ����UUUU�       ����WVTT�       C����       C�C�UUUU�       E���  �@�       +�#k  WU�       +�#k  	�       C�C�UUUU�       I�Û  �@�       +�#k  _U�       +�#k  -��       C�C�UUUU�       C�C�UUUU�� @   C���PPPP� I�$L�$����UUUU        ���        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��$�PPPP� I�ɑ���UUUU�       ���UUUU�       ����TTVT�       C����       E���   @�       +�#k� �U�       ccUUUU�       +�#k		�U�       +�#k  �       +�#k`pPP�       *�������       ��k�����       +�#k �U�       H��   �       C���PPP�� J�$x�&���UUUU        ��$�        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����  @@        ��D�TUUU� ɐ	� C��U���       #��UUUU�       #���TTTT�       C����       G�C�@����       ccUUUU�       ccUUUU�       L�'cUUU-�       +�#k%%%
�       +�#kp`� �       ��$k��W��       +�k�����       *�{�����       +�#k	'77�       C��PPP�� X%@$C��UU�?        ��D�UUU        ��d�          ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��d�@@@@o I�$I�c�B�UUUU� 1P    C�C�UUUU�       C�C�UUUU�       C���TP`@�       C����       C�#�j����       E���5   �       ��%kVVTT�       +�#k�       C�C�UUUU�       C�C�UUUU�       C�C�UUUU�       +�#k���x�       +�k�����       +�#k'%�       C�C�UUUU� ��   C�C�UUUU� I�$M�$C�C�UUUU        ��d�        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��d�@@@@� I�I�dC�C�UUUU�       C�C�UUUU�       C�C�UUUU�       C���@��@�       C���%U�       C�#�UUUU�       C�C�UUUU�       E���V   �       E���   �       C�C�UUUU�       C�C�UUUU�       C�C�UUUU�       E���@   �       G�C��   �       C�C�UUUU�       C�C�UUUU�       C�C�UUUU� H�$H�$C�C�UUUU        ��d�        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����@@@@_ I�$I�$c�C�UUUU�    �Xc�C�UUUU��     (C�C�UUUU�   8p�$c���@@  �  �$I�$C���UUU �  � 	� C���	�UT�       C���  %U�  �$K�$c�"� 
��  �$I�$C�C�UUUU�  �$I�$C�C�UUUU�  � 	� C�C�UUUU�       C��� �TU�  �$M�$C��� �  �$I�$c�C�UUUU�  ��$c�C�UUUU��    C�C�UUUU�   @��&C�C�UUUU_ H�$I�$c�C�UUUU        ����        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����@           ��d�UUTP        c�C�UUUU        C�C�UUUU        c�B�UUUU� I��ɑc�B�UUUU�)     C�#�UUUU�       C���z   � K�'@(c���           c�B�UUUU        �@ � 	� 	� C����@��       C���	 ��M    C�#�UUUU� L4 
 c�C�UUUUO I�$I�$c�C�UUUU        C�C�UUUU        C�C�UUUU        ��d�UU        ����           ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��a@@@@            UUUU            UUUU        C�C�UUUU� p 0 C�C�UUUU�       C�C�UUUU�       C�C�UUUU�o @   C�C�UUUU? I�$M�$c�C�UUUU        �@� 	� 	� C���?  �       C�C�UUUU�       C�C�UUUU�       C�C�UUUU� H�&P$C�C�UUUU        �@PPPP            UUUU        ��a        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ��0�   @$ I�$I����� ���� I�$I2 ���� UUU� I�$I ���� UUU� I�$I ���� UUU� I�$I ���� UUU� I�$I ���� UUU� I�$I����� UUU I�$I�$��a 
*j        ��0�           ����UUUU        ����UUUU        ��0�@@@@� I�	���az�       C�����       
�c������       
�d������       
�d������       
�d������       
�c������ M�$H�$�@@@@@        ��0�        ����UUUU        ����UUUU        ��0�@@@@� 	�	���az�       C����       
�c��ꪪ�       ʥB:.(�       
�
�UUUU�       ʥB:�P�       ��t����� H�$H�$�@@@@@        ��0�        ����UUUU        ����UUUU        ��0�@@@@� 	�	���az�       C����       
�c������       ʥB:  �       ʥ�J  �T�       ʥB:P  �       ��E|����� H�$H�$�@@@@@        ��0�        ����UUUU        ����UUUU        ��0�@@@�� 	�	���az  �       C����       
�c������       
�c������       
�c������       
�c������       
�c������ H�$x&#��z@�          ��0�        ����UUUU        ����UUUU        ��$��@@@� 	�)����W� �       C����       H�� ��X�       +�#k 55��       +�#k ��A�       +�#k ����       I�Ó  -� @<@,C���TT��        ��$�        ����UUUU        ����UUUU( I�$I���D�pXXX�    C��U�  �       C����       +�#kXX� �       +�#kU�7�       +�#kɋ  �       +�#k�����       +�#s���7� �  
 C��T�  8 I�$I�$��D�%%%        ����UUUU        ����UUUUh I�I�$����\\XX�8    �AC�C�UUUU�     �$C����X��     C���  ��    #�$D�������    $�C�C�UUUU�     	8D��� �    $��E��ܯ����8     (C�C�UUUU| H�$O�$����%5%%        ����UUUU        ����UUUU        ��$���@@        �@  UU� I�DI�c�B�UUUU��     C�#�UUUU� M�'P$c��   � I�I�#������    C���	   � {%  c�C�UUUU        �@  TT        ��$�        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ����UUUU        ���   @� I�$I�����  �U� I�$I ��$�  �U� I�$I ����  �U~ I�$I�%���  *U        ���           ���@@@@� !���       ���s�����       �ťk  @@� �0 0��jjjj        ���        ���@@@�� �� �       ��D�ڪ���       ���k@5  �  0 ,���jj�        ���
 I�$I�������@@�p   C��쟞���       +�#k��ָ�       (�C��~{�� � 
@'�C���� I�$I�$��d�4 I�$I�$����@@���  0�I�D�@   �  0�@ C����( �  ��!C��  �  �bK�&�@   p9 H�$I�$����: I�$I�����   P@ I�$I ���   U6 I�$I�$���   � ��I���D�PPPP�       �զ��fު� x'p'��$�� 	�	�ľ�������@   "�J����� `%C�$����-/� I������� �TT� I�$H�$��� ��n�nX���Tttt�H�$L�$X����Ibؖmٜ�� ���[       ���UUUU            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://draetugtgphur"
path.s3tc="res://.godot/imported/Player.png-0662117005c6b9039deb63a286c8efe4.s3tc.ctex"
metadata={
"imported_formats": ["s3tc_bptc"],
"vram_texture": true
}
  GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c2g0k0j6x05c1"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-30130db486e5864fd9aad2a85eeeb2cb-coin.scn"
               [remap]

path="res://.godot/exported/133200997/export-9314996b8c6776c50d7594c68e6f3224-blue transparent.res"
   [remap]

path="res://.godot/exported/133200997/export-5f5aa44fcbade2d83eea695a0e05fea3-Face.res"
               [remap]

path="res://.godot/exported/133200997/export-0be6639b34e659039a9da31260b674f7-pink.res"
               [remap]

path="res://.godot/exported/133200997/export-d267b47f7e81a3258979164d56d0d9c2-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-2ddd04d543d5858e7f20c9299a8b5096-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-e574e9e9009d830787df9a9904fbe146-test_scene_3d.scn"
      [remap]

path="res://.godot/exported/133200997/export-f8e82ef5837b5b24dd5092cfccecbf3d-snowman.scn"
            list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              .M�x��\   res://icon.svg�̧�$�)'   res://Coin.png�ȁ[��s   res://Player.png�̧�$�)'   res://Sprites/Coin.png�ȁ[��s   res://Sprites/Player.png\��&E+   res://player.tscnH��˯$   res://main.tscnniް:(�b   res://coin.tscnԖr)���   res://test_scene_3d.tscn����r
   res://snowman.tscn�h_÷-   res://Materials/new_standard_material_3d.tres�ꊽr��Z   res://Materials/Face.tres�|����4   res://Materials/blue.tres�h_÷   res://Materials/green.tresJN&����h   res://Materials/pink.tres�.ɸ��q$   res://Materials/new pink.tresN�����   res://Materials/blue.tres�.ɸ��q$   res://Materials/pink.tresN�����%   res://Materials/blue transparent.tres\��&E+   res://Player/player.tscnniް:(�b   res://Coin/coin.tscn����r
   res://Snowman/snowman.tscnH��˯$   res://Scenes/main.tscnԖr)���   res://Scenes/test_scene_3d.tscn        ECFG      application/config/name         IntroToGodot   application/run/main_scene          res://Scenes/main.tscn     application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility    