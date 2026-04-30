# AZURE DEVOPS MCP: 35 HERRAMIENTAS

Esta guia resume las **35 herramientas** que quedan disponibles en la configuracion remota recomendada para el taller.

La referencia es este archivo del repositorio:

- [`../templates/mcp.remote.example.json`](../templates/mcp.remote.example.json)

Esa configuracion usa:

- `X-MCP-Toolsets: repos,wit,pipelines,testplan`
- `X-MCP-Readonly: true`

Por eso esta lista habla de **35 herramientas de consulta**. Si cambian toolsets, activan `Insiders`, quitan `read-only` o usan el servidor local, el numero y el alcance cambian.

## Que significa esta lista

No estamos documentando todo el universo posible del servidor local de Azure DevOps MCP. Estamos documentando la **configuracion publica y replicable del taller**.

En esta configuracion:

- se puede consultar contexto real de Azure DevOps
- se puede navegar entre backlog, PRs, pipelines y pruebas
- se puede descargar artefactos y leer logs
- no se crean ni modifican recursos

## Las 35 herramientas

## 1. Core

| Herramienta | Para que sirve | Alcance |
| --- | --- | --- |
| `core_list_projects` | Lista proyectos de la organizacion. | Solo lectura |
| `core_list_project_teams` | Lista equipos de un proyecto. | Solo lectura |

## 2. Repositorios y Pull Requests

Importante: en el servidor remoto varias operaciones de repositorio se agrupan en tools con `action`.

| Herramienta | Acciones principales | Para que sirve | Alcance |
| --- | --- | --- | --- |
| `repo_pull_request` | `get`, `list`, `list_by_commits` | Consultar PRs, su detalle o encontrar PRs por commit. | Solo lectura |
| `repo_pull_request_thread` | `list`, `list_comments` | Ver hilos de comentarios y respuestas en PRs. | Solo lectura |
| `repo_repository` | `get`, `list` | Consultar repositorios de un proyecto. | Solo lectura |
| `repo_branch` | `get`, `list`, `list_mine` | Consultar ramas del repo y ramas asociadas al usuario actual. | Solo lectura |
| `repo_file` | `get_content`, `list_directory` | Leer archivos y recorrer carpetas del repositorio. | Solo lectura |
| `repo_search_commits` | N/A | Buscar commits por texto, autor, fecha y otros filtros. | Solo lectura |

## 3. Work Items

| Herramienta | Para que sirve | Alcance |
| --- | --- | --- |
| `wit_list_backlogs` | Lista backlogs de un equipo. | Solo lectura |
| `wit_list_backlog_work_items` | Lista items dentro de un backlog. | Solo lectura |
| `wit_get_work_item` | Obtiene un work item por ID. | Solo lectura |
| `wit_get_work_items_batch_by_ids` | Obtiene varios work items por ID. | Solo lectura |
| `wit_list_work_item_comments` | Lista comentarios de un work item. | Solo lectura |
| `wit_list_work_item_revisions` | Lista revisiones e historial de un work item. | Solo lectura |
| `wit_get_work_items_for_iteration` | Lista work items de una iteracion. | Solo lectura |
| `wit_my_work_items` | Lista work items relevantes o asignados al usuario actual. | Solo lectura |
| `wit_get_work_item_type` | Consulta definicion de un tipo de work item. | Solo lectura |
| `wit_get_query` | Obtiene una query guardada por ID o ruta. | Solo lectura |
| `wit_get_query_results_by_id` | Ejecuta una query guardada y devuelve resultados. | Solo lectura |
| `search_workitem` | Hace busqueda full-text sobre work items. | Solo lectura |

## 4. Pipelines

| Herramienta | Para que sirve | Alcance |
| --- | --- | --- |
| `pipelines_get_build_definitions` | Lista definiciones de build o pipeline. | Solo lectura |
| `pipelines_get_build_definition_revisions` | Consulta revisiones de una definicion. | Solo lectura |
| `pipelines_get_builds` | Lista builds de un proyecto. | Solo lectura |
| `pipelines_get_build_changes` | Consulta cambios asociados a una build. | Solo lectura |
| `pipelines_get_build_status` | Consulta estado de una build. | Solo lectura |
| `pipelines_get_build_log` | Recupera logs completos de una build. | Solo lectura |
| `pipelines_get_build_log_by_id` | Recupera un log especifico por ID. | Solo lectura |
| `pipelines_get_run` | Consulta el detalle de una corrida. | Solo lectura |
| `pipelines_list_runs` | Lista corridas de una pipeline. | Solo lectura |
| `pipelines_list_artifacts` | Lista artefactos generados por una build. | Solo lectura |
| `pipelines_download_artifact` | Descarga un artefacto de build. | Solo lectura |

## 5. Test Plans

| Herramienta | Para que sirve | Alcance |
| --- | --- | --- |
| `testplan_list_test_plans` | Lista test plans de un proyecto. | Solo lectura |
| `testplan_list_test_suites` | Lista test suites dentro de un test plan. | Solo lectura |
| `testplan_list_test_cases` | Lista test cases de una suite. | Solo lectura |
| `testplan_show_test_results_from_build_id` | Obtiene resultados de pruebas a partir de una build. | Solo lectura |

