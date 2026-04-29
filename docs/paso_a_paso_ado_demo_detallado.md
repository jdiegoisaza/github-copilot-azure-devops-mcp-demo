# PASO A PASO DETALLADO

## MONTAJE DEL PROYECTO Y PREPARACION DE LA DEMO

Esta guia esta pensada para que montes un proyecto demo en `Azure DevOps` y luego dejes listas las demos de:

- `GitHub Copilot`
- `Azure DevOps MCP Server`
- narrativa de `Desarrollo Potenciado por Datos`

Te la dejo en el orden mas util:

1. Preparativos previos
2. Crear el proyecto en Azure DevOps
3. Crear areas e iteraciones
4. Crear el repositorio
5. Subir contenido base
6. Importar backlog
7. Crear pipeline
8. Crear ramas y pull requests
9. Configurar politicas de rama
10. Opcional: crear test plan
11. Preparar la demo tecnica
12. Ensayar y validar

## ARCHIVOS QUE YA TIENES EN ESTE WORKSPACE

Puedes apoyarte en estos archivos ya creados:

- [azure_devops_demo_blueprint.md](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure_devops_demo_blueprint.md>)
- [azure_devops_workitems_demo.csv](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure_devops_workitems_demo.csv>)
- [azure-pipelines-demo.yml](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure-pipelines-demo.yml>)
- [crear_proyecto_ado_demo.ps1](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/crear_proyecto_ado_demo.ps1>)
- [demos_en_vivo.md](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/demos_en_vivo.md>)
- [preparativos_tecnicos_demo.md](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/preparativos_tecnicos_demo.md>)

## 1. PREPARATIVOS PREVIOS

Antes de tocar Azure DevOps, confirma esto:

### 1.1 Permisos necesarios

Debes tener:

- permiso para crear proyectos, o
- que alguien de TI/Plataforma te cree el proyecto base.

Ademas, para trabajar tranquilo, conviene tener:

- permiso para crear repositorios,
- permiso para crear pipelines,
- permiso para crear work items,
- permiso para configurar branch policies.

### 1.2 Nombre recomendado del proyecto

Usa:

- `DESARROLLO-CON-DATOS`

### 1.3 Configuracion recomendada

- Visibilidad: `Private`
- Source control: `Git`
- Process: `Agile`

### 1.4 Que vas a montar

La version mas estable para demo es:

- 1 proyecto
- 1 repositorio principal
- 1 sprint activo
- 1 pipeline
- 1 PR abierto
- 1 PR completado
- backlog corto y conectado

## 2. CREAR EL PROYECTO EN AZURE DEVOPS

## Ruta por interfaz web

### Paso 2.1

Abre tu organizacion de Azure DevOps:

`https://dev.azure.com/TU_ORGANIZACION`

### Paso 2.2

En la pagina principal de proyectos:

- haz clic en `New project`

### Paso 2.3

Completa el formulario:

- Name: `DESARROLLO-CON-DATOS`
- Description: `Proyecto demo para Desarrollo Potenciado por Datos`
- Visibility: `Private`
- Advanced > Version control: `Git`
- Advanced > Work item process: `Agile`

### Paso 2.4

Haz clic en `Create`

### Resultado esperado

Debes quedar dentro del nuevo proyecto, con el menu lateral de:

- Boards
- Repos
- Pipelines
- Test Plans

## Ruta opcional por script

Si prefieres hacerlo por script:

1. Abre [crear_proyecto_ado_demo.ps1](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/crear_proyecto_ado_demo.ps1>)
2. Reemplaza:
   - `TU_ORGANIZACION`
3. Ejecutalo en PowerShell con Azure CLI autenticado

## 3. CREAR AREAS E ITERACIONES

## 3.1 Crear areas

### Paso 3.1.1

Dentro del proyecto:

- ve a `Project settings`

### Paso 3.1.2

En el panel izquierdo:

- entra a `Project configuration`
- selecciona `Areas`

### Paso 3.1.3

Sobre el nodo raiz del proyecto, crea estos nodos hijos:

- `Producto`
- `Backend`
- `Frontend`
- `QA`

### Resultado esperado

Debes ver algo como:

```text
DESARROLLO-CON-DATOS
  Producto
  Backend
  Frontend
  QA
```

## 3.2 Crear iteraciones

### Paso 3.2.1

En `Project settings > Project configuration`:

- entra a `Iterations`

### Paso 3.2.2

Sobre el nodo raiz, crea:

- `Release 1`

### Paso 3.2.3

Dentro de `Release 1`, crea:

- `Sprint 0 - Setup`
- `Sprint 1 - Desarrollo`
- `Sprint 2 - Integracion`
- `Sprint 3 - Pruebas`

