# Capitulo 1: Variables de Estado y Números Enteros

¡Buen trabajo! Ahora que nosotros hemos conseguido una capa para nuestro contrato, aprendamos como Solidity maneja las variables.

Las ***variables de estado*** (State variables) son almacenadas permanentemente en el almacenamiento del contrato. Esto significa que ellas son escritas en la blockchain de Ethereum. Piensa que es como escribirlo en una base de datos.

## Ejemplo

```sol
contract Example {
    // Esta variable se almacenara permanentemente en la blockchain
    uint myUnsignedInteger = 100;
}
```

En este contrato de ejemplo, nosotros creamos una `uint` llamada `myUnsignedInteger` y la seteamos a 100.

## Enteros sin signo: `uint`

El tipo de data `uint` es un entero sin signo, lo cual significa que **su valor no debe ser negativo**.  También tenemos el tipo `int`, el cual se usa para enteros con signo.

> *Nota de los autores*: En Solidity, `uint` es actualmente un alias para `uint256`, un entero sin signo de 256 bits. Tu puedes declarar uints com menos bits (`uint8`, `uint16`, `uint32`, etc...). Pero en general tu simplemente usa `uint` excepto en casos específicos, de los cuales hablaremos en próximas lecciones.

## Ponte a prueba

Nuestro ADN Zombi va a estar determinado por un número de 16 dígitos. Declara un `uint` llamado `dnaDigits`, y dale un valor de `16`.

```sol
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 25 de abril de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/3](https://cryptozombies.io/en/lesson/1/chapter/3)
