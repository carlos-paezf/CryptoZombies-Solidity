# Capítulo 2: Contratos de Propiedad

¿Descubriste el agujero de seguridad en el capítulo anterior?

¡`setKittyContractAddress` es `external`, entonces cualquiera puede llamarlo! Esto significa que cualquiera que llame la función podría cambiar la dirección del contrato CryptoKitties, y romper nuestra aplicación para todos los usuarios.

Queremos la posibilidad de actualizar la dirección de nuestro contrato, pero no queremos que cualquiera este disponible para hacerlo.

Para manejar casos como estos, una práctica común que ha surgido es hacer contratos de `Ownable`, lo que significa que ellos tienen un dueño (tu), quien tiene privilegios especiales.

## Contrato `Ownable` de OpenZeppelin

Abajo está el contrato de propiedad tomado de la librería de Solidity **OpenZeppelin**. OpenZeppelin es una librería de contratos inteligentes seguros y examinados por la comunidad que tu puedes usar en tus DApps. Después de esta lección, nosotros recomendamos que revises su sitio para continuar con tu aprendizaje.

Lee todo el contrato a continuación. Tu vas a ver algunas cosas que no hemos aprendido, pero no te preocupes, vamos a hablar de ello luego.

```sol
/**
 * @title Ownable
 * @dev El contrato de propiedad tiene una dirección del propietario, y provee funciones de control de
 * autorización básica, que simplifican la implementación de los permisos de usuario.
 */
contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev El constructor Ownable configura el dueño original del contrato
     * para la cuenta remitente
     */
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @return the address of the owner
     */
    function owner() public view returns(address) {
        return _owner;
    }

    /**
     * @dev se arroja si se llama por cualquier cuenta que no sea el propietario
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true si `msg.sender` es el dueño del contrato
     */
    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Le permite al dueño actual renunciar al control del contrato.
     * @notice Renunciar a la propiedad del contrato lo dejara sin un dueño
     * No será posible llamar más a las funciones con el modificador `onlyOwner`
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    } 

    /**
     * @dev Le permite al dueño actual transferir el control del contrato al nuevo dueño.
     * @param newOwner La dirección a la que se transfiere la propiedad.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfiere el control del contrato a un newOwner.
     * @param newOwner La dirección a la que se transfiere la propiedad.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
```

Unas pocas cosas nuevas que nos hemos visto antes:

- Constructor: `constructor()` es un constructor, el cual es una función especial opcional que tiene el mismo nombre que el contrato. Se ejecutara solo una vez, cuando el contrato es creado por primera vez.
- Modificadores de función: `modifier onlyOwner()`. Los modificadores son un tipo de semi-funciones que son usados para modificar otras funciones, usualmente para verificar la prioridad de ejecución de algunos requerimientos. En este caso, `onlyOwner` puede ser usado para limitar el acceso de **solo** el **dueño** del contrato puede correr está función. Hablaremos más acerca de modificadores de función en el siguiente capitulo, y lo que el extraño `_;` hace.
- Palabra clave `indexed`: No te preocupes por este, no lo necesitamos aún.

Entonces el contrato de `Ownable` básicamente hace lo siguiente:

1. Cuando un contrato es creado, su constructor establece como `owner` al `msg.sender` (la persona que lo despliega).
2. Agrega un modificador `onlyOwner`, el cual puede restringir el acceso a ciertas funciones solo al propietario.
3. Te permite transferir el contrato a un nuevo `owner`.

`onlyOwner` es tan común en los requerimientos de contratos que la mayoría de Solidity DApps inician con un copy/paste de este contrato `Ownable`, y entonces el primer contrato hereda del este.

Como queremos limitar `setKittyContractAddress` a `onlyOwner`, vamos a hacer lo mismo para nuestro contrato.

## Ponlo a prueba

Vamos a continuar copiando el código del contrato `Ownable` dentro de un nuevo archivo, `ownable.sol`. Luego haremos que `ZombieFactory` herede de este.

1. Modifica nuestro código para importar el contenido de `ownable.sol`. Si tu no recuerdas como hacer esto, mira `zombiefeeding.sol`.
2. Modifica el contrato `ZombieFactory` para heredar de `Ownable`. De nuevo, tu puedes mirar el archivo `zombifeeding.sol` si no recuerdas como se hace.

```sol
import "./ownable.sol";


contract ZombieFactory is Ownable { ... }
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/2](https://cryptozombies.io/en/lesson/3/chapter/2)
