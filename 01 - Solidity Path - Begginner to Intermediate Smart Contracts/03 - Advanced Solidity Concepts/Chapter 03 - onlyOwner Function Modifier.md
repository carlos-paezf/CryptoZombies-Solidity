# Capítulo 3: Modificador de función `onlyOwner`

Ahora que nuestro contrato base `ZombieFactory` hereda de `Ownable`, nosotros podemos usar el modificador de función `onlyOwner` en `ZombieFeeding` también.

Esto se debe a como la herencia del contrato funciona. Recuerda:

```sol
ZombieFeeding is ZombieFactory
ZombieFactory is Ownable
```

De este modo, `ZombieFeeding` es también `Ownable`, y puede acceder a las funciones, eventos y modificadores del contrato `Ownable`. Esto aplica también a cualquier contrato que herede de `ZombieFeeding` en el futuro.

## Modificadores de Función

Un modificador de función luce justo como una función, pero usa la palabra reservada `function`. Y esto no puede ser llamada como una función si puede, en cambio, nosotros podemos adjuntar el modificador del nombre al final de la definición de la función para cambiar el comportamiento de la función.

Echemos un vistazo más de cerca a `onlyOwner`:

```sol
pragma solidity >=0.5.0 <0.6.0;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @return the address of the owner.
     */
    function owner() public view returns(address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
```

Note el modificador `onlyOwner` en la función `renounceOwnership`. Cuando tu llamas `renounceOwnership`, el código dentro de `onlyOwner` se ejecuta primero. Luego cuando toca le toca a la declaración `_;` en `onlyOwner`, regresa y ejecuta el código dentro de `renounceOwnership`.

Entonces, si bien hay otras maneras en las que tu puedes usar modificadores, uno de los casos de uso más comunes añadir una verificación rápida `require` antes de que se ejecute una función.

En el caso de `onlyOwner`, añadiendo este modificador a la función hace que solo el dueño del contrato (tu, si tu lo despliegas) puede llamar la función.

> *Nota de los creadores: A menudo es necesario otorgar al propietario poderes especiales sobre el contrato como este, pero también podría usarse maliciosamente. Por ejemplo, el dueño podría añadir una función de puerta trasera que le permitiría transferir cualquier zombie a si mismo.*
>
> *Entonces es importante recordar que, el hecho de que una DApp esté en Ethereum no significa que automáticamente esté descentralizada, tu tienes actualmente que leer todo el código fuente para asegurarte de que no tenga controles especiales por parte del propietario de los que deba preocuparse. Hay un balance cuidadoso entre el desarrollador y control de mantenimiento dobre una DApp, de modo que puedas arreglar bugs potenciales, y crear una plataforma sin propietario en la que sus usuarios pueden confiar para proteger sus datos.*

## Ponlo a prueba

Ahora nosotros podemos restringir el acceso a `setKittyContractAddress` para que nadie más que nosotros pueda modificarlo en el futuro.

1. Añade el modificador `onlyOwner` a `setKittyContractAddress`.

```sol
contract ZombieFeeding is ZombieFactory {
    ...
    function setKittyContractAddress(address _address) external onlyOwner { ... }
}
```

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 04 de Junio de 2022, de [https://cryptozombies.io/en/lesson/3/chapter/2](https://cryptozombies.io/en/lesson/3/chapter/2)
