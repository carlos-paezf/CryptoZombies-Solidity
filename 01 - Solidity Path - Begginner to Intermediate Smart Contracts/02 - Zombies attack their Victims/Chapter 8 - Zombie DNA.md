# Capítulo 8: ADN Zombie

Vamos a terminar de escribir la función `feedAndMultiply`.

La formula para calcular un nuevo zombie es simple: el promedio entre el ADN de zombie que se está alimentando, con el ADN del objetivo. Por ejemplo:

```sol
function testDnaSplicing() public {
    uint zombieDna = 2222222222222222;
    uint targetDna = 4444444444444444;
    uint newZombieDna = (zombieDna + targetDna) / 2;
    // ^ será igual a 3333333333333333
}
```

Después haremos nuestra formula más complicada si así lo queremos, ya sea añadiendo aleatoriedad al nuevo ADN zombie, etc. Por ahora, vamos a mantenerlo simple, siempre podemos volver atrás más adelante.

## Ponlo a prueba

1. Primero necesitamos asegurarnos de que `_targetDna` no debe ser más largo de 16 dígitos. Para hacer esto, nosotros podemos configurar que `_targetDna` es igual a `_targetDna % dnaModulus` para solo tomar los últimos 16 dígitos.
2. Lo siguiente será que nuestra función declare un `uint` llamado `newDna`, y lo igualamos al promedio del ADN de `myZombie` y `_targetDna` (como en el ejemplo anterior).

   > *Nota de los creadores: Tu puedes acceder a las propiedades de `myZombie` usando `myZombie.name` y `myZombie.dna`*

3. Una vez nosotros tenemos el nuevo ADN, vamos a llamar a `_createZombie`. Tu puedes observar el tab de `zombiefactory.sol`, si tu olvidas cuales son los parámetros que la función necesita al momento de llamarse. Ten en cuenta que se requiere un nombre, vamos a dejar el nombre del nuevo zombie como `NoName` por ahora, nosotros podemos escribir una función para cambiar los nombres de los zombies más adelante.

> *Nota de los creadores: Para tu whizzes de Solidity, tu posiblemente notes un problema con nuestro código aquí. No te preocupes, vamos a arreglarlo en el próximo capítulo*

```sol
pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint newDna = (myZombie.dna + _targetDna) / 2;
        _createZombie("NoName", newDna);
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/8](https://cryptozombies.io/en/lesson/2/chapter/8)
