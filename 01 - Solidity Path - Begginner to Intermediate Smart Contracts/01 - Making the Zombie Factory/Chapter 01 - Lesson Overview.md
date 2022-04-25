# Capítulo 1: Resumen de la lección

En la lección 1 vas a construir una "Fábrica de Zombis" para poder crear tu ejército de zombis.

- Nuestra fábrica mantendrá una base de datos de todos los zombis en nuestro ejército.
- Nuestra fábrica va a tener una función para crear nuevos zombis.
- Cada zombi va a tener una apariencia aleatoria y única.

En próximas lecciones, nosotros vamos a añadir más funciones, como obtener zombis con la habilidad de atacar humanos u otros zombis. Pero antes de ello, nosotros vamos a añadir la funcionalidad básica a la creación de nuevos zombis.

## ¿Cómo funciona el ADN Zombie?

La apariencia de los zombis se basa en el "ADN Zombie". El ADN Zombie es simplemente un entero de 16 dígitos, como por ejemplo:

```txt
8356281049284737
```

Justo como el ADN real, diferentes partes de este número van a mapear diferentes rasgos. Los primeros 2 dígitos mapean el tipo de la cabeza del zombie, los siguientes 2 dígitos definen los ojos de los zombis, etc.

> *Nota de los creadores: Para este tutorial, mantendremos las cosas simples, y nuestros zombis solo podrán tener 7 tipos diferentes de cabezas (aunque se podrían tener 100 opciones diferentes de 2 dígitos). Después nosotros podemos añadir más tipos de cabezas si queremos incrementar el número de variantes de Zombis*

Por ejemplo, los primeros 2 dígitos de nuestro ADN de ejemplo son el número `83`. Para mapear el tipo de cabeza del zombi,  hacemos la siguientes operación: `83 % 7 + 1 = 7`. Entonces nuestro zombi tendrá el 7mo tipo de cabeza.

En el panel de la derecha de la plataforma, podemos usar los inputs de tipo deslizar para alterar el ADN, y observar los cambios en las características.

## Referencias

Loom Network. (s. f.). #1 Solidity Tutorial & Ethereum Blockchain Programming Course | CryptoZombies. CryptoZombies. Recuperado 19 de abril de 2022, de [https://cryptozombies.io/en/lesson/1/chapter/1](https://cryptozombies.io/en/lesson/1/chapter/1)
