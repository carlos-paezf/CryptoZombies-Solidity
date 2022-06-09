# Capítulo 14: Envolviéndolo

¡Esto es todo, has completado la lección 2!

Tu puedes probar el demo de la plataforma. Prueba atacando un gatito con el zombie, y mira como se obtiene un nuevo zombie.

## Implementación en JavaScript

Una que estemos listos para desplegar este contrato para Ethereum, compilamos y desplegamos `ZombieFeeding`, ya que este contrato es nuestro contrato final que hereda de `ZombieFactory`, y tiene acceso a todos los métodos públicos en ambos contratos.

Observa un ejemplo de la interacción de nuestro contrato desplegado usando JavaScript y Web3.js:

```js
var abi = /* abi generado por el compilador */
var ZombieFeedingContract = web3.eth.contract(abi)
var contractAddress = /* nuestra dirección de contrato en Ethereum después de desplegar */
var ZombieFeeding = ZombieFeedingContract.at(contractAddress)

// Asumimos que tenemos nuestro ID zombie y el ID del gatito al que queremos atacar
let zombieId = 1;
let kittyId = 1;

// Para obtener una imagen de CryptoKitty, necesitamos una consulta hacia su API web. Esta información
// no es almacenada en el blockchain, solo en su servidor web.
// Si todo fuera almacenado en un blockchain, no tendríamos que preocuparnos
// acerca de una caída del servidor, que ellos cambien su API, o que la compañía nos bloquee la carga
// de sus assets si a ellos no les gusta nuestro juego zombie.
let apiURL = "https://api.cryptokitties.co/kitties/" + kittyId
$.get(apiUrl, function(data) {
    let imgUrl = data.image_url
    // hacer algo al mostrar la imagen
})

// Cuando el usuario hace click en un gatito:
$(".kittyImage").click(function(e) {
    // Llamar nuestro método `feedOnKitty` del contrato
    ZombieFeeding.feedOnKitty(zombieId, kittyId)
})

// Escuchar el evento NewZombie de nuestro contrato para poder mostrarlo
ZombieFactory.NewZombie(function (error, result) {
    if (error) return
    // Esta función mostrar el zombie, como en la lección 1
    generateZombie(result.zombieId, result.name, result.dna)
})
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/14](https://cryptozombies.io/en/lesson/2/chapter/14)
