# 🚀 File Converter Pro - Landing Page

Многоязычный SEO-оптимизированный landing page для File Converter Pro.

## ✨ Возможности

- 🌍 **16 языков** - EN, RU, ES, FR, DE, IT, PT, PL, NL, TR, UK, JA, KO, ZH, AR, HI
- 🔍 **SEO оптимизирован** - hreflang, dynamic meta tags, sitemap, canonical URLs
- 📱 **Mobile-friendly** - полностью адаптивный дизайн с hamburger menu
- ⚡ **Fast loading** - оптимизация, кеширование, CDN ready
- 🎯 **Clean URLs** - `/en`, `/ru`, `/es` через History API
- 🔒 **Secure** - security headers, HTTPS ready
- 🤖 **SEO Tools** - sitemap.xml, robots.txt, structured data

## 📁 Структура проекта

```
landing-page/
├── index.html                      # Основная страница (SPA)
├── 404.html                        # GitHub Pages redirect для SPA
├── sitemap.xml                     # SEO sitemap со всеми языками
├── robots.txt                      # Правила для поисковых ботов
├── .htaccess                       # Apache configuration
├── _redirects                      # Netlify redirects
├── netlify.toml                    # Netlify configuration
├── vercel.json                     # Vercel configuration
├── CNAME.example                   # Custom domain example
├── .github/
│   └── workflows/
│       └── deploy.yml              # GitHub Actions auto-deploy
├── assets/
│   ├── css/
│   │   └── styles.css              # Все стили + responsive
│   ├── js/
│   │   ├── script.js               # Логика + History API + SEO
│   │   └── translations.js         # Переводы на 16 языков
│   └── images/
│       ├── icon.png                # Логотип (512x512px)
│       ├── screenshot.png          # Скриншот приложения
│       └── og-image.png            # Open Graph (1200x630px)
├── SEO_DEPLOYMENT_GUIDE.md         # Полный SEO guide
├── GITHUB_PAGES_GUIDE.md           # GitHub Pages деплой
├── TRANSLATION_GUIDE.md            # Руководство по переводам
└── README.md                       # Этот файл
```

## 🚀 Quick Start

### Вариант 1: GitHub Pages (бесплатно) ⭐

**Подробная инструкция:** [GITHUB_PAGES_GUIDE.md](GITHUB_PAGES_GUIDE.md)

```bash
# 1. Инициализируйте Git
cd C:\pet\FileConverter\landing-page
git init
git add .
git commit -m "Initial commit: Multilingual landing page"

# 2. Создайте репозиторий на GitHub и push
git remote add origin https://github.com/your-username/file-converter-landing.git
git branch -M main
git push -u origin main

# 3. Включите GitHub Pages:
# GitHub → Settings → Pages → Source: GitHub Actions
```

**Результат:** `https://your-username.github.io/file-converter-landing/`

---

### Вариант 2: Netlify (рекомендуется для production)

