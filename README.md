# 🎓 Plataforma COCUDI Docente — PLE / PLN para Docentes Universitarios

> **Creado por:** José Roberto Mendoza Mendoza  
> **Institución:** IBERO Puebla  
> **Versión:** 1.0

Plantilla libre y abierta para que **docentes universitarios** construyan y publiquen su propio **Entorno Personal de Aprendizaje (PLE)** y **Red Personal de Aprendizaje (PLN)** en GitHub Pages, paso a paso y sin necesidad de saber programar. Diseñada especialmente para la red de universidades jesuitas.

---

## ¿Qué contiene esta plantilla?

| Archivo | Descripción |
|---------|-------------|
| `index.html` | Builder interactivo de 7 pasos (PLE completo + publicación en GitHub) |
| `ple.html` | Página pública de tu PLE personalizado |
| `pln-feed.html` | Feed tipo Flipboard con fuentes en español y tarjetas personales |
| `student-config.json` | Tu configuración personal (se actualiza automáticamente con el builder) |
| `data/feeds.json` | Caché de artículos RSS (se actualiza automáticamente con GitHub Actions) |
| `scripts/fetch_feeds.py` | Script Python para obtener artículos en tiempo real |
| `.github/workflows/update-feeds.yml` | Automatización que actualiza el feed cada 6 horas |

---

## Guía para el docente — Cómo empezar

### Paso 1: Crea tu cuenta en GitHub

1. Ve a **[github.com/join](https://github.com/join)**
2. Elige un nombre de usuario profesional (tu nombre o iniciales)
3. Usa tu correo institucional
4. Confirma tu cuenta

### Paso 2: Haz fork de esta plantilla

1. Entra a: **[github.com/68sfszbqhq-stack/PLATAFORMA-COCUDI-DOCENTE](https://github.com/68sfszbqhq-stack/PLATAFORMA-COCUDI-DOCENTE)**
2. Haz clic en el botón **Fork** (esquina superior derecha)
3. En "Repository name" puedes dejar `PLATAFORMA-COCUDI-DOCENTE` o escribir algo propio, ej. `mi-ple-docente`
4. Haz clic en **Create fork**

### Paso 3: Activa GitHub Pages

1. En tu fork, ve a **Settings** (pestaña superior)
2. En el menú lateral izquierdo → **Pages**
3. En "Source" selecciona **Deploy from a branch**
4. Branch → **main** → carpeta **/ (root)**
5. Haz clic en **Save**
6. Espera 2-3 minutos y tu sitio estará en:  
   `https://TU-USUARIO.github.io/PLATAFORMA-COCUDI-DOCENTE/`

### Paso 4: Crea tu Personal Access Token

El token permite que el builder guarde tu configuración automáticamente en GitHub.

1. Ve a: **github.com/settings/tokens/new** → activa el scope **repo**
2. En **Note** escribe: `PLE Docente`
3. En **Expiration** elige **No expiration**
4. Haz clic en **Generate token**
5. **Copia el token** (empieza con `ghp_`) — solo lo verás una vez

### Paso 5: Usa el builder

1. Abre tu sitio de GitHub Pages: `https://TU-USUARIO.github.io/PLATAFORMA-COCUDI-DOCENTE/`
2. Se mostrará el **Setup Wizard** — sigue los 7 pasos
3. En el **Paso 7** ingresa tu usuario, nombre del repo y token
4. Haz clic en **Guardar en mi GitHub**

Tu PLE ya está en línea. Cada vez que hagas cambios y guardes, el sitio se actualiza en 30-60 segundos.

---

## Estructura del builder (7 pasos)

| Paso | Sección | Qué construyes |
|------|---------|----------------|
| 1 | **Mi Identidad** | Nombre, universidad, área, materia, período académico, foto |
| 2 | **Mi Apariencia** | Fondo, colores, cita motivacional |
| 3 | **Mi Portada y Contexto** | Título del PLE, contexto académico, propósito, valoración |
| 4 | **Mi Ecosistema Digital** | 6 nodos (Busco, Organizo, Creo, Colaboro, Comparto, Publico) |
| 5 | **Mi Red PLN** | Temas y unidades de tu materia con recursos propios |
| 6 | **Mi PLN Feed** | Categorías activas y tarjetas de recursos personales |
| 7 | **Publicar en GitHub** | Conectar cuenta y publicar en línea |

---

## Personalización de temas (Paso 5)

El builder es completamente abierto: tú defines los temas, unidades o bloques de tu materia. Puedes:

- **Agregar** tantos temas como quieras (botón "+ Agregar nuevo tema")
- **Nombrarlos** como prefieras: "Unidad 1", "Módulo A", "Semana 3", etc.
- **Agruparlos** por bloque si tu materia tiene una estructura mayor
- **Enlazar recursos** de cualquier tipo: YouTube, artículos, libros, plataformas

No hay una estructura predefinida — la plantilla se adapta a cualquier materia y nivel universitario.

---

## Feed en vivo (opcional)

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

**Creador:**  
**José Roberto Mendoza Mendoza**  
Docente — IBERO Puebla

Plantilla de uso libre para fines educativos. Puedes adaptarla, mejorarla y compartirla siempre que mantengas la atribución al autor original.

Repositorio original: [github.com/68sfszbqhq-stack/PLATAFORMA-COCUDI-DOCENTE](https://github.com/68sfszbqhq-stack/PLATAFORMA-COCUDI-DOCENTE)
