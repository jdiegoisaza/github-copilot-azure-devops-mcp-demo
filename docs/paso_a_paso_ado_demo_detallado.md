# PASO A PASO DETALLADO

Esta guia les sirve para replicar el entorno de demo del taller y dejar listo un escenario funcional de:

- GitHub Copilot
- Azure DevOps MCP Server
- Azure DevOps con backlog, repo, PRs y pipeline

La pueden seguir tal cual o adaptar nombres y artefactos a su propia organizacion.

## Orden recomendado

1. Preparativos previos
2. Crear el proyecto en Azure DevOps
3. Crear areas e iteraciones
4. Crear el repositorio
5. Subir contenido base
6. Importar backlog
7. Crear pipeline
8. Crear ramas y pull requests
9. Configurar branch policies
10. Opcional: preparar test plan
11. Configurar Copilot y MCP
12. Ensayar la demo

## Archivos de apoyo en este repositorio

- Blueprint del proyecto:
  - [`azure_devops_demo_blueprint.md`](azure_devops_demo_blueprint.md)
- Backlog para importar:
  - [`../templates/azure_devops_workitems_demo.csv`](../templates/azure_devops_workitems_demo.csv)
- Backlog alternativo sin rutas:
  - [`../templates/azure_devops_workitems_demo_sin_rutas.csv`](../templates/azure_devops_workitems_demo_sin_rutas.csv)
- Pipeline base:
  - [`../pipelines/azure-pipelines.yml`](../pipelines/azure-pipelines.yml)
- Script opcional:
  - [`../scripts/crear_proyecto_ado_demo.ps1`](../scripts/crear_proyecto_ado_demo.ps1)
- Preparativos tecnicos:
  - [`preparativos_tecnicos_demo.md`](preparativos_tecnicos_demo.md)
- Guion de demo:
  - [`demos_en_vivo.md`](demos_en_vivo.md)

## 1. Preparativos previos

Antes de tocar Azure DevOps, revisen esto:

### Permisos minimos

Idealmente deberian poder:

- crear proyecto o recibirlo ya creado
- crear repositorio
- crear pipeline
- crear work items
- crear PRs
- configurar branch policies

### Configuracion recomendada

- Nombre del proyecto: `DESARROLLO-CON-DATOS`
- Visibilidad: `Private`
- Source control: `Git`
- Process: `Agile`

### Nota importante sobre el proceso

El material de ejemplo usa:

- `Feature`
- `User Story`
- `Bug`

Si crean el proyecto con `Basic`, la importacion del CSV puede fallar. Para esta demo usen `Agile`.

## 2. Crear el proyecto en Azure DevOps

### Opcion por interfaz

1. Entren a:

```text
https://dev.azure.com/TU_ORGANIZACION
```

2. Seleccionen `New project`.
3. Completen:
   - Name: `DESARROLLO-CON-DATOS`
   - Description: `Proyecto demo para Desarrollo Potenciado por Datos`
   - Visibility: `Private`
   - Version control: `Git`
   - Work item process: `Agile`
4. Seleccionen `Create`.

### Opcion por script

Si prefieren apoyarse en CLI:

1. Abran [`../scripts/crear_proyecto_ado_demo.ps1`](../scripts/crear_proyecto_ado_demo.ps1).
2. Reemplacen el nombre de la organizacion.
3. Ejecuten el script con Azure CLI autenticado.

## 3. Crear areas e iteraciones

### Areas sugeridas

En `Project settings > Project configuration > Areas`, creen:

- `Producto`
- `Backend`
- `Frontend`
- `QA`

Resultado esperado:

```text
DESARROLLO-CON-DATOS
  Producto
  Backend
  Frontend
  QA
```

### Iteraciones sugeridas

En `Project settings > Project configuration > Iterations`, creen:

- `Release 1`
- `Sprint 0 - Setup`
- `Sprint 1 - Desarrollo`
- `Sprint 2 - Integracion`
- `Sprint 3 - Pruebas`

Resultado esperado:

```text
DESARROLLO-CON-DATOS
  Release 1
    Sprint 0 - Setup
    Sprint 1 - Desarrollo
    Sprint 2 - Integracion
    Sprint 3 - Pruebas
```

Para la demo, dejen `Sprint 1 - Desarrollo` como sprint principal.

## 4. Crear el repositorio

En `Repos`, creen o inicialicen este repo:

- `portal-servicios-demo`

Si Azure DevOps lo permite, creenlo con `README`.

## 5. Subir contenido base

### Estructura sugerida

```text
portal-servicios-demo/
  src/
    api/
    web/
  tests/
    unit/
  docs/
  README.md
  azure-pipelines.yml
```

### Que conviene agregar

- el pipeline base de [`../pipelines/azure-pipelines.yml`](../pipelines/azure-pipelines.yml)
- un `README.md` simple
- uno o dos archivos de codigo faciles de explicar
- una carpeta de pruebas

### Ejemplo de archivos utiles para la demo

- `src/api/requestsService.js`
- `src/web/requestsPage.js`
- `tests/unit/requestsService.test.js`

No tienen que ser complejos. Para el taller funciona mejor algo claro que algo demasiado sofisticado.