### Resultado esperado

Debes ver:

```text
DESARROLLO-CON-DATOS
  Release 1
    Sprint 0 - Setup
    Sprint 1 - Desarrollo
    Sprint 2 - Integracion
    Sprint 3 - Pruebas
```

### Paso 3.2.4

Si Azure DevOps te deja definir fechas de sprint, configura:

- Sprint 0: semana previa
- Sprint 1: actual
- Sprint 2: siguiente
- Sprint 3: siguiente

### Recomendacion

Deja `Sprint 1 - Desarrollo` como el sprint principal de la demo.

## 4. CREAR EL REPOSITORIO

## 4.1 Crear repo por interfaz

### Paso 4.1.1

Ve a:

- `Repos`

### Paso 4.1.2

Si es el primer repo, Azure DevOps te puede mostrar la opcion para inicializarlo.

Si no, usa el selector de repositorios y elige:

- `New repository`

### Paso 4.1.3

Nombre del repo:

- `portal-servicios-demo`

### Paso 4.1.4

Si te da la opcion, crea el repo con `README`

### Resultado esperado

Debes tener un repo vacio o casi vacio, con rama:

- `main`

## 5. SUBIR CONTENIDO BASE AL REPO

## 5.1 Estructura recomendada

En tu maquina local crea una carpeta con esta estructura:

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

### Paso 5.1.1

Copia el pipeline base:

- toma [azure-pipelines-demo.yml](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure-pipelines-demo.yml>)
- guárdalo en el repo como:
  - `azure-pipelines.yml`

### Paso 5.1.2

Crea un `README.md` con algo simple como:

```md
# portal-servicios-demo

Repositorio demo para Desarrollo Potenciado por Datos.
```

### Paso 5.1.3

Agrega uno o dos archivos de codigo faciles de explicar.

Ejemplo:

- `src/api/requestsService.js`
- `src/web/requestsPage.js`
- `tests/unit/requestsService.test.js`

No tienen que ser complejos. La demo gana mas por claridad que por sofisticacion.

## 5.2 Subir el repo a Azure DevOps

### Opcion GUI

Puedes clonar el repo y subirlo desde VS Code.

### Opcion Git por terminal

En la carpeta local del repo:

```powershell
git init
git add .
git commit -m "chore: estructura base de demo"
git branch -m main
git remote add origin https://dev.azure.com/TU_ORGANIZACION/DESARROLLO-CON-DATOS/_git/portal-servicios-demo
git push -u origin main
```

### Resultado esperado

En `Repos > Files` debes ver:

- `README.md`
- `azure-pipelines.yml`
- carpetas `src`, `tests`, `docs`

## 6. IMPORTAR EL BACKLOG

## 6.1 Importar por CSV

### Paso 6.1.1

Ve a:

- `Boards`

### Paso 6.1.2

Abre:

- `Queries`

### Paso 6.1.3

Busca la opcion:

- `Import work items`

### Paso 6.1.4

Sube este archivo:

- [azure_devops_workitems_demo.csv](</C:/Users/juand/OneDrive/Documentos/Codex/AI aplicada a equipos de desarrollo/azure_devops_workitems_demo.csv>)

### Paso 6.1.5

Confirma la importacion

### Resultado esperado

Debes tener:

- 1 Epic
- 2 Features
- 4 User Stories
- 6 Tasks
- 2 Bugs

## 6.2 Crear relaciones entre items

El CSV que te dejé crea los work items, pero normalmente la jerarquia padre-hijo conviene terminarla a mano para la demo.

### Paso 6.2.1

Abre el Epic:

- `Portal de servicios internos basado en datos`

### Paso 6.2.2

En la seccion de links o relaciones:

- agrega como `Child` estas dos Features:
  - `Consulta y seguimiento de solicitudes`
  - `Alertas y visibilidad operativa`

### Paso 6.2.3

Abre la Feature `Consulta y seguimiento de solicitudes`

Agrega como `Child`:

- `Como analista quiero consultar solicitudes activas para priorizar atencion`
- `Como usuario quiero ver el detalle de una solicitud con su estado actual`

### Paso 6.2.4

Abre la Feature `Alertas y visibilidad operativa`

Agrega como `Child`:

- `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`
- `Como lider quiero contar con un resumen ejecutivo del estado operativo`

### Paso 6.2.5

Abre la User Story:

- `Como analista quiero consultar solicitudes activas para priorizar atencion`

Agrega como `Child`:

- `Crear endpoint para listar solicitudes`
- `Agregar filtro por estado y prioridad`
- `Agregar pruebas unitarias del endpoint`

### Paso 6.2.6

Abre la User Story:

- `Como usuario quiero ver el detalle de una solicitud con su estado actual`

