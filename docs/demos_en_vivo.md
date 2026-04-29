# DEMOS EN VIVO

## OBJETIVO

Estas demos estan pensadas para una sesion corporativa bajo el marco **DESARROLLO POTENCIADO POR DATOS**.

La idea no es demostrar "magia". La idea es demostrar tres cosas:

1. Que los datos operativos del ciclo de desarrollo pueden ponerse al servicio de mejores decisiones.
2. Que GitHub Copilot acelera el trabajo tecnico cuando ya existe contexto.
3. Que los MCP Servers conectan ese contexto real con el asistente.

## SUPUESTO DE DEMO

Supuesto recomendado:

- Entorno de demo en `Visual Studio Code`.
- GitHub Copilot Chat activo.
- Azure DevOps MCP Server disponible.
- Proyecto de Azure DevOps preparado con:
  - 1 iteracion activa.
  - 3 a 5 work items reales o de demo.
  - 1 PR abierto.
  - 1 pipeline reciente con fallo o con warning.
  - 1 archivo de codigo facil de explicar.

Nota operativa:

- Segun Microsoft Learn, el Azure DevOps MCP Server permite consultar y actualizar work items, operar sobre PRs y pipelines, e inspeccionar logs de build.
- Segun GitHub Docs, Copilot Chat en el IDE puede explicar codigo, generar pruebas y sugerir fixes.
- Si usas el Azure DevOps MCP remoto, a abril de 2026 sigue en `public preview`, y Microsoft documenta como entornos soportados `Visual Studio Code` y `Visual Studio`.

## CHECKLIST ANTES DE ENTRAR A LA SESION

### 1. Checklist tecnico

- Validar que GitHub Copilot Chat abre sin pedir login.
- Validar que el MCP Server aparece conectado.
- Validar que la cuenta tenga acceso al proyecto correcto.
- Validar que el repo de demo abre sin errores.
- Validar que existe al menos un PR visible y una build reciente.

### 2. Checklist funcional

- Tener identificados:
  - el nombre del proyecto,
  - la iteracion actual,
  - un work item prioritario,
  - un archivo de codigo relacionado,
  - un PR o pipeline que puedas mencionar.

### 3. Checklist de riesgo

- No usar datos sensibles.
- No usar nombres de clientes o incidentes delicados.
- Evitar acciones de escritura en vivo, salvo que quieras mostrarlo de forma deliberada.
- Preferir demo en modo consulta o `read-only`.

## DEMO PRINCIPAL

## NOMBRE

**DEL SPRINT A LA ACCION**

## DURACION

8 a 10 minutos

## MENSAJE CENTRAL

No estamos mostrando una IA que "habla bonito". Estamos mostrando como un equipo puede pasar de datos operativos dispersos a una lectura accionable del trabajo y, desde ahi, acelerar la ejecucion tecnica.

## SECUENCIA

### PASO 1. LEER EL ESTADO REAL DEL SPRINT

Que mostrar:

- VS Code con Copilot Chat abierto.
- El proyecto o workspace visible.

Prompt sugerido en espanol:

`Muestrame mis work items asignados en la iteracion actual y resume cuales estan en riesgo o bloqueados.`

Prompt de respaldo en ingles:

`Show my assigned work items.`

Que deberias esperar:

- Lista de work items.
- Identificacion de items abiertos o con riesgo.

Que decir mientras se ejecuta:

"Aqui el valor no esta en que la herramienta responda rapido. El valor esta en que esta leyendo el estado real del trabajo y nos evita navegar manualmente por varias vistas para entender donde estamos."

### PASO 2. RELACIONAR EL TRABAJO CON ENTREGA

Prompt sugerido en espanol:

`De esos work items, dime cuales tienen pull requests abiertos o pipelines recientes con fallo, y resume el principal riesgo de entrega.`

Prompt de respaldo en ingles:

`What pull requests require my review?`

Prompt opcional adicional:

`List recent failed pipeline runs for this project and summarize the likely issue.`

Que deberias esperar:

- Relacion entre trabajo, PRs y pipelines.
- Una lectura integrada del riesgo.

Que decir mientras se ejecuta:

"Este es el punto donde el dato empieza a volverse accionable. Ya no vemos backlog por un lado y delivery por otro; vemos la conexion entre ambos."

### PASO 3. BAJAR AL NIVEL TECNICO CON COPILOT

Que mostrar:

- Abrir un archivo relacionado con el item o PR.

Prompt sugerido en espanol:

`Explica este archivo y dime que parte impactaria el work item que acabamos de revisar.`

Prompt de respaldo en ingles:

`Explain this file.`

Segundo prompt sugerido:

`Propone dos pruebas unitarias para cubrir el caso principal y un escenario borde.`

Prompt de respaldo en ingles:

`Write a unit test for this method.`

Que deberias esperar:

- Resumen funcional del archivo.
- Sugerencias de pruebas o puntos de impacto.

Que decir mientras se ejecuta:

"Aqui GitHub Copilot ya no trabaja aislado. Esta tomando el contexto tecnico y lo convierte en una accion concreta para el equipo: entender, probar y preparar mejor el cambio."

### PASO 4. CERRAR CON VISTA EJECUTIVA

Prompt sugerido en espanol:

`Resume en lenguaje ejecutivo el estado de esta funcionalidad, el riesgo principal y las tres acciones recomendadas para el equipo.`

Que deberias esperar:

- Un resumen claro.
- Riesgo principal.
- Siguientes pasos.

Que decir mientras se ejecuta:

"Con esto cerramos el ciclo: datos operativos, interpretacion tecnica y una salida util para coordinacion o seguimiento."

## DEMO SECUNDARIA

## NOMBRE

**COPILOT EN 5 MINUTOS**

