# Capitulo 5: Herencia

Nuestro juego se está haciendo un poco largo. En lugar de hacer un contrato muy largo, algunas veces es más sensato separar nuestro código en múltiples contratos para organizar el código.

Una característica de Solidity para hacerlo más manejable es con la *herencia* de contrato:

```sol
contract Doge {
    function catchphrase() public returns (string memory) {
        return "So Wow CryptoDoge";
    }
}

contract BabyDoge is Doge {
    function anotherCatchphrase() public returns (string memory) {
        return "Such Moon BabyDoge";
    }
}
```

`BabyDoge` *hereda* de `Doge`. Esto significa que si tu compilas y despliegas `BabyDoge`, este tendrá acceso a ambos métodos: `catchphrase()` y `anotherCatchphrase()` (y cualquier otra función pública que se defina dentro de `Doge`).

Esto puede ser para herencia lógica (como para una subclase, un `Cat` es un `Animal`). Pero esto también puede ser usado simplemente para organizar tu código al agrupar lógica similar junta dentro de diferentes contratos.

## Ponlo a prueba

En siguientes capítulos, vamos a implementar la funcionalidad de nuestros zombies para alimentarlos y multiplicarlos.Vamos a poner esta lógica dentro de su propio contrato que herede todos los métodos desde `ZombieFactory`.

1. Hacer un contrato llamado `ZombieFeeding` a continuación de `ZombieFactory`. Este contrato debe heredar de nuestro contrato `ZombieFactory`.

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory { ... }

contract ZombieFeeding is ZombieFactory { }
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/5](https://cryptozombies.io/en/lesson/2/chapter/5)