Agrega como `Child`:

- `Construir vista web de consulta`

### Paso 6.2.7

Abre la User Story:

- `Como coordinador quiero ver solicitudes en riesgo para anticipar bloqueos`

Agrega como `Child`:

- `Crear servicio de resumen de riesgo`

### Paso 6.2.8

Abre la User Story:

- `Como lider quiero contar con un resumen ejecutivo del estado operativo`

Agrega como `Child`:

- `Documentar flujo principal`

### Paso 6.2.9

Relaciona los bugs:

- `Error al filtrar solicitudes por prioridad alta`
- `La vista de detalle no muestra el estado actualizado`

Como:

- `Related`, o
- `Child`

Mi recomendacion:

- `Related`

porque te da un discurso mas natural para demo de incidencia.

## 6.3 Ajustar estado y asignaciones

Para que la demo se vea viva:

- deja 1 User Story en `New`
- deja 1 User Story en `Active`
- deja 1 Task en `Closed`
- deja 1 Bug en `Active`

Si quieres, asigna work items a:

- tu usuario
- otro usuario de prueba

Eso mejora mucho las consultas tipo:

- `Show my assigned work items.`

## 7. CREAR LA PIPELINE

## 7.1 Crear pipeline desde YAML

### Paso 7.1.1

Ve a:

- `Pipelines`

### Paso 7.1.2

Haz clic en:

- `New pipeline`

### Paso 7.1.3

Cuando pregunte donde esta el codigo:

- selecciona `Azure Repos Git`

### Paso 7.1.4

Elige el repo:

- `portal-servicios-demo`

### Paso 7.1.5

Elige:

- `Existing Azure Pipelines YAML file`

### Paso 7.1.6

Selecciona:

- `/azure-pipelines.yml`

### Paso 7.1.7

Guarda y ejecuta la pipeline

### Resultado esperado

Debes tener una pipeline con al menos una corrida visible.

### Recomendacion para demo

Haz 2 ejecuciones:

- una exitosa,
- otra con warning o un fallo controlado si quieres mostrar riesgo.

## 8. CREAR RAMAS Y PULL REQUESTS

## 8.1 Crear ramas

Usa estas ramas:

- `feature/listado-solicitudes`
- `feature/resumen-riesgo`
- `bugfix/filtro-prioridad`

## 8.2 Crear un PR completado

### Paso 8.2.1

Trabaja en:

- `feature/listado-solicitudes`

### Paso 8.2.2

Haz un cambio pequeno y facil de explicar, por ejemplo:

- agregar README,
- agregar archivo de servicio,
- agregar filtro simple.

### Paso 8.2.3

Haz commit y push

### Paso 8.2.4

Crea PR hacia `main`

### Paso 8.2.5

Titulo recomendado:

- `feat: listar solicitudes activas`

### Paso 8.2.6

Vincula el PR a la User Story de consulta

### Paso 8.2.7

Completa el PR

## 8.3 Crear un PR abierto

### Paso 8.3.1

Trabaja en:

- `feature/resumen-riesgo`

### Paso 8.3.2

Haz un cambio pequeno, por ejemplo:

- agregar servicio de riesgo,
- agregar funcion con TODO,
- agregar prueba incompleta.

### Paso 8.3.3

Haz commit y push

### Paso 8.3.4

Crea PR hacia `main`

### Paso 8.3.5

Titulo recomendado:

- `feat: agregar resumen de riesgo para solicitudes`

### Paso 8.3.6

Dejalo abierto

### Resultado esperado

Debes tener:

- 1 PR completado
- 1 PR abierto

Eso te sirve para demo de:

- trazabilidad
- revisiones
- relacion con work items
- estado del delivery

## 9. CONFIGURAR POLITICAS DE RAMA

## 9.1 Abrir configuracion del repo

Ve a:

- `Repos`
- `Branches`

Busca:

- `main`

En el menu contextual:

- `Branch policies`

## 9.2 Activar estas politicas

### Politica 1

- `Require a minimum number of reviewers`
- valor recomendado: `1`

### Politica 2

- `Check for linked work items`
- activada

### Politica 3

- `Add Build Validation`
- usa la pipeline `ci-portal-servicios-demo`

### Opcional

- `Check for comment resolution`

### Resultado esperado

Cuando abras un PR, se vera mas realista porque mostrara:

- revisor requerido
- work item vinculado
- build de validacion

## 10. OPCIONAL: CREAR TEST PLAN

Si quieres incluir QA con mas fuerza:

### Paso 10.1

Ve a:

- `Test Plans`

### Paso 10.2

Crea un plan:

- `Sprint 1 Regression`

### Paso 10.3

Crea suites:

