# Capítulo 5: Unidades de tiempo

La propiedad `level` se explica por si misma. Después, cuando nosotros creamos un sistema de batallas, los zombies que ganen más batallas aumentarán de nivel con el tiempo, y tendrá acceso a más habilidades.

La propiedad `readyTime` requiere un poco más de explicación. La meta es añadir un "periodo de recuperación", una cantidad de tiempo que un zombie tiene que esperar después de alimentarse o de atacar, antes de permitirle alimentarse o atacar de nuevo. Sin esto, el zombie podría atacar y multiplicarse 1,000 veces por día, lo que haría muy sencillo el juego.

Para poder hacer seguimiento al tiempo que un zombie debe esperar para atacar de nuevo, nosotros podemos usar las unidades de tiempo de Solidity.

## Unidades de Tiempo

Solidity provee algunas unidades nativas para lidiar con el tiempo.

La variable `now` retornara la marca de tiempo actual de Unix del último bloque (el número de segundo que han pasado desde Enero de 1970). El tiempo Unix al momento de escribir la lección era de `1515527488`.

> *Nota del autor: El tiempo Unix es tradicionalmente almacenado en un número de 32-bits. Esto conducirá al problema del "año 2038", cuando las marcas de tiempo de 32-bits se desborden y rompan muchos sistemas heredados. Entonces si queremos que nuestra DApp se mantenga corriendo 20 años desde ahora, nosotros podríamos usar un número de 64-bits, pero pero nuestros usuarios tendrán que gastar más gas para usar nuestra DApp durante ese tiempo. ¡Decisiones de Diseño!*

Solidity también contiene las unidades de tiempo `seconds`, `minutes`, `hours`, `days`, `weeks`, `years`. Estos serán convertidos a un `uint` del número de segundos en ese tiempo. Entonces `1 minutes`  es `60`, `1 hours` es `3600` (60 x 60 minutos), `1 days` es `86400` (24 horas x 60 minutos x 60 segundos), etc.

Aquí está un ejemplo de como las unidades de tiempo pueden ser usados:

```sol
uint lastUpdated;

// Asignar `lastUpdated` a `now`
function updateTimestamp() public {
    lastUpdated = now;
}

// Retornará `true` is 5 minutos han pasado desde que `updateTimestamp` ha sido llamado,
// `false` si no han pasado 5 minutos.
function fiveMinutesHavePassed() public view returns (bool) {
    return (now >= (lastUpdated + 5 minutes));
}
```

Podemos usar estas unidades de tiempo para la característica de `cooldown` de nuestros zombies.

## Ponte a prueba

Vamos a añadir el tiempo de recuperación para nuestra DApp, y hacer que nuestros zombies tengan que esperar 1 día después de atacar o alimentarse, para atacar de nuevo.

1. Declara un `uint` llamado `cooldownTime`, e igualalo a `1 days`. (Perdona la falta de ortografía, pero si tu pones `1 day` ¡No compilará!)
2. Ya que agregamos `level` y `readyTime` para nuestra estructura `Zombie` en el capítulo anterior, necesitamos actualizar `_createZombie()` para usar el número correcto de argumentos cuando creamos una nueva estructura `Zombie`.

   Actualiza la línea de código de `zombies.push()` para añadir 2 argumentos más: `1` (para `level`) y `uint32(now + cooldownTime)` (para `readyTime`).

> *Nota de los creadores: El `uint32(...)` es necesario porque `now` retorna un `uint256` por defecto. Entonces necesitamos convertirlo explícitamente a un `uint32`*

`now + cooldownTime` equivaldrá a la marca de tiempo actual de Unix (en segundos), sumado al número de segundos en 1 día, lo cual será equivalente a la marca de tiempo Unix de 1 día desde ahora. Luego podremos comparar si el `readyTime` del zombie es mayor que `now` para ver si suficiente tiempo ha pasado para usar el zombie de nuevo.

Implementaremos la funcionalidad para limitar las acciones basado en `readyTime` es el próximo capítulo.

```sol
contract ZombieFactory is Ownable {
    ...
    uint cooldownTime = 1 days;
    ...
    function _createZombie(string memory _name, uint _dna) internal {
        uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1;
        ...
    }
}
```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/5](https://cryptozombies.io/en/lesson/3/chapter/5)
