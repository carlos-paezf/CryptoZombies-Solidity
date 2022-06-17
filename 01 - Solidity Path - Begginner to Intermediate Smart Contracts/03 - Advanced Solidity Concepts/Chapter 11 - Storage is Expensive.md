# Capítulo 11: El almacenamiento es costoso

Una de las operaciones más costosas en Solidity es el uso de `storage`, en especial la escritura.

Esto se debe a que cada vez que tu escribes o cambias una pieza de información, esta se escribe permanentemente en la blockchain. ¡Por siempre! Miles de nodos a través de ese mundo necesitan almacenar la información en sus discos duros, y esta cantidad de data se mantiene en crecimiento a la vez que el blockchain crece. Es por eso que hay un costo por hacerlo.

Con el fin de mantener los costos bajos, debes evitar escribir datos en el almacenamiento, excepto cuando es necesario. A veces esto implica una lógica de programación aparentemente ineficiente, como reconstruir un arreglo en `memory` cada vez que la función es llamada, en lugar de simplemente guardar el arreglo en una variable para búsquedas rápidas.

En la mayoría de los lenguajes de programación, recorrer grandes conjuntos de datos es costoso. Pero en Solidity, esta manera es más barata que usar `storage` si está en una función `external view`, ya que las funciones `view` no le cuestan a tus usuarios ningún gas. (¡Y el gas el cuesta dinero real a tus usuarios!).

Vamos a repasar los ciclos `for` en el siguiente capítulo, pero primero, vamos a ver como declarar arreglos en memoria.

## Declarando arreglos en memoria

Tu puedes usar la palabra reservada `memory` con arreglos para crear un nuevo arreglo dentro de una función sin necesidad de escribir ninguna cosa en el almacenamiento. El arreglo solo existe hasta el final del llamado de la función, y esto mucho más barato en términos de gas en comparación a actualizar un arreglo en `storage`, es gratis si es una función `view` llamada externamente.

Veamos como declarar un arreglo en memoria:

```sol
function getArray() external pure returns(uint[] memory) {
    // Instanciar un nuevo arreglo en memoria con un tamaño de 3
    uint[] memory values = new uint[](3);

    // Poner algún valor dentro
    values[0] = 1;
    values[1] = 2;
    values[2] = 3;

    return values;
}
```

Este es un ejemplo trivial que muestra la sintaxis, pero en el siguiente capítulo vamos a mirar como combinarlo con el bucle `for` para casos de uso reales.

> *Nota de los autores: Los arreglos en `memory` deben ser creados con un tamaño de argumentos (en este ejemplo, 3). Actualmente no pueden cambiar de tamaño como los arreglos en `storage` que lo hacen con `array.push()`, a pesar de que esta manera puede ser cambiado en versions futuras de Solidity.*

## Ponte a prueba

En nuestra función `getZombiesByOwner`, queremos retornar un arreglo de `unit[]` con todos los zombies que posee un usuario en particular.

1. Declara una variable `uint[] memory` llamada `result`
2. Configura que sea igual a un nuevo arreglo `uint`. El tamaño del arreglo debe ser la cantidad de zombies que posee este `_owner`, que podemos buscar en nuestro mapeo con `ownerZombiesCount[_owner]`.
3. Al final la función retorna `result`. Este es un arreglo vacío justo ahora, pero en el siguiente capítulo la completaremos.

```sol
contract ZombieHelper is ZombieFeeding {
    ...
    function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
        uint[] memory result = new uint[](ownerZombieCount[_owner]);
        return result;
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/11](https://cryptozombies.io/en/lesson/3/chapter/11)
