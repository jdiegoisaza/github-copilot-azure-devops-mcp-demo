# DEMOS EN VIVO

Si ustedes quieren reproducir la demo que vimos en la sesion, aqui tienen una secuencia simple, estable y facil de volver a contar dentro de su propio equipo.

El marco es este: no se trata de mostrar una IA aislada, sino de mostrar como los datos del trabajo real se convierten en decisiones y acciones.

## Mensaje central

La historia que queremos contar es esta:

1. El equipo ya tiene datos en Azure DevOps.
2. MCP permite consultar ese contexto sin saltar manualmente entre varias vistas.
3. Copilot ayuda a convertir ese contexto en comprension tecnica, pruebas y siguientes pasos.

## Supuesto de demo

La demo funciona mucho mejor si antes dejan listo:

- 1 iteracion activa
- 3 a 5 work items visibles
- 1 PR abierto
- 1 PR completado
- 1 pipeline reciente
- 1 archivo de codigo facil de explicar

Si todavia no tienen ese entorno, armenlo con apoyo de:

- [`azure_devops_demo_blueprint.md`](azure_devops_demo_blueprint.md)
- [`paso_a_paso_ado_demo_detallado.md`](paso_a_paso_ado_demo_detallado.md)

## Checklist antes de empezar

### Tecnico

- Copilot abre sin pedir login inesperado
- el servidor MCP aparece disponible
- el repo correcto esta abierto
- la cuenta tiene acceso al proyecto correcto

### Funcional

- ya saben que work item van a mostrar
- ya saben que PR o pipeline van a mencionar
- ya tienen elegido el archivo de codigo para Copilot

### Riesgo

- no usan datos sensibles
- no van a hacer escrituras accidentales
- tienen capturas de respaldo por si algo falla

## Demo principal

### Nombre

`DEL SPRINT A LA ACCION`

### Duracion sugerida

8 a 10 minutos

### Secuencia

#### Paso 1. Leer el estado del sprint

Prompt sugerido:

```text
Muestrame mis work items asignados en la iteracion actual y resume cuales estan en riesgo o bloqueados.
```

Respaldo en ingles:

```text
Show my assigned work items.
```

Resultado esperado:

- lista de work items
- algun item priorizado
- una lectura rapida de riesgo o bloqueo

Mensaje sugerido mientras corre:

"El valor aqui no es solo responder rapido. El valor es traer el estado real del trabajo sin obligarnos a navegar manualmente por varias pantallas."

#### Paso 2. Relacionar trabajo con entrega

Prompt sugerido:

```text
De esos work items, dime cuales tienen pull requests abiertos o pipelines recientes con fallo, y resume el principal riesgo de entrega.
```

Alternativas:

```text
What pull requests require my review?
List recent failed pipeline runs for this project and summarize the likely issue.
```

Resultado esperado:

- relacion entre backlog, PRs y pipelines
- un riesgo tecnico o de entrega facil de explicar

Mensaje sugerido:

"Aqui el dato deja de estar aislado. Ya no vemos backlog por un lado y delivery por otro; vemos la conexion entre ambos."

#### Paso 3. Bajar al nivel tecnico con Copilot

Abrir un archivo relacionado y usar:

```text
Explica este archivo y dime que parte impactaria el work item que acabamos de revisar.
```

Luego:

```text
Propone dos pruebas unitarias para cubrir el caso principal y un escenario borde.
```

Respaldo en ingles:

```text
Explain this file.
Write a unit test for this method.
```

Resultado esperado:

- resumen tecnico del archivo
- sugerencia de impacto
- ideas de pruebas

Mensaje sugerido:

"Aqui Copilot no trabaja aislado. Toma el contexto tecnico y lo convierte en una accion concreta para el equipo: entender mejor el cambio y prepararlo mejor."

#### Paso 4. Cerrar con vista ejecutiva

Prompt sugerido:

```text
Resume en lenguaje ejecutivo el estado de esta funcionalidad, el riesgo principal y las tres acciones recomendadas para el equipo.
```

Resultado esperado:

- resumen claro
- riesgo principal
- siguientes pasos accionables

Mensaje sugerido:

"Con esto cerramos el ciclo: dato operativo, interpretacion tecnica y una salida util para seguimiento y toma de decisiones."

## Demo corta solo con Copilot

### Cuando usarla

- si MCP falla
- si el tiempo se reduce
- si la audiencia esta mas cargada a desarrollo

### Secuencia

1. Abrir un archivo y pedir:

```text
Explain this file.
```

2. Pedir:

```text
How could I improve this code?
```

3. Seleccionar un metodo y pedir:

```text
Write a unit test for this method.
```

4. Si tienen un PR visible:

```text
Summarize the changes in this PR.
```

### Mensaje de negocio

"Aunque aqui no estamos usando datos de Azure DevOps, si estamos viendo valor inmediato: menos tiempo de arranque, mejor comprension del codigo y mejor preparacion para revisar o probar."

## Demo corta solo con MCP

### Cuando usarla

- si quieren enfatizar visibilidad y seguimiento
- si la audiencia tiene mas PMO, QA o liderazgo

### Secuencia

```text
List the projects in my Azure DevOps organization.
Show my assigned work items.
What pull requests require my review?
List recent failed pipeline runs for this project and summarize the likely issue.
```

### Mensaje de negocio

"Esta demo no busca mostrar automatizacion por si sola. Busca mostrar que el dato operativo correcto, puesto en el momento correcto, mejora coordinacion, seguimiento y decision."

## Frases utiles durante la demo

- "Aqui no estamos reemplazando criterio; estamos reduciendo friccion."
- "El valor no es solo responder, sino responder con contexto real."
- "Esto reduce cambio de contexto entre backlog, codigo y entrega."
- "La IA no cierra la decision; ayuda a prepararla mejor."
- "El dato solo genera valor cuando se vuelve accion."

## Plan B

### Si falla MCP

Pasen a la demo corta de Copilot y expliquen:

"La integracion con contexto depende de autenticacion y permisos; por eso gobierno y configuracion tambien hacen parte del valor."

### Si falla Copilot

Concentrense en:

- work items
- PR abierto
- pipeline visible
- cierre verbal con resumen ejecutivo

### Si falla todo

Tengan listas 2 o 3 capturas:

- sprint o backlog
- PR
- pipeline

## Que conviene evitar en vivo

- datos sensibles
- exceso de configuracion tecnica
- instalaciones largas
- cambios en produccion
- demasiadas herramientas abiertas al mismo tiempo

## Cierre recomendado

Despues de la demo, conecten siempre con estas ideas:

- mejor visibilidad del trabajo real
- mejor conexion entre trabajo, codigo y entrega
- mejor preparacion de la accion del equipo
