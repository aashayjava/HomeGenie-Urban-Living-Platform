// page load hone ke baad animation control

window.onload = function() {

    // HomeGenie title ko show karna
    setTimeout(function(){
        document.querySelector(".title").style.opacity = "1";
    },2000);


    // page ko login page par redirect karna
    setTimeout(function(){
        document.body.style.transition="opacity 1s";
        document.body.style.opacity="0";
    },5000);


    setTimeout(function(){
        window.location.href="login.jsp";
    },6000);

};/**
 * 
 */