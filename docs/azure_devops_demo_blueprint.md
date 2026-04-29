# KIT DE PROYECTO AZURE DEVOPS

## OBJETIVO

Este kit esta pensado para montar un proyecto de Azure DevOps que soporte tu presentacion y las demos de:

- Desarrollo Potenciado por Datos
- GitHub Copilot
- MCP Servers

La idea es que tengas un proyecto:

- facil de explicar,
- suficientemente realista para mostrar valor,
- y lo bastante simple para que otros lo puedan replicar.

## RECOMENDACION PRINCIPAL

Si vas a hacer demos y luego permitir replicacion, te recomiendo crear **un solo proyecto** y **un solo repositorio principal**.

Eso te da:

- menos friccion tecnica,
- menos navegacion,
- una narrativa mas clara,
- y una demo mas estable.

## NOMBRE RECOMENDADO DEL PROYECTO

Usa uno de estos nombres:

- `DEMO-DATOS-DEV`
- `DESARROLLO-CON-DATOS`
- `STPC-DEMO-DATOS`

Mi recomendacion:

- `DESARROLLO-CON-DATOS`

## CONFIGURACION DEL PROYECTO

### Tipo de proceso recomendado

- `Agile`

### Por que Agile

Porque para este caso de demo te conviene trabajar con:

- `Epic`
- `Feature`
- `User Story`
- `Task`
- `Bug`

Eso se alinea muy bien con la narrativa de negocio y delivery.

### Configuracion recomendada

- Proceso: `Agile`
- Source control: `Git`
- Visibilidad: `Private`

## ESTRUCTURA RECOMENDADA

## 1. TEAMS

Con uno basta para la demo:

- `Equipo Demo`

Si quieres una version un poco mas realista:

- `Equipo Demo`
- `QA Demo`

## 2. AREA PATHS

Crea estas areas:

- `DESARROLLO-CON-DATOS\Producto`
- `DESARROLLO-CON-DATOS\Backend`
- `DESARROLLO-CON-DATOS\Frontend`
- `DESARROLLO-CON-DATOS\QA`
- `DESARROLLO-CON-DATOS\Plataforma`

### Recomendacion

Si quieres mantenerlo simple, usa solo estas tres:

- `Producto`
- `Backend`
- `QA`

## 3. ITERATION PATHS

Usa una estructura corta, facil de explicar:

- `DESARROLLO-CON-DATOS\Release 1`
- `DESARROLLO-CON-DATOS\Release 1\Sprint 0 - Setup`
- `DESARROLLO-CON-DATOS\Release 1\Sprint 1 - Desarrollo`
- `DESARROLLO-CON-DATOS\Release 1\Sprint 2 - Integracion`
- `DESARROLLO-CON-DATOS\Release 1\Sprint 3 - Pruebas`

### Cual dejar activa para la demo

Deja activa:

- `Sprint 1 - Desarrollo`

Asi puedes mostrar:

- backlog,
- tareas en curso,
- PRs,
- pipeline,
- y trazabilidad.

## 4. REPOSITORIOS

## Opcion recomendada para demo

Crear solo este repo:

- `portal-servicios-demo`

## Opcion extendida

Si quieres mostrar una organizacion mas madura:

- `portal-servicios-demo`
- `infra-demo`

Pero para tu caso, un solo repo principal es mejor.

## 5. ESTRUCTURA DEL REPO PRINCIPAL

Dentro de `portal-servicios-demo`, te recomiendo algo asi:

```text
portal-servicios-demo/
  src/
    api/
    web/
  tests/
    unit/
  docs/
  azure-pipelines.yml
  README.md
```

Esto te permite hacer demo de:

- explicacion de codigo,
- pruebas,
- PR,
- pipeline,
- documentacion.

## 6. WORK ITEMS QUE DEBES AGREGAR

## ESTRUCTURA MINIMA

Te recomiendo esta jerarquia:

- 1 Epic
- 2 Features
- 4 User Stories
- 6 a 8 Tasks
- 2 Bugs

## EPIC

