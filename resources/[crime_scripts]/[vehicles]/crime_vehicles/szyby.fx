technique tint { 
    pass P0 { 
        DepthBias = 0.0000; 
        AlphaBlendEnable = FALSE; // Disable alpha blending 
        SrcBlend = SRCALPHA; // Source blend factor 
        DestBlend = INVSRCALPHA; // Destination blend factor 
    } 
} 
  
// Fallback method 
technique fallback { 
    pass P0 { 
        // Normal drawing 
    } 
} 