let cartCount = parseInt(document.getElementById("cartCount").innerText) || 0;

function startCart(id,service,price){

document.getElementById("book"+id).style.display="none";
document.getElementById("cart"+id).style.display="flex";

document.getElementById("count"+id).innerText=1;

cartCount++;
document.getElementById("cartCount").innerText=cartCount;

fetch("addToCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)+"&price="+price
});

}

function add(service,price,id){

let count=document.getElementById("count"+id);
let val=parseInt(count.innerText);

val++;
count.innerText=val;

cartCount++;
document.getElementById("cartCount").innerText=cartCount;

fetch("addToCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)+"&price="+price
});

}

function minus(service,id){

let count=document.getElementById("count"+id);
let val=parseInt(count.innerText);

if(val>1){

val--;
count.innerText=val;
cartCount--;

}else{

document.getElementById("cart"+id).style.display="none";
document.getElementById("book"+id).style.display="inline-block";

cartCount--;

}

if(cartCount<0) cartCount=0;

document.getElementById("cartCount").innerText=cartCount;

fetch("removeFromCart.jsp",{
method:"POST",
headers:{
"Content-Type":"application/x-www-form-urlencoded"
},
body:"service_name="+encodeURIComponent(service)
});

}