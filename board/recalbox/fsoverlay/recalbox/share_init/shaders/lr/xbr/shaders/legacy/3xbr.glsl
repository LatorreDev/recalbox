// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord2;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _texCoord2;
    vec4 _t1;
};
out_vertex _ret_0;
input_dummy _IN1;
vec4 _r0006;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _ps;
    vec2 _texCoord;
    _r0006 = VertexCoord.x*MVPMatrix[0];
    _r0006 = _r0006 + VertexCoord.y*MVPMatrix[1];
    _r0006 = _r0006 + VertexCoord.z*MVPMatrix[2];
    _r0006 = _r0006 + VertexCoord.w*MVPMatrix[3];
    _ps = vec2(1.00000000E+00/TextureSize.x, 1.00000000E+00/TextureSize.y);
    _texCoord = TexCoord.xy + vec2( 1.00000001E-07, 1.00000001E-07);
    _OUT._t1.xy = vec2(0.00000000E+00, -_ps.y);
    _OUT._t1.zw = vec2(-_ps.x, 0.00000000E+00);
    _ret_0._position1 = _r0006;
    _ret_0._texCoord2 = _texCoord;
    _ret_0._t1 = _OUT._t1;
    gl_Position = _r0006;
    TEX0.xy = _texCoord;
    TEX1 = _OUT._t1;
    return;
    TEX0.xy = _ret_0._texCoord2;
    TEX1 = _ret_0._t1;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _texCoord;
    vec4 _t1;
};
vec4 _ret_0;
vec3 _TMP16;
vec3 _TMP19;
vec3 _TMP22;
vec3 _TMP23;
vec3 _TMP20;
vec3 _TMP21;
vec3 _TMP17;
vec3 _TMP18;
vec4 _TMP15;
vec4 _TMP14;
vec4 _TMP13;
vec4 _TMP12;
vec4 _TMP11;
vec4 _TMP10;
vec4 _TMP9;
vec4 _TMP8;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP4;
float _TMP3;
float _TMP2;
float _TMP1;
float _TMP0;
uniform sampler2D Texture;
input_dummy _IN1;
vec2 _x0029;
vec2 _c0047;
vec2 _c0049;
vec2 _c0051;
vec2 _c0055;
vec2 _c0057;
vec2 _c0059;
vec2 _c0061;
float _TMP62;
float _TMP66;
float _TMP70;
float _TMP74;
float _TMP78;
float _TMP82;
float _TMP86;
float _TMP90;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec2 _fp;
    vec2 _g1;
    vec2 _g2;
    vec3 _E5;
    vec3 _E8;
    _x0029 = TEX0.xy*TextureSize;
    _fp = fract(_x0029);
    _TMP0 = float((_fp.x >= 5.00000000E-01));
    _TMP1 = float((_fp.y >= 5.00000000E-01));
    _TMP2 = float((_fp.x >= 5.00000000E-01));
    _TMP3 = float((_fp.y >= 5.00000000E-01));
    _g1 = TEX1.xy*((_TMP0 + _TMP1) - 1.00000000E+00) + TEX1.zw*(_TMP2 - _TMP3);
    _TMP4 = float((_fp.y >= 5.00000000E-01));
    _TMP5 = float((_fp.x >= 5.00000000E-01));
    _TMP6 = float((_fp.x >= 5.00000000E-01));
    _TMP7 = float((_fp.y >= 5.00000000E-01));
    _g2 = TEX1.xy*(_TMP4 - _TMP5) + TEX1.zw*((_TMP6 + _TMP7) - 1.00000000E+00);
    _c0047 = TEX0.xy + _g1;
    _TMP8 = COMPAT_TEXTURE(Texture, _c0047);
    _c0049 = (TEX0.xy + _g1) - _g2;
    _TMP9 = COMPAT_TEXTURE(Texture, _c0049);
    _c0051 = TEX0.xy + _g2;
    _TMP10 = COMPAT_TEXTURE(Texture, _c0051);
    _TMP11 = COMPAT_TEXTURE(Texture, TEX0.xy);
    _c0055 = TEX0.xy - _g2;
    _TMP12 = COMPAT_TEXTURE(Texture, _c0055);
    _c0057 = (TEX0.xy - _g1) + _g2;
    _TMP13 = COMPAT_TEXTURE(Texture, _c0057);
    _c0059 = TEX0.xy - _g1;
    _TMP14 = COMPAT_TEXTURE(Texture, _c0059);
    _c0061 = (TEX0.xy - _g1) - _g2;
    _TMP15 = COMPAT_TEXTURE(Texture, _c0061);
    _E5 = _TMP11.xyz;
    _E8 = _TMP11.xyz;
    _TMP62 = dot(_TMP8.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP66 = dot(_TMP9.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP70 = dot(_TMP10.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP74 = dot(_TMP11.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP78 = dot(_TMP12.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP82 = dot(_TMP13.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP86 = dot(_TMP14.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    _TMP90 = dot(_TMP15.xyz, vec3( 6.55360000E+04, 2.55000000E+02, 1.00000000E+00));
    if (_TMP86 == _TMP78 && _TMP86 != _TMP74 && (_TMP74 == _TMP82 && (_TMP86 == _TMP90 || _TMP74 == _TMP70) || _TMP74 == _TMP66 && (_TMP86 == _TMP90 || _TMP74 == _TMP62))) { 
        _E8 = _TMP11.xyz + 8.75000000E-01*(_TMP12.xyz - _TMP11.xyz);
        _E5 = _TMP11.xyz + 1.25000000E-01*(_TMP12.xyz - _TMP11.xyz);
    } 
    if (_fp.x < 3.33333343E-01) { 
        if (_fp.y < 3.33333343E-01) { 
            _TMP17 = _E8;
        } else {
            if (_fp.y < 6.66666687E-01) { 
                _TMP18 = _E5;
            } else {
                _TMP18 = _E8;
            } 
            _TMP17 = _TMP18;
        } 
        _TMP16 = _TMP17;
    } else {
        if (_fp.x < 6.66666687E-01) { 
            if (_fp.y < 3.33333343E-01) { 
                _TMP20 = _E5;
            } else {
                if (_fp.y < 6.66666687E-01) { 
                    _TMP21 = _TMP11.xyz;
                } else {
                    _TMP21 = _E5;
                } 
                _TMP20 = _TMP21;
            } 
            _TMP19 = _TMP20;
        } else {
            if (_fp.y < 3.33333343E-01) { 
                _TMP22 = _E8;
            } else {
                if (_fp.y < 6.66666687E-01) { 
                    _TMP23 = _E5;
                } else {
                    _TMP23 = _E8;
                } 
                _TMP22 = _TMP23;
            } 
            _TMP19 = _TMP22;
        } 
        _TMP16 = _TMP19;
    } 
    _ret_0 = vec4(_TMP16.x, _TMP16.y, _TMP16.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif
