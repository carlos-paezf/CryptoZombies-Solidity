# Capitulo 13: Eventos

¡Nuestro contrato está finalmente terminado! Ahora vamos a añadir un `event`.

Los eventos son una manera de que tu contrato se comunique con algo que está pasando en la blockchain de tu aplicación frontend, lo cual puede ser escuchada por ciertos eventos y tomar una acción cuando ellos ocurren.

Ejemplo:

```sol
// declarar el evento
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
    uint result = _x + _y;
    // disparar un evento que le permita a la aplicación saber que la función fue llamada:
    emit IntegersAdded(_x, _y, result);
    return result;
}
```

Tu app frontend debe escuchar entonces este evento. Una implementación de JavaScript podría lucir como la siguiente:

```js
YourContract.IntegersAdded(function (error, result) {
    // Hacer algo con el resultado
})
```

## Ponte a prueba

Nosotros queremos un evento que le permita a nuestro frontend saber cada que un nuevo zombie ha sido creado, entonces nuestra app podrá mostrarlo.

1. Declarar un `event` llamado `NewZombie`. Este debe pasar `zombieId` (un `uint`), `name` (a `string`), y `dna` (un `uint`).
2. Modificar la función `_createZombie` para que dispare el evento `NewZombie` después de añadir el nuevo zombie a nuestro arreglo `zombies`.
3. Tu vas a necesitar el `id` del zombie. `array.push()` retorna un `uint` del nuevo tamaño del array - y la posición del primer item en un array tiene indice `0`, con `array.push() - 1` vamos a obtener el indice del zombie que acabamos de añadir. Almacenar el resultado de `zombies.push() - 1`en un `uint` llamado `id`, entonces tu puedes usarlo en el evento `NewZombie` en la siguiente línea.

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
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

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 02 de Junio de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/13](https://cryptozombies.io/en/lesson/1/chapter/13)
