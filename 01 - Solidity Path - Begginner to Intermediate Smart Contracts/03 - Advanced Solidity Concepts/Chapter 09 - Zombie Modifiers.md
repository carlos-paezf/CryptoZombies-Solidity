# Capítulo 9: Modificador de zombies

Ahora vamos a usar nuestro modificador `aboveLevel` para crear algunas funciones.

Nuestro juego tendrá algunos incentivos para las personas que aumenten el nivel de sus zombies.

- Para zombies de nivel 2 o superior, los usuarios tendrán la disponibilidad de cambiar sus nombres.
- Oara zombies de nivel 20 o superior, los usuarios tendrán la disponibilidad de obtener su ADN personalizado.

Implementaremos estas funciones abajo. Aquí tenemos el ejemplo de código de la lección anterior para referencia:

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

## Ponte a prueba

1. Crear una función llamada `changeName`. Esta tomará 2 argumentos: `_zombieId` (un `uint`), y `_newName` (un `string` con la locación de la data asignada a `calldata`), y hacerla `external`. Esta debe tener el modificador `aboveLevel`, y debe pasar un `2` para el parámetro `_level`. (No olvides pasar también el `_zombieId`).

   > *Nota de los editores: `calldata` es alguna manera similar a `memory`, pero solo está disponible para funciones `external`*

2. En esta función, primero necesitamos verificar que `msg.sender` es igual a `zombieToOwner[_zombieId]`. Usa una sentencia `require`.
3. La función debe asignar `zombies[_zombieId].name` igual a `_newName`.
4. Crear otra función llamada `changeDna` debajo de `changeName`. Esta definirá y contendrá algo similar a `changeName`, excepto que el segundo argumento será `_newDna` (un `uint`), y deberá pasar un `20` para el parámetro `_level` en `aboveLevel`. Y por supuesto, debe asignar el `dna` zombie para `_newDna` en logar de establecer el nombre del zombie.

```sol
contract ZombieHelper is ZombieFeeding {
    ...
    function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].name = _newName;
    }

    function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
        require(msg.sender == zombieToOwner[_zombieId]);
        zombies[_zombieId].dna = _newDna;
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/9](https://cryptozombies.io/en/lesson/3/chapter/9)
