# Hands-on-4-Crear-Analizador-L-xico

# Analizador Léxico para un Subconjunto del Lenguaje C

## Integrante del Equipo
** 👤 Miguel Angel Pérez González**

---

## 💡 Breve Descripción de las Capacidades del Analizador Léxico

Este analizador léxico fue desarrollado utilizando la herramienta **Flex** para identificar y clasificar los tokens fundamentales de un subconjunto del lenguaje C a partir de un flujo de caracteres de entrada (lexemas). Su función es procesar el código fuente (`input.c`) y descomponerlo en una secuencia de unidades léxicas válidas.

**El analizador es capaz de reconocer las siguientes categorías:**

* **Palabras Reservadas:** `int`, `return`, `void`, `float`, `short`, etc.
* **Directivas de Preprocesador:** `#include`, `#define`.
* **Identificadores:** Nombres de variables, funciones y constantes (e.g., `globalA`, `addValues`, `SCALE_FACTOR`).
* **Literales Numéricos:** Números enteros (e.g., `2`, `3`, `0`).
* **Operadores:** De asignación (`=`), aritméticos (`+`, `*`, `-`, `/`), e incremento (`++`).
* **Delimitadores:** `(`, `)`, `{`, `}`, `;`, `,`, `<` y `>`.
* **Comentarios:** El analizador ignora los comentarios de línea (`//`) y de bloque (`/* ... */`).

Para cada lexema reconocido, el analizador imprime su tipo de token.

---

## 🛠️ Instrucciones de Compilación y Ejecución (Windows/GnuWin32)

Asegúrate de que **Flex** (GnuWin32) y **GCC** (MinGW) estén instalados. Todos los archivos (`lexer.l`, `input.c`) deben estar en el mismo directorio.

### 1. Generar el Código Fuente C

Utiliza Flex para leer las reglas definidas en `lexer.l` y generar el motor del analizador léxico en el archivo **`lex.yy.c`**.

2. Compilar el Analizador
Ingresamos los siguientes comandos
flex lexer.l
`Se creara el archivo lex.yy.c`
gcc lex.yy.c -o lexer
`Despues se creara el lexer.exe`
3. Ejecutar el Análisis
.\lexer.exe input.c
`Aquí se ejecutara el archivo .exe y tendremos la salida de los datos`
