# Capitulo 14: Web3.js

¡Nuestro contrato Solidity está completo! Ahora nosotros necesitamos escribir un frontend en javascript que interactué con el contrato.

Ethereum tiene una librería llamada `Web3.js`.

En próximas lesiones, vamos a profundizar como desplegar un contrato y configurarlo en Web3.js. Pero por ahora, vamos tan solo a mirar como luce un ejemplo de código de cómo Web3.js interactúa con tu contrato desplegado.

No te preocupes si aún no entiendes lo siguiente:

```js
// Aquí está cómo vamos a acceder a nuestro contrato
var abi = /* abi es generado por el compilador */
var ZombieFactoryContract = web3.eth.contract(abi)
var contractAddress = /* Nuestra dirección del contrato en Ethereum una vez desplegado */
var ZombieFactory = ZombieFactoryContract.at(contractAddress)
// `ZombieFactory` tiene acceso a nuestras funciones públicas y eventos de nuestro contrato

// Algún tipo de event listener para capturar la entrada de texto:
$("#ourButton").click(function (e) {
    var name = $("#nameInput").val()
    // Llamado a la función `createRandomZombie` de nuestro contrato
    ZombieFactory.createRandomZombie(name)
})

// Escuchar el evento `NewZombie`, y actualizar la UI
var event = ZombieFactory.NewZombie(function (error, result) {
    if (error) return
    generateZombie(result.zombieId, result.name, result.dna)
})

// Tomar el ADN Zombie, y actualizar nuestra imagen
function generateZombie(id, name, dna) {
    let dnaStr = String(dna)
    // rellenar nuestro ADN con ceros a la izquierda id este es menor a 16 caracteres
    while (dnaStr.length < 16)
        dnaStr = "0" + dnaStr

    let zombieDetails = {
        // Los primeros 2 dígitos representan la cabeza. Nosotros tenemos 7 cabezas posibles, por eso % 7
        // para obtener un número entre 0 y 6, entonces añadimos 1 para hacer que sea de 1 a 7. Luego nosotros tenemos 7
        // archivos de imágenes llamados `head1.png` hasta `head7.png` las cuales cargamos en base a ese número:
        headChoice: dnaStr.substring(0, 2) % 7 + 1,
        // Los segundos 2 dígitos representan los ojos, y tenemos 11 variaciones:
        eyeChoice: dnaStr.substring(2, 4) % 11 + 1,
        // 6 variaciones de camisas:
        shirtChoice: dnaStr.substring(4, 6) & 6 + 1,
        // Los últimos 6 dígitos controlan el color. Actualizamos usando un filtro CSS: hue-rotate, el cual tiene 360 grados:
        skinColorChoice: parseInt(dnaStr.substring(6, 8) / 100 * 360),
        eyeColorChoice: parseInt(dnaStr.substring(8, 10) / 100 * 360),
        clothesColorChoice: parseInt(dnaStr.substring(10, 12) / 100 * 360),
        zombieName: name,
        zombieDescription: "A Level 1 CryptoZombie"
    }
    return zombieDetails
}
```

Lo que hace nuestro código JavaScript es tomar los valores generados en la función `zombieDetails` de arriba, y usamos algún navegador basado en el mágico JavaScript (nosotros estamos usando Vue.js) para intercambiar las imágenes y aplicar los filtros CSS. Tu vas a obtener todo el código en próximas lecciones.

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/14](https://cryptozombies.io/en/lesson/1/chapter/14)
