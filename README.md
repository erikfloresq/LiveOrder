# LiveOrder

Ejemplo de como implementar Live Activities

<img width="350" alt="Live Activites" src="https://user-images.githubusercontent.com/1220717/202063356-4540120a-24b8-4763-bd5f-a770fde9e76c.png">

## Actualizar el estado del live activity via push notification

Para poder actulizar el estado de nuestro Live Activity via push podemos usar el siguiente [script](https://gist.github.com/erikfloresq/e84ff8bd688db1590bbe8d67704c6735).

El script ya posee todas las configuraciones especiales para el vio la push para LiveActivies, recuerda que estas push no son las mismas que manejamos normalmente.

## Concideraciones para enviar la push para LiveActivites

- Para este caso se ha agregado en los siguientes headers
  - "apns-topic: {nuestro bundle id}.push-type.liveactivity"
  - "apns-push-type: liveactivity"

- Se tiene que enviar el "timestamp" actualizado de preferencia con la hora actual, de lo contrario no se actualizara el widget (podemos usar la siguiente [web](https://www.epochconverter.com))

- El atributo "event" puede ser "update" o "end", segun lo que quieres actualizar

- La data que va en el "content-state" tiene que hacer match con el contentState de tu archivo ActivityAttributes para que el Codable funcione correctamente


