# Capítulo 7: Almacenamiento vs Memory (Ubicación de la información)

En Solidity, hay dos ubicaciones en las que puedes almacenar variables: en `storage` y en `memory`.

`Storage` se refiere a las variables almacenadas permanentemente en el blockchain. Las variables en `Memory` son temporales, y son borradas entre llamadas a funciones externas de tu contrato. Piensa en esto como el disco duro de tu computados vs la RAM.

La mayoría de veces tu no necesitas usar estas palabras reservadas, por qué Solidity las maneja por defecto. Las variables de estado (variables declaradas fuera de las funciones) son por defecto `storage` y se escriben permanentemente en el blockchain, mientras que las variables declaras dentro de las funciones son `memory` y desaparecerán cuan las funciones terminen de ser llamadas.

Sin embargo, habrán ocasiones en las que necesites usas dichas palabras reservadas, es decir cuando se trata de estructuras y matrices dentro de funciones:

```sol
contract SandwirchFactory {
    struct Sandwich {
        string name;
        string status;
    }

    Sandwich[] sandwiches;

    function eatSandwich(uint _index) public {
        // Sandwich mySandwich = sandwiches[_index];
        // ^ Parece muy sencillo, pero Solidity arrojará una advertencia
        // diciéndote que tu debes declarar explícitamente `storage` o `memory` aquí.

        // Así que en su lugar, debe declarar con la palabra clave `storage` de la siguiente manera:
        Sandwich storage mySandwich = sandwiches[_index];
        // ... en tal caso `mySandwiches` es un puntero a `sandwiches[_index]` en almacenamiento, y ...
        mySandwich.status = "Eaten!";
        // ... este cambiara permanentemente `sandwiches[_index]` en el blockchain.

        // Si tu quieres una copia, tu puedes usar `memory`:
        Sandwich memory anotherSandwich = sandwiches[_index + 1];
        // ... en tal caso `anotherSandwich` será simplemente una copia de
        // la data en memoria, y ...
        anotherSandwich.status = "Eaten!";
        // ... modificará la variable temporal y no tendrá efecto
        // en `sandwiches[_index + 1]`. Pero tu puedes hacer esto:
        sandwiches[_index + 1] = anotherSandwich;
        // ... si tu quieres una copia de los cambios dentro del almacenamiento del blockchain. 
    }
}
```

No te preocupes si tu no entiendes completamente cuando usar cada uno, a lo largo de este tutorial te diremos cuando usar `storage` y cuando usar `memory`, y el compilador de Solidity te dará advertencias que te harán saber cuando debes usar cada una de las palabras clave.

Por ahora, esto es suficiente para entender cuales son los casos en los que necesitas declarar específicamente `storage` y `memory`.

## Ponte a prueba

¡Es tiempo de darle a nuestro zombies la habilidad de alimentarse y multiplicarse!

Cuando un zombie se alimenta de otra forma de vida, su ADN se combinara con el ADN de la otra forma de vida para crear un nuevo zombie.

1. Crear una función llamada `feedAndMultiply`. Esta tomará 2 parámetros: `_zombieId` (un `uint`) y `_targetDna` (también un `uint`). Esta función debe ser `public`.
2. ¡Nosotros no queremos que dejar que otra persona alimente nuestro zombie! Entonces lo primero, es asegurarnos de la propiedad del zombie. Añadimos un sentencia `require` para verificar que `msg.sender` es igual al dueño del zombie (similar a como nosotros hicimos en la función `createRandomZombie`).

   > *Nota de los creadores: De nuevo, al ser primitivo nuestro verificador de respuesta, esperamos que `msg.sender` sea enviado primero y se marcará como erróneo si cambias el orden. Pero normalmente cuando tu estás codificando, tu puedes usar el orden que tu prefieras, ambos son correctos*

3. Vamos a necesitar obtener el ADN del zombie. Por lo tanto, la próxima cosa que nuestra función debe hacer es declarar un `Zombie` local llamado `myZombie` (el cuál será un puntero `storage`). Haceos que está variables sea igual al indice `_zombieId` en nuestro arreglo `zombies`.

Tu solo debes tener 4 líneas de código por mucho, incluyendo la línea que cierra con `}`.

¡Continuaremos desarrollando esta función en el próximo capítulo!

```sol
pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/7](https://cryptozombies.io/en/lesson/2/chapter/7)
