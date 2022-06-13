# Capítulo 4: Gas

¡Genial! Ahora sabemos como actualizar porciones clave de la DApp mientras prevenimos que otros usuarios interfieran con nuestro contratos.

Vamos a ver otra manera en la que Solidity es diferente a otros lenguajes de programación.

## Gas, el combustible en el que las DApps de Ethereum corren

En Solidity, tus usuarios tienen que pagar cada vez que se ejecuta una función en tu DApp usando una moneda llamada **gas**. Los usuarios compran gas con Ether (la moneda en Ethereum), entonces tus usuarios tienen que gastar ETH con el fin de ejecutar funciones en tu DApp.

La cantidad de gas necesaria para ejecutar una función depende de que tan compleja es la lógica de la función. Cada operación individual tienen un **costo de gas** basado aproximadamente en cuantos recursos computaciones se requieren para llevar a cabo la operación (ejemplo, escribir en el almacenamiento es mucho más costoso que sumar 2 enteros). El total del **costo de gas** de tu función, es la suma del costo de gas de todas las operaciones individuales.

Ya que la ejecución de las funciones generan un costo real para tus usuarios, la optimización del código es mucho más importante en Ethereum que en otros lenguajes de programación. Si tu código es descuidado, tus usuarios van a tener que pagar un costo alto para ejecutar tus funciones, y esto podría sumar millones de dólares en costos innecesarios para miles de usuarios.

## ¿Por qué es necesario el gas?

Ethereum es como un grande y lento, pero extremadamente seguro computador. Cuando tu ejecutas una función, cada nodo individual en la red necesita ejecutar la misma función para verificar su salida. Miles de nodos verifican la ejecución de cada función, y esto es lo que hace que Ethereum sea descentralizado y sus datos sean inmutables y resistentes a la censura.

Los creadores de Ethereum querían asegurarse de que nadie pudiera obstruir la red con un loop infinito, o acaparar todos los recursos de red con calculo realmente intensos. Entonces ellos hicieron que las transacciones no fueran gratuitas, y los usuarios tuvieran que pagar por tiempo de computación como por almacenamiento.

> *Nota de los autores: Esto no es necesariamente cierto para otros blockchain, como la que los autores de CryptoZombies están construyendo en Loom Network. Probablemente nunca tenga sentido ejecutar un juego como World of Warcraft directamente en la red principal de Ethereum. El costo de gas sería prohibitivamente costoso. Pero podría correr en un blockchain con un algoritmo de consenso diferente. Vamos a hablar más acerca de que tipos de DApps tu podrías desplegar en Loom vs la red principal de Ethereum, en una próxima lección.*

## Embalaje estructural para guardar gas

En la lección 1, nosotros mencionamos que hay otros tipos de `uint`: `uint8`, `uint16`, `uint32`, etc.

Normalmente no hay ningún beneficio en el uso de los subtipos, porque Solidity reserva 256 bits de almacenamiento sin importar el tamaño de `uint`. Por ejemplo, usando `uint8` en vez de `uint` (`uint256`), no te ahorrará gas.

Pero hay una excepción a esto: Dentro de `struct`s.

Si tu tienes múltiples `uint` dentro de un `struct`, usando un tamaño de `uint` menor cuando sea posible, le permitirá a Solidity empaquetar esas variables juntas para ocupar menos espacio. Por ejemplo:

```sol
struct NormalStruct {
    uint a;
    uint b;
    uint c;
}

struct MiniMe {
    uint32 a;
    uint32 b;
    uint c;
}

// `mini` costará menos gas que `normal`, por el empaquetado de la estructura
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30);
```

Por esta razón, dentro de un `struct` tu queras usar los subtipos de enteros más pequeños para conseguir salirte con la tuya.

Tu también queras agrupar tipos de datos idénticos (es decir, ponerlos uno al lado del otro en la estructura), permitiendo que Solidity pueda minimizar el espacio de almacenamiento requerido. Por ejemplo, una estructura con campos `uint c; uint32 a; uint32 b;` costará menos gas que una estructura con campos `uint32 a; uint c; uint32 b;`, porque los campos `uint32` están agrupados juntos.

## Ponte a prueba

En esta lección, vamos a añadir 2 características nuevas para nuestros zombies: `level` y `readyTime`, este último lo usaremos para implementar un temporizador de enfriamiento para limitar la frecuencia con la que un zombie puede alimentarse.

Vamos a ir al archivo `zombiesfactory.sol`:

1. Añadimos 2 propiedades más al struct `Zombie`: `level` (un `uint32`), y `readyTime` (también un `uint32`). Queremos agrupar este tipo de datos juntos, por lo que vamos a ponerlos al final de la estructura.

32 bits es más que suficiente para mantener el nivel del zombie y su marca de tiempo, lo que nos ahorrará algunos costos de gas al empaquetar los datos de una forma más ajustada que usando un `uint` regular (256-bits).

```sol
contract ZombieFactory is Ownable {
    ...
    struct Zombie {
        ...
        uint32 level;
        uint32 readyTime;
    }
    ...
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/4](https://cryptozombies.io/en/lesson/3/chapter/4)