## CUANDO USARLA

- Si el MCP Server no responde.
- Si quieres una demo mas corta.
- Si la audiencia esta mas cargada a desarrollo.

## DURACION

4 a 6 minutos

## SECUENCIA

### PASO 1

Abrir un archivo del repo y pedir:

`Explain this file.`

### PASO 2

Pedir:

`How could I improve this code?`

### PASO 3

Seleccionar un metodo y pedir:

`Write a unit test for this method.`

### PASO 4

Si tienes un PR abierto, pedir:

`Summarize the changes in this PR.`

## MENSAJE DE NEGOCIO

"Aunque aqui no estamos usando datos de Azure DevOps, si estamos viendo valor practico inmediato: menos tiempo de arranque, mejor comprension del codigo y mejor preparacion para revisar o probar."

## DEMO TERCIARIA

## NOMBRE

**MCP EN 5 MINUTOS**

## CUANDO USARLA

- Si quieres enfatizar el marco de datos.
- Si la audiencia tiene mas PMO, QA, coordinacion o liderazgo.

## DURACION

4 a 6 minutos

## SECUENCIA

### PASO 1

Prompt:

`List the projects in my Azure DevOps organization.`

### PASO 2

Prompt:

`Show my assigned work items.`

### PASO 3

Prompt:

`What pull requests require my review?`

### PASO 4

Prompt:

`List recent failed pipeline runs for this project and summarize the likely issue.`

## MENSAJE DE NEGOCIO

"Esta demo no busca mostrar automatizacion por si sola. Busca mostrar que el dato operativo correcto, puesto en el momento correcto, mejora seguimiento, decision y coordinacion."

## DEMO RECOMENDADA SEGUN AUDIENCIA

### Si ves mas lideres y PMO

Usa:

- Demo principal.
- Enfatiza sprint, riesgo, PR, pipeline y resumen ejecutivo.

### Si ves mas desarrollo y arquitectura

Usa:

- Demo principal o demo Copilot.
- Enfatiza explicacion de codigo, pruebas y PR.

### Si ves mas QA

Usa:

- Demo principal.
- Enfatiza trazabilidad, pruebas y lectura de build o logs.

## FRASES CORTAS PARA DECIR DURANTE LA DEMO

- "Aqui no estamos reemplazando criterio; estamos reduciendo friccion."
- "El valor no es solo responder, sino responder con contexto real."
- "Esto reduce cambio de contexto entre backlog, codigo y entrega."
- "La IA no cierra la decision; ayuda a prepararla mejor."
- "El dato solo genera valor cuando se vuelve accion."

## PROMPTS LISTOS PARA COPIAR

### PROMPTS DE CONTEXTO

- `Muestrame mis work items asignados en la iteracion actual.`
- `Resume cuales estan bloqueados o en riesgo.`
- `What pull requests require my review?`
- `List recent failed pipeline runs for this project.`

### PROMPTS TECNICOS

- `Explain this file.`
- `How could I improve this code?`
- `Write a unit test for this method.`
- `Explica este archivo y relaciona su impacto con el work item revisado.`

### PROMPTS DE CIERRE

- `Resume el principal riesgo de entrega en lenguaje ejecutivo.`
- `Propone las tres acciones siguientes para el equipo.`
- `Resume the changes in this PR.`
- `Tell me why this job failed.`

## PLAN B SI FALLA LA DEMO

## ESCENARIO 1. FALLA EL LOGIN O LA CONEXION MCP

Que hacer:

- Cambiar a la demo secundaria de Copilot.
- Explicitar: "La integracion con contexto depende de autenticacion y permisos; por eso el gobierno importa tanto como la herramienta."

## ESCENARIO 2. EL MCP RESPONDE LENTO

Que hacer:

- Tener 2 o 3 capturas listas.
- Mostrar primero una salida ya preparada.
- Luego repetir el prompt si hay tiempo.

## ESCENARIO 3. NO HAY PR O PIPELINE UTIL

Que hacer:

- Concentrarte en work items y explicacion de codigo.
- Cerrar con una explicacion verbal del paso que habrias mostrado.

## ESCENARIO 4. COPILOT RESPONDE ALGO FLOJO

Que hacer:

- Pedir una reformulacion mas concreta.
- Ejemplo:
  - `Se mas especifico. Quiero una respuesta breve, con riesgo principal y accion sugerida.`

## QUE NO HACER EN VIVO

- No improvisar con datos sensibles.
- No mostrar demasiadas configuraciones tecnicas.
- No entrar en instalacion paso a paso.
- No abrir cinco herramientas distintas para probar un punto simple.
- No dejar que la demo se vuelva una discusion de comandos.

## ORDEN RECOMENDADO DURANTE LA CHARLA

1. Explica el marco de datos.
2. Muestra la demo principal.
3. Vuelve a negocio:
   - mejor visibilidad,
   - mejor coordinacion,
   - mejor preparacion de la accion.
4. Cierra con riesgos y adopcion responsable.

## FUENTES OFICIALES UTILIZADAS

- GitHub Docs, "Asking GitHub Copilot questions in your IDE":
  - https://docs.github.com/en/copilot/how-tos/chat-with-copilot/chat-in-ide
- GitHub Docs, "Getting started with prompts for Copilot Chat on GitHub":
  - https://docs.github.com/en/copilot/how-tos/copilot-on-github/chat-with-copilot/get-started-with-chat
- Microsoft Learn, "Manage Azure DevOps by using MCP Server":
  - https://learn.microsoft.com/en-us/training/modules/manage-ado-mcp-server/
- Microsoft Learn, "Set up the remote Azure DevOps MCP Server (preview)":
  - https://learn.microsoft.com/en-us/azure/devops/mcp-server/remote-mcp-server?view=azure-devops
