const dashboard = require("fast-dashboard");

function getRandomNumber(min, max) {
    return Math.random() * (max - min) + min;
}
console.log("ENV: ", process.env);
 
setInterval(()=>{
    var randN = getRandomNumber(1,100);
    console.log("randN: ",randN)
    dashboard({
        value1: randN*randN,
        value2: randN
    })
},1000)