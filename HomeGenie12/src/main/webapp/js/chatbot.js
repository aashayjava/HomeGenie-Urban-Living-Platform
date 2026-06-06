function openService(service){

let buttons = document.getElementById("serviceButtons");

if(service === "cleaning"){

buttons.innerHTML = `
<button>🍳 Kitchen Cleaning</button>
<button>🚿 Bathroom Cleaning</button>
<button>🪟 Window Cleaning</button>
<button>🏠 Full Home Cleaning</button>
<button onclick="goBack()">⬅ Back</button>
`;

}

}

function goBack(){

let buttons = document.getElementById("serviceButtons");

buttons.innerHTML = `
<button onclick="window.location.href='homecleaning.jsp'">🧹 Home Cleaning</button>
<button onclick="openService('repair')">🔧 Repairing</button>
<button onclick="openService('maintenance')">🏠 Maintenance</button>
<button onclick="openService('emergency')">🚨 Emergency</button>
<button onclick="openService('salon')">💇 Salon Services</button>
`;

}