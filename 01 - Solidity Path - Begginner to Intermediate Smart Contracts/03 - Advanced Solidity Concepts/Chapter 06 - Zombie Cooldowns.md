# Capítulo 6: Tiempos de reutilización de los zombies

Ahora que tenemos la propiedad `readyTime` en nuestra estructura `Zombie`, vamos a ir al archivo `zombiefeeding.sol` e implementar un contador de recuperación.

Vamos a modificar nuestro `feedAndMultiply` de tal manera que:

1. Alimentar activa el tiempo de recuperación de un zombie, y ...
2. Los zombies no pueden alimentarse de gatitos hasta que su periodo de recuperación haya pasado.

Esto hará que los zombies no puedan alimentarse de una cantidad ilimitada de gatitos, y multiplicarse todos los días. En el futuro cuando añadamos la funcionalidad de batallas, haremos que atacar otros zombies también active el tiempo de recuperación.

Primero, vamos a definir algunas funciones de ayuda que nos permitan configurar y verificar la propiedad `readyTime` del zombie.

## Pasando estructuras como argumentos

Tu puedes pasar un puntero de almacenamiento a una estructura como un argumento a una función `private` o `internal`. Esto es útil, por ejemplo, para pasar nuestra estructura Zombie entre funciones.

La sintaxis luce como la siguiente:

```sol
function _doStuff(Zombie storage _zombie) internal {
    // Hacer algo con _zombie
}
```

De esta manera podemos pasar una referencia a nuestro zombie a una función, en lugar de pasar un ID de zombie y buscarla.

## Ponlo a prueba

1. Inicia definiendo una función `_triggerCooldown`. Esta tomará 1 argumento, `_zombie`, un puntero a `Zombie storage`. La función debe ser `internal`.
2. El cuerpo de la función debe asignar `_zombie.readyTime` a `uint32(now + cooldownTime)`.
3. Lo siguiente, es crear una función llamada `_isReady`. Esta función también tomará un argumento `Zombie storage` llamado `_zombie`. Será una función `internal view`, y retorna un `bool`.
4. El cuerpo de la función debe retornar `(_zombie.readyTime <= now)`, el cual evalúa como `true` o `false`. Esta función nos dirá si suficiente tiempo ha pasado desde la última vez que el zombie se alimento.

```sol

```

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/6](https://cryptozombies.io/en/lesson/3/chapter/6)