## 6. Importar el backlog

### Opcion principal

En `Boards > Queries`, usen `Import work items` y carguen:

- [`../templates/azure_devops_workitems_demo.csv`](../templates/azure_devops_workitems_demo.csv)

### Si falla por rutas

Usen esta variante:

- [`../templates/azure_devops_workitems_demo_sin_rutas.csv`](../templates/azure_devops_workitems_demo_sin_rutas.csv)

Luego pueden asignar `Area Path` e `Iteration Path` desde la interfaz.

### Si falla por tipos de work item

Revisen que el proyecto este en `Agile`. Si esta en `Basic`, el CSV no va a reconocer correctamente:

- `Feature`
- `User Story`
- `Bug`

### Estructura esperada despues de importar

- 1 Epic
- 2 Features
- 4 User Stories
- 6 Tasks
- 2 Bugs

## 7. Crear relaciones entre work items

La importacion por CSV acelera la carga, pero conviene terminar la jerarquia a mano para que la demo quede mas clara.

Relacion sugerida:

- Epic:
  - `Portal de servicios internos basado en datos`
- Features hijas:
  - `Consulta y seguimiento de solicitudes`
  - `Alertas y visibilidad operativa`
- User Stories hijas de las Features correspondientes
- Tasks hijas de las User Stories
- Bugs relacionados con la User Story afectada

Recomendacion practica:

- usen `Child` para la jerarquia principal
- usen `Related` para los bugs

## 8. Ajustar estado y asignaciones

Para que la demo se vea viva, dejen por ejemplo:

- 1 User Story en `New`
- 1 User Story en `Active`
- 1 Task en `Closed`
- 1 Bug en `Active`

Y asignen al menos algunos items a un usuario real. Eso mejora mucho consultas como:

```text
Show my assigned work items.
```

## 9. Crear la pipeline

En `Pipelines > New pipeline`:

1. Seleccionen `Azure Repos Git`.
2. Elijan `portal-servicios-demo`.
3. Seleccionen `Existing Azure Pipelines YAML file`.
4. Elijan `/azure-pipelines.yml`.
5. Guarden y ejecuten.

### Resultado esperado

Deberian tener al menos una corrida visible.

### Recomendacion para la demo

Dejen:

- una corrida exitosa
- otra corrida con warning o fallo controlado

## 10. Crear ramas y pull requests

### Ramas sugeridas

- `feature/listado-solicitudes`
- `feature/resumen-riesgo`
- `bugfix/filtro-prioridad`

### PR completado sugerido

- Titulo: `feat: listar solicitudes activas`

### PR abierto sugerido

- Titulo: `feat: agregar resumen de riesgo para solicitudes`

Con esos dos escenarios ya pueden hablar de:

- trazabilidad
- revisiones
- relacion con work items
- estado del delivery

## 11. Configurar branch policies

En `Repos > Branches > main > Branch policies`, activen como minimo:

- minimo 1 revisor
- check de work item vinculado
- build validation con la pipeline creada

Eso ayuda mucho a que la demo se sienta realista y orientada a control.

## 12. Opcional: preparar Test Plans

Si quieren incluir un mensaje mas fuerte hacia QA:

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

## 13. Configurar Copilot y MCP

Sigan la guia detallada de:

- [`preparativos_tecnicos_demo.md`](preparativos_tecnicos_demo.md)

La recomendacion general es:

- `MCP remoto` si la organizacion ya usa `Microsoft Entra ID` y la cuenta tiene acceso
- `MCP local` si necesitan una ruta mas controlada

## 14. Validar la demo

Antes de ensayar, comprueben que pueden hacer estas consultas:

```text
Show my assigned work items.
What pull requests require my review?
List recent failed pipeline runs for this project.
Explain this file.
```

Si esas cuatro ya funcionan, el entorno base esta listo.

## 15. Ensayar la secuencia

Para el ensayo, apoyense en:

- [`demos_en_vivo.md`](demos_en_vivo.md)

Flujo recomendado:

1. Work items o sprint
2. PR o pipeline
3. Codigo con Copilot
4. Resumen ejecutivo

## 16. Problemas comunes

### El CSV falla por `Iteration Path`

Verifiquen que:

- el nombre del proyecto coincide exactamente
- la iteracion existe
- la ruta del CSV coincide con el proyecto real

### El CSV falla por tipos de work item

Revisen que el proyecto este en `Agile`.

### Copilot responde como chat normal

Revisen que:

- el chat este en `Agent`
- las tools del MCP esten habilitadas
- el servidor MCP aparezca disponible

### El MCP remoto no autentica

Revisen:

- cuenta organizacional o invitada
- permisos al proyecto
- integracion con `Microsoft Entra ID`

## 17. Checklist final

Antes de entrar a la demostracion, validen:

- proyecto creado
- areas creadas
- iteraciones creadas
- repo visible
- backlog importado
- relaciones padre-hijo creadas
- pipeline visible
- 1 PR abierto
- 1 PR cerrado
- branch policies activas
- Copilot responde
- MCP responde
- prompts listos
- capturas de respaldo listas
