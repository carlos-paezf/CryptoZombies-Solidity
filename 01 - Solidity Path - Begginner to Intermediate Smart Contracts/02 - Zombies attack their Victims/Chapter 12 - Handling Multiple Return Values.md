# Manejando el retorno de múltiples valores

Esta función `getKitty` es el primer ejemplo en el que vemos que se retornan múltiples valores. Miremos como manejarlos:

```sol
function multipleReturns() internal returns(uint a, uint b, uint c) {
    return (1, 2, 3);
}

function processMultipleReturns() external {
    uint a;
    uint b;
    uint c;
    // Así es como manejas múltiples asignaciones:
    (a, b, c) = multipleReturns();
}

function getLastReturnValue() external {
    uint c;
    // Nosotros podemos dejar los otros campos vacíos:
    (, , c) = multipleReturns();
}
```

## Ponlo a prueba

¡Es momento de interactuar con el contrato CryptoKitties!

Vamos a hacer una función que obtenga los genes desde el contrato:

1. Hacemos una función llamada `feedOnKitty`. Esta tomará 2 parámetros `uint`: `_zombieId` y `_kittyId`, y debe ser una función `public`.
2. La función debe primero declarar un `uint` llamado `kittyDna`.

   > *Nota de los autores: En nuestra `KittyInterface`, `genes` es un `uint256`, pero si tu recuerdas la lección 1, `uint` es un alias para `uint256`, ellos son la misma cosa*

3. La función debe entonces llamar la función `kittyContract.getKitty` con `_kittyId` y almacenar `genes` en `kittyDna`. Recuerda, `getKitty` retorna un montón de variables. (10 para ser exactos, soy buena onda, ¡los conté para ti!). Pero todo lo que nos importa es la última, `genes`. ¡Cuenta tus comas cuidadosamente!
4. Finalmente, la función debe llamar `feedAndMultiply`, y pasarle tanto `_zombieId` como `kittyDna`.

```sol
contract ZombieFeeding is ZombieFactory {
    ...
    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        uint kittyDna;
        (, , , , , , , , , kittyDna) = kittyContract.getKitty(_kittyId);
        feedAndMultiply(_zombieId, kittyDna);
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/12](https://cryptozombies.io/en/lesson/2/chapter/12)
