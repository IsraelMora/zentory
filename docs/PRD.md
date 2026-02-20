# 📦 Product Requirements Document (PRD): Zentory - Gestión de Inventario

## 1. Visión General

Zentory es una aplicación de gestión de inventario multiplataforma diseñada específicamente para pequeñas empresas y emprendedores. El enfoque principal es la simplicidad, la facilidad de uso y una interfaz de usuario limpia e intuitiva. Permite a los usuarios tener un control total de sus productos, costos, ingresos y movimientos diarios sin la fricción de sistemas empresariales complejos.

## 2. Público Objetivo

- Propietarios de pequeñas empresas, tiendas físicas o digitales, y emprendedores.
- Usuarios que buscan alejarse de hojas de cálculo o cuadernos y necesitan herramientas modernas sin complejidad.
- Personas con poco tiempo que necesitan ver rápidamente el estado de su negocio con una experiencia cómoda.

## 3. Objetivos (Goals & Non-Goals)

### ✅ Objetivos (Qué haremos)

- Crear una UI/UX fluida y minimalista, inspirada en "shadcn/ui", moderna e intuitiva.
- Contar con un "Resumen Comercial" visual y claro (Dashboard) para reflejar la salud del negocio.
- Gestión de productos focalizada en el costo y el ingreso (rentabilidad).
- Registro cronológico y simple de movimientos (Entradas y Salidas).
- Soporte para categorización opcional y subcategorías.
- Uso de imágenes para asociación visual rápida de productos.
- Desarrollo en Flutter y Appwrite (desde cero, multiplataforma).
- Roles de Administrador y Operador.
- Soporte nativo y automático para modo oscuro y claro.

### ❌ No Objetivos (Qué NO haremos por ahora - MVP)

- Escaneo de códigos de barras (físicos o mediante cámara).
- Modo offline (siempre requerirá conexión a internet para evitar complicaciones de sincronización).
- Alertas automáticas de nivel de stock bajo.
- Sistemas completos de facturación o pasarelas de pago.
- Gestión de múltiples sucursales complejas.

## 4. Stack Tecnológico

- **Frontend y Multiplataforma:** Flutter (Soporte actual o futuro para Web, iOS, Android, Desktop).
- **Backend as a Service (BaaS):** Appwrite (Autenticación, Bases de Datos, y Storage para archivos).
- **Librerías Core y Soporte Técnico:**
  - **Gestión de Estado:** `bloc` (Patrón BLoC estandarizado y predecible).
  - **Modelos y Generación:** `freezed` (Inmutabilidad, copias seguras y uniones).
  - **Formularios:** `reactive_forms` (Gestión de datos de formularios y validaciones complejas reactivas).
  - **Navegación:** `auto_route` (Generación de rutas y navegación fuertemente tipada).
  - **Inyección de Dependencias:** `injectable` (Mantenimiento del localizador de dependencias y servicios).
  - **Almacenamiento Local:** `sembast` (Base de datos NoSQL para manejo local de persistencia estructurada).
  - **Iconografía:** `lucide_icons` (Paquete de iconos consistentes, limpios y hermosos, perfectos para el estilo visual propuesto).
  - **Responsividad:** `sizer` (Herramienta para adaptar fluidamente UI y tipografías a diferentes pantallas y dispositivos).
  - **Variables de Entorno:** `envied` (Gestión segura y ofuscamiento de variables sensibles tipo API keys).

## 4.1. Arquitectura y Patrones de Diseño

El código base debe estar rígidamente estructurado y ser fácilmente escalable y testeable:

- **Clean Architecture:** Capas estrictas (Presentación, Dominio y Data). Inversión de dependencias para aislar la UI del acceso a datos.
- **Principios SOLID:** Código modular, enfocado en Single Responsibility y abstracciones claras en cada entidad y caso de uso del sistema.

## 5. Roles y Permisos

El sistema utilizará un esquema de control flexible pero riguroso en base a roles:

- **Administrador:** Acceso total. Puede gestionar al personal (crear, editar, suspender operadores) dentro del entorno de la empresa.
- **Operador:** Funciones del día a día. Gestiona productos, registra movimientos (entradas y salidas) y consulta el resumen. No tiene permiso para la administración de usuarios del sistema.

## 6. Funcionalidades Principales (Core Features)

### 6.1. Autenticación y Perfil

- Login mediante correo y contraseña.
- Recuperación de contraseña / Gestión de cuenta.
- Aplicación automática del Tema (Oscuro/Claro basado en el sistema del dispositivo).

### 6.2. Dashboard (Resumen Comercial)

- Primera vista tras iniciar sesión.
- **Métricas Globales Clave:** Cantidad total de artículos en el inventario, valor estimado en costos vs. valor potencial de venta.
- **Feed de Actividad:** Historial rápido con la lista de los últimos movimientos realizados en el sistema de manera cronológica.

### 6.3. Módulo de Productos (CRUD)

- **Campos Requeridos:** Nombre del producto, Costo (valor de adquisición), Ingreso (valor de venta), Stock actual.
- **Campos Opcionales:** Fotografía del producto (Subida a Appwrite Storage), Categoría / Subcategoría configurable por el usuario, Notas adicionales.
- Busquedas y listados ágiles, identificando artículos predominantemente por su imagen y nombre.

### 6.4. Módulo de Transacciones (Movimientos)

- **Tipos de Transacción:** Entrada (aumentar stock) y Salida (reducir stock).
- **Flujo Simplificado:**
  1. Buscar y seleccionar producto.
  2. Ingresar cantidad de entrada o salida.
  3. Agregar nota o motivo opcional.
  4. Guardar confirmando el cambio en el inventario.
- Logea quién (Operador/Admin), cuándo (fecha/hora) y qué (productos/cantidades).

## 7. Diseño, UI y UX

- **Armonía Visual y Widgets Base Genéricos:** Es **strictamente obligatorio** mantener consistencia en la línea gráfica. Para lograrlo, los componentes (botones, snackbars, dialogs/modals, textfields, cards) deben construirse como widgets genéricos, independientes y reutilizables. Si la aplicación usa un modal, **todos** los modales deben derivar de o invocar a un único `GenericModalBase`. Lo mismo aplica para alertas o inputs, asegurando uniformidad visual y evitando dependencias cruzadas con el contexto en el que se usen.
- **Estilo Visual y Paleta de Colores:** Los colores de toda la aplicación deben estar estrictamente definidos en `AppColors`. El estilo general será minimalista (inspirado en _shadcn/ui_), usando mucho espacio en blanco, separación limpia de elementos, bordes redondeados sutiles y buena tipografía, armonizando con tonos suaves y pasteles para los modos claro y oscuro.
- **Animaciones Sutiles:** Transiciones armónicas al cambiar de vista, micro-interacciones de hover o pressed, skeletons limpios durante tiempos de carga.
- **Ergonomía:** Formularios pensados; al pedir costos que aparezca un teclado o pad numérico, optimización a pocos taps para realizar inserciones frecuentes.