- `Portal de servicios internos basado en datos`

## FEATURES

- `Consulta y seguimiento de solicitudes`
- `Alertas y visibilidad operativa`

## USER STORIES

- `Como analista quiero consultar solicitudes activas para priorizar atencion`
- `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`
- `Como usuario quiero ver el detalle de una solicitud con su estado actual`
- `Como lider quiero contar con un resumen ejecutivo del estado operativo`

## TASKS

- `Crear endpoint para listar solicitudes`
- `Agregar filtro por estado y prioridad`
- `Construir vista web de consulta`
- `Crear servicio de resumen de riesgo`
- `Agregar pruebas unitarias del endpoint`
- `Documentar flujo principal`

## BUGS

- `Error al filtrar solicitudes por prioridad alta`
- `La vista de detalle no muestra el estado actualizado`

## MAPA DE RELACIONES RECOMENDADO

Usa esta jerarquia:

- Epic
  - `Portal de servicios internos basado en datos`

- Features hijas del Epic
  - `Consulta y seguimiento de solicitudes`
  - `Alertas y visibilidad operativa`

- User Stories hijas de `Consulta y seguimiento de solicitudes`
  - `Como analista quiero consultar solicitudes activas para priorizar atencion`
  - `Como usuario quiero ver el detalle de una solicitud con su estado actual`

- User Stories hijas de `Alertas y visibilidad operativa`
  - `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`
  - `Como lider quiero contar con un resumen ejecutivo del estado operativo`

- Tasks hijas de `Como analista quiero consultar solicitudes activas para priorizar atencion`
  - `Crear endpoint para listar solicitudes`
  - `Agregar filtro por estado y prioridad`
  - `Agregar pruebas unitarias del endpoint`

- Tasks hijas de `Como usuario quiero ver el detalle de una solicitud con su estado actual`
  - `Construir vista web de consulta`

- Tasks hijas de `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`
  - `Crear servicio de resumen de riesgo`

- Tasks hijas de `Como lider quiero contar con un resumen ejecutivo del estado operativo`
  - `Documentar flujo principal`

- Bugs sugeridos
  - `Error al filtrar solicitudes por prioridad alta`
  - `La vista de detalle no muestra el estado actualizado`

## COMO CREAR LAS RELACIONES

La ruta mas simple es:

1. Importar primero los work items por CSV.
2. Abrir el Epic.
3. En `Add link`, crear relacion `Child` con las dos Features.
4. Abrir cada Feature.
5. Crear relacion `Child` con sus User Stories.
6. Abrir cada User Story.
7. Crear relacion `Child` con las Tasks que correspondan.
8. Relacionar los Bugs con la User Story afectada usando `Related` o `Child`, segun como quieras contar la demo.

## RECOMENDACION

Si vas a mostrar trazabilidad en la presentacion, deja al menos:

- Epic -> Feature -> User Story -> Task
- User Story -> Bug
- User Story -> PR
- PR -> Build

## IMPORTANTE

Para importar en bloque, te deje un archivo listo:

- [azure_devops_workitems_demo.csv](/C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure_devops_workitems_demo.csv)

## 7. PIPELINE

## Que necesitas

Solo una pipeline de demo es suficiente.

### Nombre recomendado

- `ci-portal-servicios-demo`

### Que debe hacer

- restaurar dependencias
- ejecutar build
- ejecutar pruebas unitarias

### Para que sirve en la demo

- mostrar estado de entrega,
- relacion con PRs,
- y riesgo tecnico.

Te deje un archivo base:

- [azure-pipelines-demo.yml](/C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure-pipelines-demo.yml)

## 8. PULL REQUESTS

Para que la demo funcione bien, deja preparado al menos:

- 1 PR abierto
- 1 PR ya completado

### PR abierto sugerido

- `feat: agregar resumen de riesgo para solicitudes`

### PR completado sugerido

- `feat: listar solicitudes activas`

## 9. BRANCHES

Usa esta estructura:

- `main`
- `feature/listado-solicitudes`
- `feature/resumen-riesgo`
- `bugfix/filtro-prioridad`

