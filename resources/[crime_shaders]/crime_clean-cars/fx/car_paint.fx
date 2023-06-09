//
// car_paint.fx
// EDIT by Ren712: Paint color and reflection vector fix
// added sky light and thin film effect to the car paint
// and other bits and pieces ...
// the effect uses up to all 4 pointlights for vehicle lighting

//
// Badly converted from:
//
//      ShaderX2 � Shader Programming Tips and Tricks with DirectX 9
//      http://developer.amd.com/media/gpu_assets/ShaderX2_LayeredCarPaintShader.pdf
//
//      Chris Oat           Natalya Tatarchuk       John Isidoro
//      ATI Research        ATI Research            ATI Research
//

//---------------------------------------------------------------------
// Car paint settings
//---------------------------------------------------------------------
texture sReflectionTexture;
texture sRandomTexture;
texture sFringeMap;

float gFilmDepth = 0.05;
float gFilmIntensity = 0.25;
bool gFilmDepthEnable = true;

//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#include "mta-helper.fx"
float4 gFogColor < string renderState="FOGCOLOR"; >;

//------------------------------------------------------------------------------------------
// Samplers for the textures
//------------------------------------------------------------------------------------------
sampler Sampler0 = sampler_state
{
    Texture         = (gTexture0);
    MinFilter       = Linear;
    MagFilter       = Linear;
    MipFilter       = Linear;
};

sampler2D gFringeMapSampler = sampler_state 
{
   Texture = (sFringeMap);
   MinFilter = Linear;
   MipFilter = Linear;
   MagFilter = Linear;
   AddressU  = Clamp;
   AddressV  = Clamp;
};

sampler3D RandomSampler = sampler_state
{
   Texture = (sRandomTexture);
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = POINT;
   MIPMAPLODBIAS = 0.000000;
};

samplerCUBE ReflectionSampler = sampler_state
{
   Texture = (sReflectionTexture);
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MIPMAPLODBIAS = 0.000000;
};


//---------------------------------------------------------------------
// Structure of data sent to the vertex shader
//---------------------------------------------------------------------
struct VSInput
{
    float3 Position : POSITION0;
    float3 Normal : NORMAL0;
    float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

//---------------------------------------------------------------------
// Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------
struct PSInput
{
    float4 Position : POSITION0;
    float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
    float3 Tangent : TEXCOORD1;
    float3 Binormal : TEXCOORD2;
    float3 Normal : TEXCOORD3;
    float3 NormalSurf : TEXCOORD4;
    float3 View : TEXCOORD5;
    float4 BottomColor : TEXCOORD6;
    float3 SparkleTex : TEXCOORD7;
    float4 Diffuse2 : COLOR1;
};

//////////////////////////////////////////////////////////////////////////
// Function to Index this texture - use in vertex or pixel shaders ///////
//////////////////////////////////////////////////////////////////////////

float calc_view_depth(float NDotV,float Thickness)
{
    return (Thickness / NDotV);
}

//------------------------------------------------------------------------------------------
// VertexShaderFunction
//  1. Read from VS structure
//  2. Process
//  3. Write to PS structure
//------------------------------------------------------------------------------------------
PSInput VertexShaderFunction(VSInput VS)
{
    PSInput PS = (PSInput)0;

    // Transform postion
    PS.Position = mul(float4(VS.Position, 1), gWorldViewProjection);
    float3 worldPosition = MTACalcWorldPosition( VS.Position );
    PS.View = normalize(gCameraPosition - worldPosition);
	
    // Fake tangent and binormal
    float3 Tangent = VS.Normal.yxz;
    Tangent.xz = VS.TexCoord.xy;
    float3 Binormal = normalize( cross(Tangent, VS.Normal) );
    Tangent = normalize( cross(Binormal, VS.Normal) );
	
    // Transfer some stuff
    PS.TexCoord = VS.TexCoord;
    PS.Tangent = normalize(mul(Tangent, gWorldInverseTranspose).xyz);
    PS.Binormal = normalize(mul(Binormal, gWorldInverseTranspose).xyz);
    PS.Normal = normalize( mul(VS.Normal, (float3x3)gWorld) );
    PS.NormalSurf = VS.Normal;

    PS.SparkleTex.x = fmod( VS.Position.x, 10 ) * 4.0;
    PS.SparkleTex.y = fmod( VS.Position.y, 10 ) * 4.0;
    PS.SparkleTex.z = fmod( VS.Position.z, 10 ) * 4.0;
	
    // compute the view depth for the thin film
    float3 Nn = mul(VS.Normal,gWorldInverseTranspose).xyz;	
    float3 Vn = normalize(gCameraPosition - worldPosition);
    float vdn = dot(Vn,Nn);
    float viewdepth = calc_view_depth(vdn,gFilmDepth.x);
    PS.Diffuse2.a = viewdepth.x;
	
    float NormalZ = pow( mul( VS.Normal, (float3x3)gWorld ).z ,2 ); 
    float3 h = normalize(normalize(gCameraPosition - worldPosition.xyz ) - normalize(gCameraDirection));
    PS.BottomColor = gMaterialDiffuse * 0.3 *  NormalZ * (1 - saturate(pow(saturate(dot(PS.Normal,h)), 2)));
	
    // Calc lighting
    PS.Diffuse2.rgb = gMaterialSpecular.rgb * MTACalculateSpecular( gCameraDirection, gLightDirection, PS.Normal, gMaterialSpecPower ) * 0.5;
    PS.Diffuse2.rgb += MTACalcGTADynamicDiffuse( PS.Normal ) * saturate(gMaterialDiffuse/2 + 0.2);
    PS.Diffuse2.rgb = saturate(PS.Diffuse2.rgb);
    PS.Diffuse = MTACalcGTABuildingDiffuse( VS.Diffuse );
    return PS;
}

//------------------------------------------------------------------------------------------
// PixelShaderFunction
//  1. Read from PS structure
//  2. Process                                       
//  3. Return pixel color
//------------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    float4 OutColor = 1;

