# Capitulo 12: Juntándolo todo

¡Estamos cerca de terminar nuestro generador aleatorio de Zombis! Vamos a crear una función pública que una todo.

Vamos a crear una función pública que toma por entrada el nombre del zombie, y lo usamos para crear un zombie con ADN random.

## Ponte a prueba

1. Crear una función pública llamada `createRandomZombie`. Esta tomará un parámetro llamado `_name` (un `string` con la data localizada en `memory`). (*Nota: Declara esta función `public` justo como declaraste las anteriores funciones `private`*)
2. La primera línea de la función deberá correr la función `_generateRandomDna` en base al `_name`, y almacenarlo en un `uint` llamado `randDna`.
3. La segunda línea debe correr la función `_createZombie` y pasarle el `_name` y `randDna`.
4. La solución debe ser 4 líneas de código (incluido el `}` qye cierra la función).

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 02 de Junio de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/12](https://cryptozombies.io/en/lesson/1/chapter/12)
