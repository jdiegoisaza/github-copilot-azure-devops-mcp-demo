# Desarrollo Potenciado por Datos

Kit publico para preparar una demo o taller sobre:

- Desarrollo Potenciado por Datos
- GitHub Copilot
- Azure DevOps MCP Server

Este repositorio reune materiales tecnicos y de apoyo para:

- montar un proyecto demo en Azure DevOps,
- preparar un entorno de demo con Copilot y MCP,
- ejecutar una sesion con narrativa, prompts y plan de contingencia,
- compartir un paso a paso reutilizable con otras personas.

## Contenido

### `docs/`

- `azure_devops_demo_blueprint.md`
  - blueprint del proyecto demo en Azure DevOps
- `paso_a_paso_ado_demo_detallado.md`
  - guia detallada de montaje del proyecto y preparacion de la demo
- `preparativos_tecnicos_demo.md`
  - prerequisitos y configuracion tecnica para expositor y participantes
- `demos_en_vivo.md`
  - guion de demos, prompts y plan B
- `slides_texto_exacto.md`
  - texto exacto sugerido para diapositivas
- `guion_expositor.md`
  - guion del expositor slide por slide

### `scripts/`

- `crear_proyecto_ado_demo.ps1`
  - script base para crear proyecto, areas e iteraciones

### `templates/`

- `azure_devops_workitems_demo.csv`
  - backlog de ejemplo con areas e iteraciones
- `azure_devops_workitems_demo_sin_rutas.csv`
  - backlog alternativo sin rutas, util cuando la importacion por CSV falla por `Area Path` o `Iteration Path`
- `mcp.remote.example.json`
  - ejemplo de configuracion para Azure DevOps MCP remoto
- `mcp.local.example.json`
  - ejemplo de configuracion para Azure DevOps MCP local

### `pipelines/`

- `azure-pipelines.yml`
  - pipeline base para la demo

## Orden recomendado de uso

1. Leer `docs/paso_a_paso_ado_demo_detallado.md`
2. Revisar `docs/azure_devops_demo_blueprint.md`
3. Crear el proyecto con `scripts/crear_proyecto_ado_demo.ps1` o por interfaz
4. Importar `templates/azure_devops_workitems_demo.csv`
5. Si falla la importacion por rutas, usar `templates/azure_devops_workitems_demo_sin_rutas.csv`
6. Subir `pipelines/azure-pipelines.yml` al repo demo
7. Preparar el entorno tecnico con `docs/preparativos_tecnicos_demo.md`
8. Ensayar usando `docs/demos_en_vivo.md`

## Recomendacion de publicacion

Antes de publicar, revisa:

- nombres de organizacion o proyecto
- cuentas de correo
- capturas o referencias internas
- datos sensibles o de clientes

## Notas

- El material esta pensado para `Azure DevOps`, `GitHub Copilot` y `Visual Studio Code`.
- El Azure DevOps MCP remoto depende de autenticacion con `Microsoft Entra ID`.
- Si el remoto no es viable, la ruta recomendada es `MCP local con PAT`.
