# Moviestore
Moviestore

## Esquema de la arquitectura:

## Capa de interfaz de usuario

- Usamos MVP para la capa de Presentación.
- Utilizamos inyección de dependencia para inyectar dependencias a nuestro presentador, por ejemplo: Interactor, Rutas, Repositorios, etc.
- El Presenter trabaja como un intermediario entre los casos de uso (Interactor) y los controladores de vista. Maneja las interacciones del usuario, lanza la lógica de negocios adecuada y envía la respuesta al controlador de vista.
- La capa de Presentación tiene sus propias entidades de vista diferentes a las entidades de dominio.

## Capa de dominio

- Capa de lógica de negocios.
- Cada caso de uso del Interactor es un componente reutilizable e independiente que ejecuta una lógica de negocios específica.
- La capa de dominio no sabe nada sobre otras capas, solo recupera datos de un repositorio definido como protocolo y devuelve el resultado.
- La capa de dominio tiene sus propias entidades de dominio diferentes a las entidades de vista o datos.

## Capa de datos

- Utiliza patrón de repositorio. Básicamente, el patrón de repositorio agrega una capa de abstracción sobre las fuentes de datos de las que los casos de uso obtienen los datos. Con el patrón de repositorio, puede consultar los objetos de su modelo desde diferentes orígenes de datos (Core Data, Realm, servidor web, etc.) con un solo punto de entrada.
- La lógica de negocios no debería saber de dónde vienen los datos.
- La capa de datos tiene sus propias entidades de datos diferentes a las entidades de dominio.

## Preguntas

1. En qué consiste el principio de responsabilidad única? Cuál es su propósito?
  Este principio establece que cada módulo, clase o método debe tener responsabilidad sobre una sola parte de la funcionalidad  en el software, y ésta a su vez debería estar encapsulada.

2. Qué características tiene, según su opinión, un “buen” código o código limpio
  Que el código sea fácil de entender y sea escalable  en el tiempo.
