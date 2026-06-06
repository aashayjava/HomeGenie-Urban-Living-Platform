<!DOCTYPE html>
<html>
<head>

<title>HomeGenie</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
}

html,body{
height:100%;
width:100%;
font-family:'Segoe UI',sans-serif;
overflow:hidden;
}



body{

background-image:url("images/lamp11.png");
background-size:cover;
background-position:center center;
background-repeat:no-repeat;
background-attachment:fixed;

display:flex;
justify-content:center;
align-items:center;
flex-direction:column;

}

/* Dark overlay */

.overlay{

position:fixed;
top:0;
left:0;
width:100%;
height:100%;

background:rgba(0,0,0,0.35);

}

/* Title */

.title{

position:absolute;
top:90px;

font-size:90px;
font-weight:bold;
letter-spacing:3px;

background:linear-gradient(90deg,#00f2ff,#4facfe,#ffffff);
-webkit-background-clip:text;
-webkit-text-fill-color:transparent;

text-shadow:
0 0 20px rgba(0,255,255,0.8),
0 0 40px rgba(0,200,255,0.7);

opacity:0;

animation:titleAppear 3s forwards;
animation-delay:1.5s;

z-index:10;
}

@keyframes titleAppear{

0%{
opacity:0;
transform:scale(0.4);
}

100%{
opacity:1;
transform:scale(1);
}

}

/* Lamp */

.lamp{

width:240px;
z-index:10;

animation:floatLamp 4s ease-in-out infinite;

}

@keyframes floatLamp{

0%{transform:translateY(0);}
50%{transform:translateY(-20px);}
100%{transform:translateY(0);}

}

/* Magic cloud */

.cloud{

position:absolute;
bottom:200px;

width:300px;
height:300px;

background:radial-gradient(circle,#7dd3fc,#0ea5e9);
border-radius:50%;

filter:blur(40px);

opacity:0;

animation:cloudMagic 5s forwards;
animation-delay:2s;

z-index:5;

}

@keyframes cloudMagic{

0%{
opacity:0;
transform:scale(0.3);
}

50%{
opacity:0.8;
transform:scale(1.2);
}

100%{
opacity:0;
transform:scale(2.5) translateY(-200px);
}

}

</style>

<script>

setTimeout(function(){

window.location="login.jsp";

},7000);

</script>

</head>

<body>

<div class="overlay"></div>

<div class="title">HomeGenie</div>




</body>

</html>