    // Some settings for something or another
    float microflakePerturbation = 1.00;
    float normalPerturbation = 1.00;
    float microflakePerturbationA = 0.10;

    // Compute paint colors
    float4 base = gMaterialAmbient;

    float4 paintColorMid;
    float4 paintColor2;
    float4 paintColor0;
    float4 flakeLayerColor;

    paintColorMid = base;
    paintColor2.r = base.g / 2 + base.b / 2;
    paintColor2.g = (base.r / 2 + base.b / 2);
    paintColor2.b = base.r / 2 + base.g / 2;

    paintColor0.r = base.r / 2 + base.g / 2;
    paintColor0.g = (base.g / 2 + base.b / 2);
    paintColor0.b = base.b / 2 + base.r / 2;

    flakeLayerColor.r = base.r / 2 + base.b / 2;
    flakeLayerColor.g = (base.g / 2 + base.r / 2);
    flakeLayerColor.b = base.b / 2 + base.g / 2;


    // Get the surface normal
    float3 vNormal = PS.Normal;

    // Micro-flakes normal map is a high frequency normalized
    // vector noise map which is repeated across the surface.
    // Fetching the value from it for each pixel allows us to
    // compute perturbed normal for the surface to simulate
    // appearance of micro-flakes suspended in the coat of paint:
    float3 vFlakesNormal = tex3D(RandomSampler, PS.SparkleTex).rgb;

    // Don't forget to bias and scale to shift color into [-1.0, 1.0] range:
    vFlakesNormal = 2 * vFlakesNormal - 1.0;

    // This shader simulates two layers of micro-flakes suspended in
    // the coat of paint. To compute the surface normal for the first layer,
    // the following formula is used:
    // Np1 = ( a * Np + b * N ) / || a * Np + b * N || where a << b
    //
    float3 vNp1 = microflakePerturbationA * vFlakesNormal + normalPerturbation * vNormal ;

    // To compute the surface normal for the second layer of micro-flakes, which
    // is shifted with respect to the first layer of micro-flakes, we use this formula:
    // Np2 = ( c * Np + d * N ) / || c * Np + d * N || where c == d
    float3 vNp2 = microflakePerturbation * ( vFlakesNormal + vNormal ) ;

