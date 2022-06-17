# Capítulo 10: Ahorrando Gas con funciones 'View'

¡Increíble! Ahora tenemos algunas habilidades especiales para zombies de alto nivel, que pueden obtener los propietarios como incentivo cuando suben de nivel. Podemos añadir más después si así lo queremos.

Vamos a añadir una función más: nuestra DApp necesita un método para visualizar el nombre entero de la armada zombie de un usuario, y lo vamos a llamar `getZombiesByOwner`.

Esta función solo necesita leer la data desde el blockchain, entonces podemos hacer que esta función sea `view`. Lo cual nos lleva a un tema más importante cuando hablamos de optimización de gas:

## Las funciones view no consumen gas

Las funciones `view` no consumen ningún gas cunado son llamadas externamente por un usuario.

Esto es porque las funciones `view` actualmente no cambian nada dentro del blockchain, solo leen la data. Entonces, marcar una función con `view` le dice a `web3.js` que solo necesita consultar tu nodo local Ethereum para correr la función, y en realidad no tiene que crear una transacción en la blockchain (lo cual necesitaría correr en cada nodo y consumir gas).

Cubriremos la configuración de web3.js con nuestro nodo siguiente. Pero por ahora la gran conclusión es que tu puedes optimizar el uso de gas de tu DApp para tus usuarios mediante el uso de funciones `external view` siempre que sea posible.

> *Nota del autor: Si una función `view` es llamada internamente por otra función en el mismo contrato que no sea una función `view`, se mantendrá el costo de gas. Esto es porque la otra función crea una transacción en Ethereum, y se mantiene la verificación por cada nodo. Entonces las funciones `view` solo son gratuitas cuando se llaman externamente*.

## Ponte a prueba

Vamos a implementar una función que retorne un armada de zombies enteros de un usuario. Podemos llamar después esta función desde `web3.js` si queremos mostrar una página de perfil de usuario con la armada entera.

La lógica de esta función es un poco complicada por lo que tomaremos algunos capítulos para implementarla:

1. Crea una nueva función llamada `getZombiesByOwner`. Esta tomará un argumento, un `address` llamado `_owner`.
2. Vamos a hacer que la función sea `external view`, entonces podemos llamarla dentro `web3.js` sin necesidad de gas.
3. La función necesita retornar un `uint[]` (un arreglo de `uint`) con una locación de data `memory`.

Dejamos el cuerpo de la función vacío por ahora, vamos a llenarla en el siguiente capítulo.

```sol
contract ZombieHelper is ZombieFeeding {
    ...
    function getZombiesByOwner(address _owner) external view returns (uint[] memory) { }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/10](https://cryptozombies.io/en/lesson/3/chapter/10)
