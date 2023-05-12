Resource: Screen Effects v0.0.5
contact: knoblauch700@o2.pl

This resource lets You create some animated full screen effects. There are 4 effects -
Colors, Shake, Wobble, Esotropia. The resource by itself doesn't do anything, It provides
some exported functions to manage the shader effects. You can set the effect intensity
fade in/out speed and other variables. It was meant for some project (quite long ago). 
I wouldn't want this resource go to waste. Maybe you'll do something useful with that.

example resource: 
http://www.solidfiles.com/d/7868d415ac/screen_fx_test.zip

exported functions:
startEffects(bool doStart)
	Compile and start the shaders
enableEffect(int effectID 1-4,bool enable)
	Enable effect: Colors, Shake, Wobble, Esotropia
setMaxAlpha(int alpha 0-255)
	Set max alpha for dxDrawImage
setEffectMaxStrength(int effectID 1-4,float 0-1)
	Set max intensity of the effect
setEffectFadeSpeed(int effectID 1-4,float 0-1)
	Set max speed of the effect
setEffectVariables(int effectID 1-4,bool enable,float fadeSpeed 0-1,float strength 0-1,[float 1 to 3 optional variables])
	Enable and set variables of the effect. Depends on the effect ID

ID1, ... = choke
ID3, ... = size,density
ID4, ... = intensity,blur,choke