    // The view vector (which is currently in world space) needs to be normalized.
    // This vector is normalized in the pixel shader to ensure higher precision of
    // the resulting view vector. For this highly detailed visual effect normalizing
    // the view vector in the vertex shader and simply interpolating it is insufficient
    // and produces artifacts.
    float3 vView = normalize( PS.View );
	
    // Transform the surface normal into world space (in order to compute reflection
    // vector to perform environment map look-up):
    float3x3 mTangentToWorld = transpose( float3x3( PS.Tangent, PS.Binormal, PS.Normal ) );
    float3 vNormalWorld = normalize( mul( mTangentToWorld, vNormal ));

    // Compute reflection vector resulted from the clear coat of paint on the metallic
    // surface:
    float fNdotV = saturate(dot( vNormalWorld, vView));
    
    // Count reflection vector
    float3 vReflection = reflect(PS.View,PS.Normal);
	
    // Hack in some bumpyness
    vReflection.x+= vNp2.x * 0.2;
    vReflection.y+= vNp2.y * 0.1;
    // Sample environment map using this reflection vector:
    float4 envMap = texCUBE( ReflectionSampler, -vReflection.xzy );
    // Premultiply by alpha:

    envMap.rgb = envMap.rgb * envMap.rgb * envMap.rgb;
    // Brighten the environment map sampling result:
    envMap.rgb *= 0.4;
	envMap.rgb += PS.BottomColor.rgb;
    // Sample dust texture:
    float4 maptex = tex2D(Sampler0,PS.TexCoord.xy);
	
    // Sample fringe map:
    float3 fringeCol = tex2D(gFringeMapSampler, float2(PS.Diffuse2.a,PS.Diffuse2.a)).rgb;
    
    // Compute modified Fresnel term for reflections from the first layer of
    // microflakes. First transform perturbed surface normal for that layer into
    // world space and then compute dot product of that normal with the view vector:
    float3 vNp1World = normalize( mul( mTangentToWorld, vNp1) );
    float fFresnel1 = saturate( dot( vNp1World, vView ) + PS.Diffuse2.r);

    // Compute modified Fresnel term for reflections from the second layer of
    // microflakes. Again, transform perturbed surface normal for that layer into
    // world space and then compute dot product of that normal with the view vector:
    float3 vNp2World = normalize( mul( mTangentToWorld, vNp2 ));
    float fFresnel2 = saturate( dot( vNp2World, vView ));

    // Combine all layers of paint as well as two layers of microflakes
    float fFresnel1Sq = fFresnel1 * (fFresnel1);

    float4 paintColor = fFresnel1 * paintColor0 +
        fFresnel1Sq * paintColorMid +
        fFresnel1Sq * fFresnel1Sq * paintColor2 +
        pow( fFresnel2, 32 ) * flakeLayerColor;

    // Combine result of environment map reflection with the paint color:
    float fEnvContribution = 1.0 - 0.5 * fNdotV;

    float4 finalColor = envMap * fEnvContribution + paintColor * 0.8;
    finalColor.rgb += PS.Diffuse2.rgb  * 0.75 * (1 + 0.5 * fFresnel2);
    finalColor.a = 1.0;
    if (gFilmDepthEnable) PS.Diffuse.rgb += PS.Diffuse.rgb * fringeCol * gFilmIntensity;
    // Bodge in the car colors
    float4 Color = 0.017 + finalColor / 1 + PS.Diffuse * 0.8;
    Color.rgb += finalColor * PS.Diffuse;
    Color *= maptex; 
    Color.a = PS.Diffuse.a;
    return Color;
}


//------------------------------------------------------------------------------------------
// Techniques
//------------------------------------------------------------------------------------------
technique carpaint_fix_v2_4
{
    pass P0
    {
        AlphaRef = 1;
        AlphaBlendEnable = TRUE;
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader  = compile ps_2_0 PixelShaderFunction();
    }
}

// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}
