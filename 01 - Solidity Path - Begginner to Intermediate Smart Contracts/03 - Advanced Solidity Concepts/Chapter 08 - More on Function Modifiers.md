# Capítulo 8: Más en Modificadores de Función

¡Genial! Nuestro zombies ahora tienen la funcionalidad de timer de recuperación.

Lo siguiente que vamos a hacer es añadir algunos métodos de ayuda adicionales. Hemos creados un nuevo archivo llamado `zombiehelper.sol`, en el importamos `zombiefeeding.sol`. Esto nos ayudara a mantener nuestro código ordenado.

Haremos que los zombies ganen habilidades especiales después de alcanzar cierto nivel. Pero con el fin de hacer esto, primero necesitamos aprender un poco más acerca de los modificadores de funciones.

## Modificadores de funciones con argumentos

Previamente observamos un simple ejemplo de `onlyOwner`. Pero los modificadores de función también pueden tomar argumentos. Por ejemplo:

```sol
// Una asignación para almacenar la edad de un usuario
mapping (uint => uint) public age;

// Modificador que require que el usuario sea mayor a cierta edad
modifier olderThan(uint _age, uint _userId) {
    require(_age[_userId] >= _age);
    _;
}

// Debe ser mayor de 16 para conducir un vehículo (in los US, por lo menos).
// Podemos llamar el modificador `olderThan` con argumentos como:
function driveCar(uint _userId) public olderThan(16, _userId) {
    // Alguna lógica de función
}
```

Tu puedes ver aquí que el modificador `orlderThan` toma argumentos justo como una función lo hace. Y que la función `driveCar` pasa estos argumentos al modificador.

Vamos a intentarlos con nuestro propio `modifier` que use la propiedad `level` de los zombies para restringir el acceso a las habilidades especiales.

## Ponte a prueba

1. En `ZombieHelper`, creamos un `modifier` llamado `aboveLevel`. Este tomará 2 argumentos, `_level` (un `uint`) y `_zombieId` (también un `uint`).
2. El cuerpo debe asegurarse de que `zombies[_zombieId].level` es mayor o igual a `_level`.
3. Recuerda que en la última línea del modificador debemos llamar el resto de la función con `_;`

```sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/8](https://cryptozombies.io/en/lesson/3/chapter/8)