## 10. POLITICAS DE BRANCH RECOMENDADAS

Sobre `main`, activa como minimo:

- minimo 1 revisor
- build obligatoria
- check de work item vinculado

Esto mejora mucho la demo, porque luego puedes mostrar:

- trazabilidad,
- control,
- y gobierno tecnico.

## 11. TEST PLANS

Si quieres mostrar QA, crea:

### Test Plan

- `Sprint 1 Regression`

### Test Suites

- `Consulta de solicitudes`
- `Detalle de solicitud`
- `Resumen de riesgo`

### Test Cases

- `Validar consulta de solicitudes activas`
- `Validar filtro por prioridad`
- `Validar vista de detalle`
- `Validar resumen de riesgo`

## 12. ORDEN RECOMENDADO DE CREACION

1. Crear proyecto
2. Crear areas
3. Crear iteraciones
4. Crear repo
5. Subir codigo base
6. Crear pipeline
7. Importar work items
8. Crear ramas y PRs
9. Crear test plan

## 13. COMO CREARLO EN LA UI

## Proyecto

1. Ir a Azure DevOps.
2. Seleccionar `New Project`.
3. Nombre: `DESARROLLO-CON-DATOS`
4. Visibilidad: `Private`
5. Version control: `Git`
6. Work item process: `Agile`

## Repo

1. Ir a `Repos`.
2. Abrir el selector de repositorios.
3. Seleccionar `New repository`.
4. Nombre: `portal-servicios-demo`.
5. Crear README.

## Work items por CSV

1. Ir a `Boards > Queries`.
2. Seleccionar `Import work items`.
3. Cargar el archivo CSV.
4. Revisar.
5. Guardar items.

## Iteraciones

1. Ir a `Project settings`.
2. Abrir `Project configuration`.
3. Entrar a `Iterations`.
4. Crear `Release 1`.
5. Crear los sprints hijos.

## Areas

1. Ir a `Project settings`.
2. Abrir `Project configuration`.
3. Entrar a `Areas`.
4. Crear las areas sugeridas.

## Pipeline

1. Ir a `Pipelines`.
2. Seleccionar `New pipeline`.
3. Elegir Azure Repos Git.
4. Elegir `portal-servicios-demo`.
5. Seleccionar `Existing Azure Pipelines YAML file`.
6. Elegir `azure-pipelines.yml`.

## 14. COMO CREARLO POR CLI

Tambien te deje un script base:

- [crear_proyecto_ado_demo.ps1](/C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/crear_proyecto_ado_demo.ps1)

## 15. RECOMENDACION FINAL

Si tu objetivo es demo y replicacion, no intentes armar un proyecto enorme.

La mejor combinacion para ti es:

- 1 proyecto
- 1 repo principal
- 1 pipeline
- 1 sprint activo
- 1 PR abierto
- 1 PR cerrado
- backlog corto pero bien conectado

Eso es suficiente para demostrar:

- dato operativo,
- trazabilidad,
- trabajo tecnico,
- calidad,
- y coordinacion.

## FUENTES OFICIALES

- Crear proyecto:
  - https://learn.microsoft.com/es-es/azure/devops/organizations/projects/create-project?view=azure-devops
- Crear repo:
  - https://learn.microsoft.com/en-us/azure/devops/repos/git/create-new-repo?view=azure-devops
- Importar work items por CSV:
  - https://learn.microsoft.com/en-us/azure/devops/boards/queries/import-work-items-from-csv?view=azure-devops
- Area paths:
  - https://learn.microsoft.com/en-us/azure/devops/organizations/settings/set-area-paths?view=azure-devops
- Iteration paths:
  - https://learn.microsoft.com/en-us/azure/devops/organizations/settings/set-iteration-paths-sprints?view=azure-devops
- Test plans:
  - https://learn.microsoft.com/en-us/azure/devops/test/create-a-test-plan?view=azure-devops
- Branch policies:
  - https://learn.microsoft.com/en-us/azure/devops/repos/git/branch-policies-overview?view=azure-devops