- `Consulta de solicitudes`
- `Detalle de solicitud`
- `Resumen de riesgo`

### Paso 10.4

Crea algunos casos:

- `Validar consulta de solicitudes activas`
- `Validar filtro por prioridad`
- `Validar vista de detalle`
- `Validar resumen de riesgo`

No necesitas muchos. Con 3 o 4 basta para la demo.

## 11. PREPARACION TECNICA DE LA DEMO

## 11.1 Preparar tu entorno

En tu equipo del presentador deja listo:

- `Visual Studio Code`
- `GitHub Copilot Chat`
- acceso al repo
- acceso al proyecto de Azure DevOps
- MCP configurado

Si usas el remoto, crea:

- `.vscode/mcp.json`

Con esta configuracion recomendada:

```json
{
  "servers": {
    "ado-remote-mcp": {
      "url": "https://mcp.dev.azure.com/TU_ORGANIZACION",
      "type": "http",
      "headers": {
        "X-MCP-Toolsets": "repos,wit,pipelines,testplan",
        "X-MCP-Readonly": "true"
      }
    }
  },
  "inputs": []
}
```

### Por que asi

- restringe herramientas
- evita escrituras accidentales
- mejora estabilidad de demo

## 11.2 Validar Copilot

En VS Code, abre Copilot Chat y prueba:

`Explain this file.`

Si responde bien, Copilot ya esta listo.

## 11.3 Validar MCP

Prueba:

`Show my assigned work items.`

Luego:

`What pull requests require my review?`

Luego:

`List recent failed pipeline runs for this project.`

Si esas tres responden, la demo ya esta en condiciones.

## 12. PREPARACION DEL CONTENIDO DE LA DEMO

## 12.1 Deja estos artefactos preparados

- 1 work item en riesgo
- 1 PR abierto
- 1 PR cerrado
- 1 pipeline visible
- 1 archivo de codigo facil de explicar

## 12.2 Ten identificados los nombres exactos

Antes de presentar, anota en un bloc:

- nombre del proyecto
- nombre del repo
- sprint actual
- titulo del PR abierto
- titulo del work item que usaras
- nombre del archivo que abriras

## 12.3 Deja prompts listos

### Prompt 1

`Muestrame mis work items asignados en la iteracion actual y resume cuales estan en riesgo o bloqueados.`

### Prompt 2

`De esos work items, dime cuales tienen pull requests abiertos o pipelines recientes con fallo.`

### Prompt 3

`Explica este archivo y dime que parte impactaria el work item que acabamos de revisar.`

### Prompt 4

`Propone dos pruebas unitarias para cubrir el caso principal y un escenario borde.`

### Prompt 5

`Resume en lenguaje ejecutivo el estado de esta funcionalidad, el riesgo principal y las tres acciones recomendadas.`

## 13. ENSAYO DE LA DEMO

Haz un ensayo completo, cronometro en mano.

### Tiempo ideal

- 8 a 10 minutos

### Flujo ideal

1. Sprint o work items
2. PR o pipeline
3. Codigo con Copilot
4. Resumen ejecutivo

### Que debes comprobar

- que no pide login inesperado
- que el MCP responde
- que no hay datos sensibles
- que el archivo de codigo abre bien
- que la pipeline aparece

## 14. PLAN B

## Si falla MCP

Haz demo solo de Copilot:

- explicar archivo
- proponer refactor
- generar pruebas
- resumir PR

## Si falla Copilot

Haz demo solo de contexto:

- work items
- PR abierto
- pipeline
- cierre verbal de valor

## Si falla todo

Ten 2 o 3 capturas listas:

- sprint
- PR
- pipeline

Y cuenta la historia sobre esas capturas.

## 15. CHECKLIST FINAL DE ULTIMO MINUTO

Antes de entrar a la sesion, valida esto:

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

## 16. REFERENCIAS OFICIALES

- Crear proyecto:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/organizations/projects/create-project?view=azure-devops)
- Crear repo:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/repos/git/creatingrepo?view=azure-devops)
- Importar work items por CSV:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/boards/queries/import-work-items-from-csv?view=azure-devops)
- Areas:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/organizations/settings/set-area-paths?view=azure-devops)
- Iteraciones:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/organizations/settings/set-iteration-paths-sprints?view=azure-devops)
- Branch policies:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/repos/git/branch-policies-overview?view=azure-devops)
- Crear pipeline:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/pipelines/create-first-pipeline?view=azure-devops)
- Azure DevOps MCP remoto:
  - [Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/mcp-server/remote-mcp-server?view=azure-devops)
- Copilot Chat en IDE:
  - [GitHub Docs](https://docs.github.com/en/copilot/how-tos/use-chat/use-chat-in-ide?tool=visualstudio)
