# KIT DE PROYECTO EN AZURE DEVOPS

Esta guia les propone una estructura simple y replicable para el proyecto que se usa en la demo. La idea es que puedan montarlo rapido, entenderlo facil y reutilizarlo en un entorno de taller o laboratorio.

## Objetivo

Al final deberian tener:

- 1 proyecto de Azure DevOps
- 1 repositorio principal
- 1 sprint activo
- backlog corto pero conectado
- 1 pipeline visible
- 1 PR abierto
- 1 PR completado

Con eso ya pueden demostrar trazabilidad, visibilidad, calidad y relacion entre trabajo, codigo y entrega.

## Configuracion recomendada del proyecto

- Nombre sugerido: `DESARROLLO-CON-DATOS`
- Proceso: `Agile`
- Source control: `Git`
- Visibilidad: `Private`

## Por que usar Agile

Para esta demo conviene contar con:

- `Epic`
- `Feature`
- `User Story`
- `Task`
- `Bug`

Si crean el proyecto con `Basic`, el CSV de ejemplo puede fallar porque no reconoce varios de esos tipos.

## Estructura sugerida

### Areas

Pueden dejar una estructura minima como esta:

- `Producto`
- `Backend`
- `Frontend`
- `QA`

Si quieren simplificar aun mas, con `Producto`, `Backend` y `QA` ya es suficiente.

### Iteraciones

La estructura recomendada es:

- `Release 1`
- `Sprint 0 - Setup`
- `Sprint 1 - Desarrollo`
- `Sprint 2 - Integracion`
- `Sprint 3 - Pruebas`

Para la demo, dejen como principal:

- `Sprint 1 - Desarrollo`

### Repositorio

La opcion mas estable es manejar un solo repo:

- `portal-servicios-demo`

## Estructura sugerida del repo

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

Con esto ya pueden mostrar:

- explicacion de codigo
- pruebas
- PRs
- pipeline
- documentacion

## Work items sugeridos

### Jerarquia minima

- 1 Epic
- 2 Features
- 4 User Stories
- 6 Tasks
- 2 Bugs

### Epic

- `Portal de servicios internos basado en datos`

### Features

- `Consulta y seguimiento de solicitudes`
- `Alertas y visibilidad operativa`

### User Stories

- `Como analista quiero consultar solicitudes activas para priorizar atencion`
- `Como usuario quiero ver el detalle de una solicitud con su estado actual`
- `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`
- `Como lider quiero contar con un resumen ejecutivo del estado operativo`

### Tasks

- `Crear endpoint para listar solicitudes`
- `Agregar filtro por estado y prioridad`
- `Construir vista web de consulta`
- `Crear servicio de resumen de riesgo`
- `Agregar pruebas unitarias del endpoint`
- `Documentar flujo principal`

### Bugs

- `Error al filtrar solicitudes por prioridad alta`
- `La vista de detalle no muestra el estado actualizado`

## Relaciones recomendadas

La narrativa se vuelve mucho mas clara si dejan al menos estas relaciones:

- Epic -> Feature -> User Story -> Task
- User Story -> Bug
- User Story -> PR
- PR -> Build

## Archivos de apoyo incluidos

- Backlog para importar:
  - [`../templates/azure_devops_workitems_demo.csv`](../templates/azure_devops_workitems_demo.csv)
- Variante sin rutas:
  - [`../templates/azure_devops_workitems_demo_sin_rutas.csv`](../templates/azure_devops_workitems_demo_sin_rutas.csv)
- Pipeline base:
  - [`../pipelines/azure-pipelines.yml`](../pipelines/azure-pipelines.yml)
- Script opcional de creacion:
  - [`../scripts/crear_proyecto_ado_demo.ps1`](../scripts/crear_proyecto_ado_demo.ps1)

## Pipeline recomendada

Con una sola pipeline basta.

- Nombre sugerido: `ci-portal-servicios-demo`
- Objetivo:
  - restaurar dependencias
  - ejecutar build
  - ejecutar pruebas unitarias

Para la demo, idealmente dejen:

- 1 corrida exitosa
- 1 corrida con warning o fallo controlado

## Pull requests recomendados

Dejen listos al menos estos dos escenarios:

- 1 PR abierto
- 1 PR completado

Titulos sugeridos:

- PR abierto: `feat: agregar resumen de riesgo para solicitudes`
- PR completado: `feat: listar solicitudes activas`

## Politicas de rama recomendadas

Sobre `main`, activen como minimo:

- minimo 1 revisor
- build obligatoria
- check de work item vinculado

Eso hace que la demo se sienta mucho mas cercana a un contexto real de gobierno y control.

## Orden recomendado de creacion

1. Crear proyecto
2. Crear areas
3. Crear iteraciones
4. Crear repo
5. Subir codigo base
6. Crear pipeline
7. Importar work items
8. Crear ramas y PRs
9. Configurar branch policies
10. Opcional: crear test plan

## Si quieren mostrar QA

Pueden agregar:

- Test Plan: `Sprint 1 Regression`
- Suites:
  - `Consulta de solicitudes`
  - `Detalle de solicitud`
  - `Resumen de riesgo`
- Casos:
  - `Validar consulta de solicitudes activas`
  - `Validar filtro por prioridad`
  - `Validar vista de detalle`
  - `Validar resumen de riesgo`

## Recomendacion final

No intenten montar un proyecto enorme para una demo. Un alcance corto, bien conectado y facil de explicar suele funcionar mucho mejor que un entorno grande con demasiadas dependencias.
