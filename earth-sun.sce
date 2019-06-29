//dist km
//t jour day
//angle deg 
//TODO speed
diametreSoleil=1392400
diameterEarth=12756.7
perihelie=147.1*10^6
aphelie=152.1e6
//23°27'
inclinaison=23
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
    x2=rotaAlpha(360*t/Trotation,x,y,z)
    y2=perihelie*sin(atan(y/x)+alphaDeg*2*%pi/360)
    z2=z
endfunction


function [a]=angl1Deg(x,y,z)
   a=atan(z/x)*360/(2*%pi)
endfunction


function [a]=angl2Deg(x,y,z)
   a=angl1Deg(x,y,z)-inclinaison
endfunction


function [x2,y2,z2]=inclinaison(x,y,z)
    x2=sqrt(x^2+z^2)*cos(angl2Deg(x,y,z)*2*%pi/360)
    y2=y
    z2=sqrt(x^2+z^2)*sin(angl2Deg(x,y,z)*2*%pi/360)
endfunction

function [x,y,z]=terreRevRot(t)
    x= terreRev(t).x+rotaT(t).x
    y= terreRev(t).y+rotaT(t).y
    z=terreRev(t).y
endfunction


