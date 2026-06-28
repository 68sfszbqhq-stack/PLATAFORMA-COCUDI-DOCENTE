# 🎓 PLN Cultura Digital — Plantilla para Alumnos

> **Creado por:** José Roberto Mendoza Mendoza  
> **Institución:** IBERO Puebla  
> **Asignatura:** Cultura Digital — MCCEMS SEP 2025  
> **Versión:** 1.0

Plantilla libre y abierta para que los alumnos de la certificación **Cultura Digital (MCCEMS SEP 2025)** construyan y publiquen su propio **Entorno Personal de Aprendizaje (PLE)** y **Red Personal de Aprendizaje (PLN)** en GitHub Pages, paso a paso y sin necesidad de saber programar.

---

## ¿Qué contiene esta plantilla?

| Archivo | Descripción |
|---------|-------------|
| `index.html` | Builder interactivo de 7 pasos (PLE completo + publicación en GitHub) |
| `pln-feed.html` | Feed tipo Flipboard con fuentes en español y tarjetas personales |
| `student-config.json` | Tu configuración personal (este archivo se actualiza con el builder) |
| `data/feeds.json` | Caché de artículos RSS (se actualiza automáticamente con GitHub Actions) |
| `scripts/fetch_feeds.py` | Script Python para obtener artículos en tiempo real |
| `.github/workflows/update-feeds.yml` | Automatización que actualiza el feed cada 6 horas |

---

## Guía para el alumno — Cómo empezar

### Paso 1: Crea tu cuenta en GitHub

1. Ve a **[github.com/join](https://github.com/join)**
2. Elige un nombre de usuario profesional (tu nombre o iniciales)
3. Usa tu correo institucional
4. Confirma tu cuenta

### Paso 2: Haz fork de esta plantilla

1. Entra a: **[github.com/68sfszbqhq-stack/PLN-CD-Plantilla](https://github.com/68sfszbqhq-stack/PLN-CD-Plantilla)**
2. Haz clic en el botón **Fork** (esquina superior derecha)
3. En "Repository name" deja `PLN-CD-Plantilla` o escribe tu nombre, ej. `mi-pln-cultura-digital`
4. Haz clic en **Create fork**

### Paso 3: Activa GitHub Pages

1. En tu fork, ve a **Settings** (pestaña superior)
2. En el menú lateral izquierdo → **Pages**
3. En "Source" selecciona **Deploy from a branch**
4. Branch → **main** → carpeta **/ (root)**
5. Haz clic en **Save**
6. Espera 2-3 minutos y tu sitio estará en:  
   `https://TU-USUARIO.github.io/PLN-CD-Plantilla/`

### Paso 4: Crea tu Personal Access Token

El token permite que el builder guarde tu configuración automáticamente en GitHub.

1. Ve a: **[github.com/settings/tokens/new?scopes=repo&description=PLN-Cultura-Digital](https://github.com/settings/tokens/new?scopes=repo&description=PLN-Cultura-Digital)**
2. En **Note** escribe: `PLN Cultura Digital`
3. En **Expiration** elige **No expiration**
4. En **Select scopes** activa **repo** (el primero de la lista)
5. Haz clic en **Generate token**
6. **Copia el token** (empieza con `ghp_`) — solo lo verás una vez

### Paso 5: Usa el builder

1. Abre tu sitio de GitHub Pages: `https://TU-USUARIO.github.io/PLN-CD-Plantilla/`
2. Se mostrará el **Setup Wizard** — sigue los pasos
3. En el **Paso 7** ingresa tu usuario, nombre del repo y token
4. Haz clic en **Guardar en mi GitHub**

Tu PLN ya está en línea. Cada vez que hagas cambios y guardes, el sitio se actualiza en 30-60 segundos.

---

## Estructura del builder (7 pasos)

| Paso | Sección | Qué construyes |
|------|---------|----------------|
| 1 | **Mi Identidad** | Nombre, institución, semestre, foto de perfil |
| 2 | **Mi Apariencia** | Fondo, colores, cita motivacional |
| 3 | **Mi Portada y Contexto** | Título del PLE, contexto académico, propósito, valoración |
| 4 | **Mi Ecosistema Digital** | 6 nodos (Busco, Organizo, Creo, Colaboro, Comparto, Publico) |
| 5 | **Mi Red PLN** | 9 temas MCCEMS con recursos: YouTube, Platzi, SEP, etc. |
| 6 | **Mi PLN Feed** | Categorías activas y tarjetas de recursos propios |
| 7 | **Publicar en GitHub** | Conectar cuenta y publicar en línea |

---

## Temas MCCEMS incluidos

### Cultura Digital I
- Ciudadanía Digital y Ética en la Red
- Seguridad Digital e Identidad en Línea
- Hardware, Software y Evolución Tecnológica

### Cultura Digital II
- Aprendizaje Colaborativo y Herramientas Digitales
- Gestión de Datos e Información Digital
- Creación de Contenidos y Marca Personal Digital

### Cultura Digital III
- Pensamiento Computacional y Programación Básica
- Cómo Funciona Internet y las Redes Digitales
- Difusión del Conocimiento y Ciudadanía Digital Avanzada

---

## Para el docente — Cómo compartir con tus alumnos

1. Comparte este enlace con tus alumnos: `https://github.com/68sfszbqhq-stack/PLN-CD-Plantilla`
2. Cada alumno hace su propio fork (copia personal)
3. El PLN de cada alumno vive en su propia URL de GitHub Pages
4. Puedes ver el trabajo de cada alumno accediendo a su URL pública

### Opciones de entrega

- **Evidencia digital**: El alumno comparte su URL de GitHub Pages
- **Evaluación de proceso**: Revisa los commits en GitHub (fecha y hora de cada guardado)
- **Portfolio**: El PLN queda como portfolio profesional del alumno después del curso

---

## Feed en vivo (opcional — para alumnos avanzados)

La plantilla incluye un sistema de actualización automática de noticias en español:

1. En tu fork, ve a **Actions** → activa los workflows
2. El script `scripts/fetch_feeds.py` se ejecuta automáticamente cada 6 horas
3. Actualiza `data/feeds.json` con artículos de Xataka, Hipertextual, Educación 3.0, Psyciencia y más

Para ejecutar manualmente:
```bash
pip install -r scripts/requirements.txt
python3 scripts/fetch_feeds.py
```

---

## Tecnologías usadas

- **HTML5 + CSS3 + JavaScript vanilla** — sin frameworks, sin dependencias complejas
- **GitHub Pages** — hosting gratuito directamente desde tu repo
- **GitHub REST API** — para guardar cambios desde el navegador
- **localStorage + sessionStorage** — auto-guardado local (el token nunca se sube al repo)
- **feedparser + BeautifulSoup** — para obtener artículos RSS en español

---

## Créditos y licencia

**Creador y docente responsable:**  
**José Roberto Mendoza Mendoza**  
Docente de Cultura Digital — IBERO Puebla  
MCCEMS SEP 2025

Plantilla de uso libre para fines educativos. Puedes adaptarla, mejorarla y compartirla siempre que mantengas la atribución al autor original.

Repositorio original: [github.com/68sfszbqhq-stack/PLN-CD-Plantilla](https://github.com/68sfszbqhq-stack/PLN-CD-Plantilla)
