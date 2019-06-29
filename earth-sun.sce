//dist km
//t jour day
//angle deg 
//TODO speed
diametreSoleil=1392400
diameterEarth=12756.7
perihelie=147.1*10^6
aphelie=152.1e6
//23°27'
inclinaisonConst=23
//period 365.26 days
//anticlockwise seen 'above
Trevolution=365.26
//23h56'4""
Trotation=23.9/24
//laid ellipsis
//time t in days
//terreRapportSoleil
function [x,y,z]=terreRev(t)
    x=aphelie*cos(t*2*%pi/T)
    y=perihelie*sin(t*2*%pi/T)
    z=0
endfunction

//straight Earth = no inclinaison
//in x y plan
function [x2,y2,z2]=rotaAlpha(alphaDeg,x,y,z)
    x2=aphelie*cos(atan(y/x)+alphaDeg*2*%pi/360)
    y2=perihelie*sin(atan(y/x)+alphaDeg*2*%pi/360)
    z2=z
endfunction

//straight Earth = no inclinaison
//in x y plan
//1 day
function [x2,y2,z2]=rotaT(t,x,y,z)
    [raX,raY,raZ]=rotaAlpha(360*t/Trotation,x,y,z)
    raX
    raY
    raZ
    x2=raX
    y2=raY
    z2=z
endfunction


function [a]=angl1Deg(x,y,z)
    //angl1AzimutDeg
   a=atan(z/x)*360/(2*%pi)
endfunction


function [a]=angl2Deg(x,y,z)
   a=angl1Deg(x,y,z)-inclinaisonConst
endfunction


function [x2,y2,z2]=inclinaison(x,y,z)
    x2=sqrt(x^2+z^2)*cos(angl2Deg(x,y,z)*2*%pi/360)
    y2=y
    z2=sqrt(x^2+z^2)*sin(angl2Deg(x,y,z)*2*%pi/360)
endfunction

function [x,y,z]=terreRevRot(t)
    [tR1,tR2,tR3]=terreRev(t)
    [r1,r2,r3]=rotaT(t)
    x= tR1+r1
    y= tR2+r2
    z=tR3
endfunction



function [x,y,z]=terreRevRotIncl(t)
    [tRR1,tRR2,tRR3]=terreRevRot(t)
  [x,y,z]=   inclinaison(tRR1,tRR2,tRR3)
endfunction


