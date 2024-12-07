

var myMap = new Map()

myMap.set( 1 , {name : 'andreas'})
myMap.set( 3 , {name : 'peter'} )

console.log("map="+myMap)

console.log('1:name='+myMap.get(1).name )
console.log('3:name='+myMap.get(3).name )


var iterator = myMap.keys()

console.log( iterator.next().value);

function logMapElements(value, key, map) {
  console.log(`m[${key}] = ${value.name}`)
}

myMap.forEach(logMapElements)

if ( myMap.get(4) == undefined){
  console.log('map 4 undefined')
}


