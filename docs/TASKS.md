# 🛠️ Plan de Tareas de Desarrollo: Zentory

Este documento divide el **PRD** en tareas de desarrollo accionables, secuenciales y modulares. Puede usarse como tablero Kanban para gestionar el avance del diseño y código.

## Fase 1: Setup e Infraestructura Base 🚀

_(Fundamentos técnicos para soportar toda la aplicación)_

- [x] **Tarea 1.1:** Inicializar proyecto de Flutter y organizar estructura de carpetas basándose firmemente en **Clean Architecture** (Capas: Domain, Data, Presentation) y cumpliendo principios **SOLID**. Instalar dependencias core (`bloc`, `freezed`, `reactive_forms`, `auto_route`, `injectable`, `sembast`, `lucide_icons`, `sizer`, `envied`).
- [x] **Tarea 1.2:** Configurar proyecto y plataforma destino (Web, Android, etc.) en Appwrite Console. Copiar el `Endpoint` y `ProjectID`.
- [x] **Tarea 1.3:** Agregar SDK de Appwrite e implementar Inyección de Dependencias. Utilizar `injectable` para registrar todos los servicios y clientes (Auth, DB, Storage y base de datos local pre-cacheada con `sembast`).
- [x] **Tarea 1.4:** Crear y aplicar el Tema Global de Flutter. Definir la paleta de colores base para temas claros y oscuros en `AppColors`. Tipografías y adaptación automática deben seguir lineamientos visuales limpios tipo _shadcn_.
- [x] **Tarea 1.5:** Implementar sistema de Navegación con `auto_route`. Crear páginas base (Splash, Login, Dashboard) y configurar la clase principal de enrutamiento.
- [x] **Tarea 1.6:** Configurar generadores de código. Instalar `build_runner` y lanzar la primera generación de archivos para `freezed`, `injectable` y `auto_route`.

## Fase 2: Autenticación, Roles y Usuarios 🔐

_(Control de entrada a la plataforma y permisos de seguridad)_

- [x] **Tarea 2.1:** Diseñar y construir la interfaz gráfica (UI) de `LoginView` para correo y contraseña.
- [x] **Tarea 2.2:** Flujo de Login y creación de sesión asociadas conectadas con Appwrite `Account` API.
- [ ] **Tarea 2.3:** Modelo de Control de Acceso y Roles. Crear perfil de la empresa donde se distinga un esquema Administrador / Operador vinculados a Appwrite.
- [ ] **Tarea 2.4:** Redirección condicional (Router Handler). Si está logueado va al Dashboard, si no, va a Login.
- [ ] **Tarea 2.5:** Crear Módulo de Administración de Personal (solo accesible si el usuario activo es tipo `Admin`). Pantalla para ver usuarios actuales e invitar o suspender Operadores.

## Fase 3: Modelado de Base de Datos y Storage en Appwrite 🗄️

_(La base de la información debe estar lista antes de armar interfaces operativas)_

- [ ] **Tarea 3.1:** En Appwrite Console, crear la base de datos principal (`Database`) y Colección `Categories` (Atributos: name, colorCode, parentId [opcional]).
- [ ] **Tarea 3.2:** Crear Colección `Products` (Atributos: name, cost [double], price/income [double], stock [integer], imageId, categoryId).
- [ ] **Tarea 3.3:** Crear Colección `Movements` (Atributos: productId, type [string enum: IN/OUT], quantity, userId, date, notes).
- [ ] **Tarea 3.4:** Crear y configurar un Bucket en Storage para "Product Images". Definir políticas estrictas de lectura y escritura para la autenticación de los usuarios.
- [ ] **Tarea 3.5:** Aplicar Reglas y Permisos en TODAS las colecciones del proyecto en Appwrite de manera que los operadores del proyecto puedan leer/escribir.

## Fase 4: Módulo de Productos (CRUD) 📦

_(Gestión del inventario permanente)_

- [ ] **Tarea 4.1:** UI - Construir vista listado de productos (`ProductsListView`). Cards minimalistas con resumen de costo/ingreso/stock y foto descriptiva.
- [ ] **Tarea 4.2:** Integrar con Appwrite - Logica para obtener productos de Firebase y aplicar Búsqueda rápida/Filtros locales (por nombre o categorías).
- [ ] **Tarea 4.3:** UI/Integración - Vista y formulario de `Create/Edit Product`.
- [ ] **Tarea 4.4:** Picker de imágenes. Logica de subir imagen local usando Appwrite Storage y asociar la ruta/ID generada al documento de Producto para completarlo.
- [ ] **Tarea 4.5:** (Opcional - Requisito Secundario) Logica para crear/seleccionar categorías configurable directamente en el formulario del producto.

## Fase 5: Módulo de Movimientos (Entradas y Salidas) 🔄

_(Gestión dinámica del día a día)_

- [ ] **Tarea 5.1:** UI - Construir pantalla operativa rápida para Asentar un movimiento (Botón flotante en todo momento -> Selector de Tipo IN/OUT -> Escoger producto -> cantidad).
- [ ] **Tarea 5.2:** Lógica para grabar el documento transaccional del movimiento en la colección `Movements` de Appwrite.
- [ ] **Tarea 5.3:** Lógica de Consistencia (Transacción). Actualizar en Appwrite: luego de registrar el movimiento en `Movements`, sumar o restar esa cantidad al documento específico dentro de `Products`.
- [ ] **Tarea 5.4:** Validar en UI (opcional en lógica de BD en appwrite Functions si aplica) para prohibir restar el stock dejándolo bajo 0 o notificar amablemente que la venta/salida agota y supera el stock.

## Fase 6: Dashboard y Analítica (El Resumen Comercial) 📊

_(La central de mando de la app)_

- [ ] **Tarea 6.1:** UI - Construir diseño del Dashboard. Tarjetas de métricas consolidadas estilo _dashboard moderno_ en la parte superior. Historias o Feed tipo lista en el espacio inferior.
- [ ] **Tarea 6.2:** Lógica Global - Obtener cálculos de todo el inventario de la colección `Products` para sumar el stock total, el total costos invertidos y ganancias potenciales.
- [ ] **Tarea 6.3:** Lógica Feed - Obtener un límite de los últimos N `Movements` desde Appwrite y mostrar al usuario su historial reciente, mapeando IDs o cruzando datos con la foto del producto involucrado.

## Fase 7: Estabilización, Pulido y Cierre ✨

_(Mejorar la delicia del usuario al usar)_

- [ ] **Tarea 7.1:** Skeleton Loaders y estados Vacíos (Empty States visualmente lindos) cuando aún no hay movimientos ni productos.
- [ ] **Tarea 7.2:** Test manual de modo Claro a Modo Oscuro de todo el panel y vistas para corregir tipografías invisibles o contrastes incorrectos.
- [ ] **Tarea 7.3:** Manejo de Errores - Implementar _Toasts_ o _Snackbars_ con estilo cuando falla la conexión con el endpoint de appwrite o falla la validación del usuario en ingreso de datos.
- [ ] **Tarea 7.4:** Test final de los **Widgets Genéricos Reusables** que se construyeron durante el desarrollo (Botones, Textfields, Modales estilo shadcn) asegurando que no haya acoplamientos ni dependencias rotas en las vistas (Web/Móvil).
