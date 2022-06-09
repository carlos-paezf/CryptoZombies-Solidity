# Capitulo 2: Asignaciones y Direcciones

Vamos a hacer nuestro juego multijugador al asignarle a los Zombies de nuestra base de datos un dueño.

Para hacer esto, nosotros necesitaremos 2 tipos de datos nuevos: `mapping` y `address`.

## Addresses: Direcciones

El blockchain Ethereum está hecho en base de cuentas, las cuales puedes imaginar cómo cuentas de banco. Una cuenta tiene un balance de ***Ether*** (la moneda usada en la cadena de bloques de Ethereum), y tu puedes enviar y recibir pagos de Ether desde otras cuentas, tal cómo una cuenta de banco puede transferir dinero hacia otras cuentas de banco.

Cada cuenta tiene una **dirección**, la cual tu puedes imaginar como el número de una cuenta de banco. Este es un identificador único que apunta a la cuenta, y luce así:

```txt
0x0cE446255506E92DF41614C46F1d6df9Cc969183
```

(Esta dirección pertenece al team de CryptoZombies)

Entraremos en el meollo de las direcciones en una lección posterior, pero por ahora tu solo necesitas entender que una dirección pertenece a un usuario especifico (o un contrato especifico).

Entonces nosotros podemos usar ese único ID para apoderar nuestros zombies. Cuando un usuario crea nuevos zombies para interactuar nuestra app, vamos a configurar la propiedad de estos zombies para que la dirección de Ethereum sea llamada por la función.

## Mappings: Asignaciones

En la lección 1 nosotros miramos los `structs` y los `arrays`. `Mappings` son otra manera de almacenar data organizada en Solidity.

La definición de un `mapping` luce así:

```sol
// Para una app financiada, almacenamos un uint que maneje el balance de la cuenta del usuario:
mapping (address => uint) public accountBalance;

// O podríamos los nombres de usuarios almacenados basados en userId
mapping (uint => string) userIdToName;
```

Una asignación es esencialmente un almacenamiento de clave-valor para almacenar y buscar data. En el primer ejemplo, la llave es una `address` y el valor es un `uint`, y en el segundo ejemplo la llave es un `uint` y el valor es un `string`.

## Ponte a prueba

Para almacenar la propiedad Zombie, nosotros vamos a usar 2 asignaciones: una para almacenar la pista de la dirección que apropian de un zombie, y otro que almacene la pista de cuantos zombies tiene un propietario:

1. Crear una asignación llamada `zombieToOwner`. La llave será un `uint` (vamos a almacenar y buscar en base de su id), y el valor un `address`. Vamos a hacer que la asignación sea `public`.
2. Crear una asignación llamada `ownerZombieCount`, donde la llave es un `address` y el valor un `uint`.

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    ...
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;
    ...
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/2](https://cryptozombies.io/en/lesson/2/chapter/2)
