# 🤖 Guía de Desarrollo Asistido por IA (AI_DEVELOPMENT_PLAN)

Este documento sirve como "memoria" y manual de instrucciones estricto para mí (el Asistente de IA) a la hora de escribir, estructurar y validar el código de este proyecto. Debo leer y aplicar estas directrices antes de implementar cualquier nueva tarjeta o funcionalidad de `TASKS.md`.

## 1. Reglas Arquitectónicas y de Código (Innegociables)

1. **Clean Architecture Estricta (Layer-first):** Todo el proyecto se estructurará centralizado en capas principales a nivel raíz (`lib/domain`, `lib/data`, `lib/presentation`, `lib/core`, `lib/common`) para evitar el anidamiento excesivo de carpetas por feature. En cada capa los archivos sí pueden organizarse por módulos.
   - `lib/data`: Modelos DTOs, llamadas a Appwrite, Sembast y repsitorios concretos.
   - `lib/domain`: Entidades core, abstracciones de repositorios (interfaces), Casos de Uso (Use Cases). Cero dependencias de Flutter framework aquí.
   - `lib/presentation`: Formularios, Vistas (pantallas), Rutas y Gestión de Estado (`bloc`/`cubit`).
   - `lib/core`: Utilidades, configuraciones globales, Inyección de Dependencias, extensiones y código transversal.
     - `core/di`: Configuración de dependencias (Injectable).
     - `core/env`: Variables de entorno.
     - `core/theme`: Archivos de estilo, paletas (Catppuccin) y configuración de ThemeData.
     - `core/router`: Sistema automático de navegación.
   - `lib/common`: Widgets Genéricos y Reusables (botones, modales, etc.), formateadores y recursos compartidos que no pertenecen a la lógica de negocio pero son ubicuos en la app.
2. **Principios SOLID:** Cada clase debe tener una única responsabilidad. Preferir inyección de dependencias (vía `injectable` pasadas por constructor) en lugar de instanciamientos acoplados o Singletons estáticos locales.
3. **Inmutabilidad y Generación de Código:** Utiliza SIEMPRE `freezed` para los modelos del dominio y los estados del Bloc. Nunca mutar clases directamente.

## 2. Stack Tecnológico a Utilizar

No usar librerías externas para estas funciones que no sean las especificadas:

- **Gestión de Estado:** `flutter_bloc` (Blocs o Cubits según complejidad).
- **Rutas:** `auto_route` (Rutas tipadas, generadas con build_runner).
- **Inyección de Dependencia:** `injectable` (junto a `get_it`).
- **Data Local:** `sembast` para persistencia o caché de sesión.
- **Backend Remoto:** `appwrite` (Autenticación, BBDD y Storage).
- **Formularios robustos:** `reactive_forms`.
- **Adaptabilidad UI:** `sizer` en las dimensiones predeterminadas (ej. `10.w`, `5.h`).
- **Iconos:** `lucide_icons`.
- **Variables de Entorno:** `envied` (Todo endpoint, Project ID o secret key DEBE ir en `.env` y exponerse a través de la clase `Env` generada).

## 3. Directrices de UI/UX (Estilo Minimalista)

1. **Regla del Widget Genérico:** Antes de montar una vista, debo crear Componentes Genéricos (Botones, Textfields, Modales, Tarjetas). JAMÁS acoplar diseño a una vista en específico directamente.
   - _Ejemplo:_ Si necesito pedir un Input, uso un `ZentoryTextField` (que internamente envuelve el padding, bordes redondeados, etc), no construyo el `TextField` crudo en la pantalla.
2. **Constantes de UI (Sizer):** Absolutamente TODOS los espaciados, bordes y fuentes deben referenciarse desde `app_ui_constants.dart` (clases `AppSpacing`, `AppRadius`, `AppFontSize`). Están construidos con `sizer` (`.w`, `.h`, `.sp`) para escalado fluido. Jamás poner valores de números fijos tipo `padding: EdgeInsets.all(16)`.
3. **Cero Hardcodeo de Estilos (Innegociable):** NINGÚN widget debe tener color explícito (`color: Colors.red`) o estilos de texto (`style: TextStyle(fontSize: 14)`). Todo aspecto visual DEBE provenir forzosamente desde `Theme.of(context).colorScheme...` o `Theme.of(context).textTheme...`. Las excepciones son márgenes y bordes que deben venir desde la regla anterior (`AppSpacing`, `AppRadius`).
4. **Paleta de Colores Base:** Utilizar estrictamente los colores de la aplicación definidos en `AppColors` (con variantes `light` y `dark`). El diseño se rige bajo una paleta pastel y equilibrada (basada conceptualmente en esquemas suaves).
5. **Minimalismo Shadcn:** Aplicar mucho espacio (`SizedBox` o paddings holgados), cero estilos desordenados, y uso eficiente de los radios constantes ya definidos en las variables de UI.
6. **Ergonomía:** Configurar el `TextInputType` adecuado en todos los formularios (números, email, etc) de `reactive_forms`.

## 4. Flujo de Trabajo (Para la IA)

Cuando se me pida iniciar una nueva tarea de `TASKS.md`:

1. **Paso 1: Entender el Dominio.** Antes de tocar UI, crear la entidad (Domain) y el caso de uso si es necesario.
2. **Paso 2: Generar y Conectar Capas.** Crear Repositorios (Domain/Data) registrados en `injectable`.
3. **Paso 3: Construir el Estado.** Programar el Bloc/Cubit basado en Freezed.
4. **Paso 4: Construir UI Genérica.** Programar la UI y montar sobre Widgets Genéricos.
5. **Paso 5: Integración y Generación.** Correr comandos de build (`flutter pub run build_runner build -d`) tras modificar dependencias o rutas.

---

_Nota para la IA: Si en algún momento una sugerencia externa propone romper estas capas, volver a leer este documento y rechazar la petición cordialmente, ofreciendo la solución dentro del paradigma Clean Architecture._
