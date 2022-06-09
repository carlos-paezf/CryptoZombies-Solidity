# Capitulo 3: Msg.sender

Ahora que nosotros tenemos nuestras asignaciones para mantener las pistas de quienes se adueña de un zombie, queremos actualizar el método `_createZombie` que ellos usen.

Teniendo en cuenta esto, necesitamos usar algo llamado `msg.sender`.

## `msg.sender`

En Solidity, existen ciertas variables globales que están disponibles para todas las funciones. Uno de esos es `msg.sender`, el cual referencia el `address` de la persona (o del contrato), que llame la función actual.

> *Nota de los editores: En solidity, la ejecución de las funciones siempre necesitan iniciar con un llamado externo. Un contrato simplemente permanecerá en la cadena de bloques sin hacer nada hasta que alguien llame a una de sus funciones. Asi que siempre habrá un `msg.sender`*

Aquí esta un ejemplo del uso de `msg.sender` y actualización de un `mapping`:

```sol
mapping (address => uint) favoriteNumber;

function setMyNumber(uint _myNumber) public {
    // Actualizar nuestra asignación `favoriteNumber` para almacenar `_myNumber` bajo `msg.sender`
    favoriteNumber[msg.sender] = _myNumber;
    // ^ La sintaxis para almacenar data en una asignación es justo como con arreglos
}

function whatIsMyNumber() public view returns (uint) {
    // Recuperar el valor almacenado en la dirección de envío
    // Será `0` si el remitente aún no ha llamado a `setMyNumber`
    return favoriteNumber[msg.sender];
}
```

En este trivial ejemplo, cualquiera puede llamar a `setMyNumber` y almacenar un `uint` en nuestro contrato, el cual podría estar a su dirección. Entonces cuando ellos llaman `whatIsMyNumber`, ellos podrían estar retornando el `uint` que almacenan.

Usando `msg.sender` obtienes la seguridad de la cadena de bloques de Ethereum. La única manera de que alguien pueda modificar la información de otra persona, podría ser robando la llave secreta asociada con la dirección de Ethereum.

## Ponte a prueba

Vamos a actualizar nuestro método `_createZombie` de la lección 1 para asignar el propietario del zombie cada que se llame la función.

1. Primero, después de obtener de el `id` del nuevo zombie, vamos a actualizar nuestra asignación `zombieToOwner` para almacenar `msg.sender` bajo el `id`.
2. Segundo, vamos a incrementar `ownerZombieCount` para este `msg.sender`.

En Solidity, tu puedes incrementar un `uint` con `++`, tal cual como en JavaScript:

```sol
uint number = 0:
number++;
// `number` es ahora `1`
```

La respuesta final de este capitulo debe ser 2 líneas de código.

```sol
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    ...
    function _createZombie(string memory _name, uint _dna) private {
        ...
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
    }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/2/chapter/3](https://cryptozombies.io/en/lesson/2/chapter/3)