## Que es lo maximo que puede hacer

Con estas 35 herramientas, en la configuracion del taller, Azure DevOps MCP puede:

- Leer el portafolio operativo del proyecto:
  - proyectos
  - equipos
  - backlogs
  - trabajo asociado a iteraciones
- Leer y correlacionar trabajo:
  - work items
  - comentarios
  - revisiones
  - queries guardadas
  - resultados de busquedas
- Leer colaboracion tecnica:
  - repositorios
  - ramas
  - archivos
  - commits
  - pull requests
  - comentarios de PR
- Leer estado de entrega:
  - pipelines
  - builds
  - cambios asociados
  - logs
  - corridas
  - artefactos
- Leer contexto de calidad:
  - test plans
  - test suites
  - test cases
  - resultados de pruebas por build

En terminos practicos, eso permite que un asistente:

- responda preguntas sobre el estado del sprint
- conecte work items con PRs y builds
- encuentre riesgos de entrega
- resuma incidentes visibles en logs
- ayude a preparar seguimiento tecnico o ejecutivo

## Que no hace en esta configuracion

Como esta guia se basa en `read-only`, esta configuracion **no**:

- crea work items
- actualiza work items
- agrega comentarios
- crea ramas
- crea o actualiza PRs
- ejecuta pipelines
- crea test plans o test cases

En otras palabras: **ve, correlaciona, resume y orienta; no ejecuta cambios**.

## Hasta donde puede llegar fuera de esta configuracion

Si se quita `X-MCP-Readonly: true` o si se usa una configuracion mas amplia, Azure DevOps MCP tambien puede habilitar operaciones de escritura. Segun la documentacion oficial remota y el toolset oficial del servidor local, el alcance puede ampliarse a:

- crear y actualizar work items
- enlazar work items entre si o con PRs
- agregar comentarios
- crear ramas
- crear y actualizar pull requests
- gestionar reviewers o votos
- crear o actualizar paginas wiki
- crear iteraciones
- crear test plans, suites y casos
- ejecutar pipelines o actualizar stages

Ademas, el **servidor local** hoy expone un catalogo mas amplio que el remoto publicado, incluyendo otras areas como:

- wiki
- work
- advanced security

## Limitantes reales

Estas son las limitaciones mas importantes que conviene explicar al publico:

### 1. Depende del contexto y de permisos reales

El servidor no inventa acceso. Si la cuenta no puede ver un proyecto, un PR o una pipeline, MCP tampoco podra hacerlo.

### 2. El remoto sigue en `public preview`

La documentacion oficial indica que el servidor remoto sigue en version preliminar publica. Eso significa:

- cambios posibles en nombres o cobertura
- comportamiento no totalmente estable
- soporte todavia acotado

### 3. No todos los clientes estan soportados

Segun Microsoft, hoy la ruta oficialmente soportada para el remoto es:

- `Visual Studio Code`
- `Visual Studio`

Otros clientes requieren pasos adicionales de registro OAuth y no estan listos como ruta general.

### 4. La lista de tools puede cambiar

La propia documentacion del remoto advierte que la lista publicada puede no reflejar siempre los cambios mas recientes.

### 5. Algunas capacidades dependen de `Insiders`

Ejemplo:

- `wit_query_by_wiql` aparece documentada como disponible solo con `X-MCP-Insiders`

Por eso una organizacion no deberia disenar un flujo critico sobre una capacidad experimental sin validarlo antes.

### 6. Leer no significa comprender perfectamente

Aunque MCP puede traer el dato correcto, el modelo igual puede:

- resumir mal
- priorizar mal
- omitir matices
- interpretar mal una relacion tecnica

Siempre hace falta validacion humana.

### 7. No reemplaza gobierno ni proceso

MCP acelera acceso al contexto, pero no reemplaza:

- criterios de aprobacion
- revisiones de codigo
- control de cambios
- segregacion de funciones
- decision de negocio

## Recomendacion para el taller

Si van a exponer esta capacidad a una audiencia mixta, la forma mas clara de explicarla es esta:

- GitHub Copilot aporta asistencia conversacional y tecnica.
- Azure DevOps MCP aporta contexto real del trabajo.
- Juntos permiten pasar de informacion dispersa a accion mejor preparada.

## Nota sobre el numero 35

El numero **35** aplica a esta combinacion:

- servidor remoto
- toolsets `repos,wit,pipelines,testplan`
- modo `read-only`
- sin activar capacidades `Insiders`

Si cambian cualquiera de esas variables, el inventario cambia tambien.

## Fuentes oficiales

- Microsoft Learn, `Set up the remote Azure DevOps MCP Server (preview)`:
  - https://learn.microsoft.com/en-us/azure/devops/mcp-server/remote-mcp-server?view=azure-devops
- Repositorio oficial de Microsoft, `azure-devops-mcp`:
  - https://github.com/microsoft/azure-devops-mcp
- Toolset oficial del servidor local:
  - https://github.com/microsoft/azure-devops-mcp/blob/main/docs/TOOLSET.md
