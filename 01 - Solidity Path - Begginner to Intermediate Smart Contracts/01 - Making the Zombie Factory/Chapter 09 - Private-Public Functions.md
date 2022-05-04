# Capitulo 09 - Funciones Privadas y Públicas

En Solidity, las funciones son `public` por defecto. Esto significa que cualquiera (o cualquier otro contrato), puede llamar las función de tu contrato y ejecutar este código.

Obviamente, esto no siempre es lo deseable, y esto puede hacer que tu contrato sea vulnerable a ataques. Una buena práctica es marcar tus funciones como `private` por defecto, y esto hará que solo las funciones de tipo `public` estén expuestas al mundo.

Observemos como se declara una función privada:

```sol
uint[] numbers;

function _addToArray(uint _number) private {
    numbers.push(_number);
}
```

Esto significa que solo otras funciones que están asociadas a nuestro contrato, puedan llamar este método para poder añadir elementos al arreglo `numbers`;

Como tu puedes ver, nosotros usamos la palabra reservada `private` después del nombre de la función. Y como los parámetros de la función, usamos la convención de inicio, es decir un underscore (`_`) antes del nombre de la función.

## Ponte a Prueba

Nuestra función `createZombie` es pública por defecto actualmente, esto significa que ¡cualquiera podría llamarla y crear un nuevo Zombie en nuestro contrato! Vamos a hacerla privada.

1. Modificar `createZombie` para hacerla una función privada. ¡No olvides la convención del nombre!

```sol
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie (string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Mayo de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/9](https://cryptozombies.io/en/lesson/1/chapter/9)