1. Зарегистрируйтесь на [netlify.com](https://netlify.com)
2. Drag & drop папку `landing-page` или подключите Git
3. Deploy автоматически! ✨

**Конфигурация:** `_redirects` и `netlify.toml` уже готовы

---

### Вариант 3: Vercel

```bash
npm i -g vercel
cd landing-page
vercel
```

**Конфигурация:** `vercel.json` уже готов

---

### Вариант 4: Apache Server

Загрузите файлы на сервер. `.htaccess` уже настроен для:
- SPA routing
- Security headers
- Gzip compression
- Browser caching

---

## 🌐 Многоязычность

### URL структура:

```
yoursite.com/en  → English (default)
yoursite.com/ru  → Русский
yoursite.com/es  → Español
yoursite.com/fr  → Français
yoursite.com/de  → Deutsch
yoursite.com/it  → Italiano
... и еще 10 языков
```

### Как работает:

1. **Автоопределение языка:**
   - Проверка URL (`/ru`, `/en`)
   - localStorage (сохраненный выбор)
   - Язык браузера
   - Default: английский

2. **Смена языка:**
   - Клик на языковой селектор
   - URL обновляется через History API
   - Все meta tags обновляются динамически
   - Кнопка назад/вперед работает

3. **SEO:**
   - Hreflang tags для всех языков
   - Canonical URLs
   - Dynamic meta tags (title, description, OG)
   - Sitemap со всеми версиями

**Подробнее:** [TRANSLATION_GUIDE.md](TRANSLATION_GUIDE.md)

---

## 🔍 SEO Оптимизация

### Что реализовано:

✅ **Dynamic Meta Tags**
- `<title>` для каждого языка
- `<meta name="description">`
- Open Graph (Facebook, LinkedIn)
- Twitter Cards

✅ **Hreflang Tags**
```html
<link rel="alternate" hreflang="en" href=".../en"/>
<link rel="alternate" hreflang="ru" href=".../ru"/>
<!-- ... для всех 16 языков -->
<link rel="alternate" hreflang="x-default" href=".../en"/>
```

✅ **Canonical URLs**
- Предотвращает дублирование контента

✅ **Sitemap.xml**
- Все языковые версии
- Правильные hreflang связи
- Приоритеты для каждого языка

✅ **Robots.txt**
- Разрешает индексацию всех языков
- Ссылка на sitemap

✅ **Structured Data**
- Schema.org SoftwareApplication

### После деплоя:

1. **Google Search Console:**
   - Добавьте сайт
   - Отправьте `sitemap.xml`
   - Проверьте hreflang

2. **Проверьте индексацию:**
   ```
   site:yoursite.com
   site:yoursite.com/ru
   ```

**Полный guide:** [SEO_DEPLOYMENT_GUIDE.md](SEO_DEPLOYMENT_GUIDE.md)

---

## 📱 Мобильная адаптация

### Features:

- 📱 **Hamburger menu** - для мобильных
- 👆 **Touch-friendly** - все элементы минимум 44px
- 📐 **Responsive typography** - масштабируется
- 🎨 **Adaptive layouts** - от 320px до 4K

### Breakpoints:

- **Desktop:** > 1024px
- **Tablet:** 768px - 1024px
- **Mobile:** 480px - 768px
- **Small mobile:** < 480px
- **Landscape mobile:** отдельная оптимизация

---

## 🔧 Настройка

### 1. Обновите домен

**В `sitemap.xml`:**
```xml
<!-- Замените yoursite.com -->
<loc>https://yoursite.com/en</loc>
```

**В `robots.txt`:**
```
Sitemap: https://yoursite.com/sitemap.xml
```

---

### 2. Custom Domain (опционально)

Для GitHub Pages:

1. Переименуйте `CNAME.example` → `CNAME`
2. Впишите ваш домен:
   ```
   yoursite.com
   ```
3. Настройте DNS (см. [GITHUB_PAGES_GUIDE.md](GITHUB_PAGES_GUIDE.md))

---

### 3. Обновите контент

**Переводы** в `assets/js/translations.js`:

```javascript
'en-US': {
    hero: {
        title: 'Your Custom Title',
        subtitle: 'Your Description',
        // ...
    }
}
```

**Изображения:**
- `assets/images/icon.png` - 512x512px
- `assets/images/screenshot.png` - скриншот приложения
- `assets/images/og-image.png` - 1200x630px для соцсетей

---

### 4. Google Analytics (опционально)

В `<head>` в `index.html`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## 🎨 Кастомизация

### Цвета

В `assets/css/styles.css`:

```css
:root {
    --primary-color: #6366f1;      /* Основной */
    --secondary-color: #8b5cf6;    /* Вторичный */
    --accent-color: #ec4899;       /* Акцент */
    /* ... */
}
```

### Шрифты

По умолчанию: **Inter** (Google Fonts)

Для замены обновите в `index.html` и `styles.css`

---

## 🌍 Поддерживаемые языки

| Код  | Язык              | Priority |
|------|-------------------|----------|
| en   | English           | 1.0      |
| ru   | Русский           | 0.9      |
| es   | Español           | 0.8      |
| fr   | Français          | 0.8      |
| de   | Deutsch           | 0.8      |
| it   | Italiano          | 0.8      |
| pt   | Português         | 0.7      |
| pl   | Polski            | 0.7      |
| nl   | Nederlands        | 0.7      |
| tr   | Türkçe            | 0.7      |
| uk   | Українська        | 0.7      |
| ja   | 日本語            | 0.7      |
| ko   | 한국어            | 0.7      |
| zh   | 简体中文          | 0.7      |
| ar   | العربية           | 0.7      |
| hi   | हिन्दी            | 0.7      |

**Добавить язык:** см. [TRANSLATION_GUIDE.md](TRANSLATION_GUIDE.md)

---

## ⚡ Performance

### Оптимизации:

- ✅ Gzip/Brotli compression
- ✅ Browser caching
- ✅ CDN ready
- ✅ Lazy loading изображений
- ✅ Минимальный JS (vanilla, без frameworks)
- ✅ Оптимизированный CSS

### Рекомендуется:

1. Оптимизируйте изображения (WebP)
2. Используйте CDN для assets
3. Enable HTTP/2 на сервере

**Цель Lighthouse:**
- Performance: > 90
- SEO: 100
- Accessibility: > 90

---

## 🐛 Troubleshooting

### Язык не переключается

1. Откройте Console (F12)
2. Проверьте ошибки
3. Убедитесь что `translations.js` загружен

### 404 на GitHub Pages

- Проверьте что `404.html` в репозитории
- Подождите 5 минут после push

### Неправильный URL после redirect

Для GitHub Pages в subdirectory, обновите `404.html`:
```javascript
var pathSegmentsToKeep = 1; // Было 0
```

---

## ✅ Checklist перед публикацией

- [ ] Замените `yoursite.com` в sitemap.xml
- [ ] Замените `yoursite.com` в robots.txt
- [ ] Обновите Open Graph image (1200x630px)
- [ ] Проверьте все переводы
- [ ] Протестируйте на мобильных
- [ ] Протестируйте смену языков
- [ ] Отправьте sitemap в Google Search Console
- [ ] Настройте custom domain (если нужно)
- [ ] Добавьте Google Analytics (если нужно)
- [ ] Проверьте Lighthouse score

---

## 📖 Документация

- [SEO & Deployment Guide](SEO_DEPLOYMENT_GUIDE.md) - полный SEO guide
- [GitHub Pages Guide](GITHUB_PAGES_GUIDE.md) - деплой на GitHub Pages
- [Translation Guide](TRANSLATION_GUIDE.md) - работа с переводами

---

## 🔗 Полезные ссылки

- [Microsoft Store](https://apps.microsoft.com/store/detail/9P94416WP5C8)
- [Google Search Console](https://search.google.com/search-console)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [Mobile-Friendly Test](https://search.google.com/test/mobile-friendly)
- [Rich Results Test](https://search.google.com/test/rich-results)

---

## 📝 License

MIT License - свободно используйте для своих проектов.

---

## 💬 Support

Если нужна помощь:
1. Проверьте документацию
2. Откройте browser console (F12)
3. Проверьте GitHub Pages/Netlify status

---

**Разработано с ❤️ для File Converter Pro**

© 2025 HorusL. Все права защищены.
