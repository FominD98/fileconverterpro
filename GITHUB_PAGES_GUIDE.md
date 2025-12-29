# 🚀 GitHub Pages Deployment Guide

## Как работает на GitHub Pages

GitHub Pages не поддерживает server-side redirects, но мы используем **smart 404 redirect** для SPA:

1. Пользователь заходит на `fileconverter.store/ru`
2. GitHub Pages возвращает `404.html`
3. `404.html` перенаправляет на `index.html?p=/ru`
4. JavaScript восстанавливает правильный URL: `fileconverter.store/ru`
5. Контент загружается на нужном языке

✅ **Преимущества:**
- Работает без сервера
- Поддерживает все языки
- Бесплатный SSL
- CDN от GitHub

⚠️ **Ограничения:**
- Небольшая задержка при первом заходе (redirect)
- Google может индексировать медленнее (но работает)

---

## 📋 Шаг 1: Подготовка репозитория

### Вариант A: Новый репозиторий

1. Создайте новый репозиторий на GitHub:
   - Имя: `file-converter-landing` (или любое)
   - Public (для бесплатного GitHub Pages)
   - **НЕ** добавляйте README, .gitignore

2. Инициализируйте Git в папке проекта:

```bash
cd C:\pet\FileConverter\landing-page

# Инициализация Git
git init

# Добавьте все файлы
git add .

# Первый коммит
git commit -m "Initial commit: File Converter Pro landing page"

# Подключите GitHub репозиторий
git remote add origin https://github.com/fomind98/file-converter-landing.git

# Отправьте код
git branch -M main
git push -u origin main
```

---

### Вариант B: Существующий репозиторий

Если у вас уже есть репозиторий с проектом:

```bash
cd C:\pet\FileConverter\landing-page

# Добавьте файлы
git add .

# Коммит
git commit -m "Add multilingual landing page with SEO optimization"

# Push
git push
```

---

## 🌐 Шаг 2: Включение GitHub Pages

### Способ 1: Через настройки (UI)

1. Перейдите в ваш репозиторий на GitHub
2. **Settings** → **Pages** (слева в меню)
3. **Source**: Deploy from a branch
4. **Branch**: `main` → **/ (root)** → Save
5. Подождите 1-2 минуты

✅ Ваш сайт будет доступен по адресу:
```
https://fomind98.github.io/file-converter-landing/
```

---

### Способ 2: GitHub Actions (рекомендуется)

Создайте файл `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Setup Pages
        uses: actions/configure-pages@v3

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: '.'

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

**Затем:**
1. Settings → Pages
2. Source: **GitHub Actions**
3. Push изменения - автоматический деплой!

---

## 🔧 Шаг 3: Настройка (важно!)

### A. Обновите sitemap.xml

Замените `fileconverter.store` на ваш GitHub Pages URL:

```xml
<!-- Было: -->
<loc>https://fileconverter.store/en</loc>

<!-- Стало: -->
<loc>https://fomind98.github.io/file-converter-landing/en</loc>
```

**Для subdirectory** (если репозиторий не в корне):

Обновите `404.html`:
```javascript
var pathSegmentsToKeep = 1; // Было 0, стало 1 для subdirectory
```

---

### B. Обновите robots.txt

```
User-agent: *
Allow: /

Sitemap: https://fomind98.github.io/file-converter-landing/sitemap.xml
```

---

### C. Если используете subdirectory (repository-name)

В `script.js` обновите базовый путь:

```javascript
// Для subdirectory добавьте basePath
const BASE_PATH = '/file-converter-landing'; // Ваше имя репозитория

function updateURL(langCode, replaceState = false) {
    const newPath = `${BASE_PATH}/${langCode}`;
    const newURL = window.location.origin + newPath + window.location.search + window.location.hash;
    // ...
}
```

**ИЛИ** используйте custom domain (см. ниже).

---

## 🎨 Шаг 4: Custom Domain (опционально)

### Купите домен и настройте:

1. **Купите домен** (Namecheap, Google Domains, и т.д.)

2. **Добавьте DNS записи:**

**Вариант A: Apex domain** (fileconverter.store):
```
A    @    185.199.108.153
A    @    185.199.109.153
A    @    185.199.110.153
A    @    185.199.111.153
```

**Вариант B: Subdomain** (www.fileconverter.store):
```
CNAME    www    fomind98.github.io
```

3. **В GitHub Settings → Pages:**
   - Custom domain: `fileconverter.store` (или `www.fileconverter.store`)
   - ✅ Enforce HTTPS

4. **Создайте файл `CNAME`** в корне:
```
fileconverter.store
```

5. **Обновите sitemap.xml и robots.txt:**
```xml
<loc>https://fileconverter.store/en</loc>
```

---

## ✅ Шаг 5: Проверка

### 1. Проверьте работу сайта:

```
https://fomind98.github.io/file-converter-landing/
https://fomind98.github.io/file-converter-landing/en
https://fomind98.github.io/file-converter-landing/ru
```

### 2. Проверьте redirect:

1. Откройте DevTools (F12)
2. Network tab
3. Зайдите на `/ru`
4. Должен быть redirect: 404 → index.html → /ru

### 3. Проверьте meta tags:

Откройте консоль:
```javascript
document.title // Должен быть на русском
document.querySelector('meta[name="description"]').content
```

### 4. Проверьте sitemap:

```
https://fomind98.github.io/file-converter-landing/sitemap.xml
```

### 5. Проверьте robots.txt:

```
https://fomind98.github.io/file-converter-landing/robots.txt
```

---

## 📊 Шаг 6: SEO настройка

### Google Search Console

1. Перейдите в [Google Search Console](https://search.google.com/search-console)
2. **Add Property** → URL prefix
3. Введите: `https://fomind98.github.io/file-converter-landing/`
4. Подтвердите через HTML file или meta tag
5. **Sitemaps** → Add: `sitemap.xml`

### Bing Webmaster Tools

1. [Bing Webmaster](https://www.bing.com/webmasters)
2. Add site
3. Submit sitemap

---

## 🐛 Troubleshooting

### Проблема: 404 на всех страницах

**Решение:**
- Проверьте что `404.html` загружен в репозиторий
- Подождите 5 минут после push

### Проблема: Неправильный URL после redirect

**Решение для subdirectory:**

В `404.html` измените:
```javascript
var pathSegmentsToKeep = 1; // Для subdirectory
```

### Проблема: CSS/JS не загружаются

**Решение:**

Проверьте пути в `index.html`:
```html
<!-- Для subdirectory используйте относительные пути -->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- НЕ /assets/css/styles.css -->
```

### Проблема: Язык не переключается

**Решение:**

1. Откройте DevTools Console
2. Проверьте ошибки
3. Убедитесь что `translations.js` загружается

---

## 🔄 Обновление сайта

### Простой способ:

```bash
# Внесите изменения в файлы
# Затем:

git add .
git commit -m "Update landing page"
git push

# GitHub Pages автоматически обновится через 1-2 минуты
```

---

## 📱 Дополнительные настройки

### Google Analytics (опционально)

Добавьте в `<head>` в `index.html`:

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

### Open Graph Image

Убедитесь что `assets/images/og-image.png` существует:
- 1200x630px
- < 8MB
- Хорошее качество

---

## 📋 Checklist

- [ ] Создан репозиторий на GitHub
- [ ] Код загружен в репозиторий
- [ ] GitHub Pages включен
- [ ] 404.html присутствует
- [ ] sitemap.xml обновлен с правильным URL
- [ ] robots.txt обновлен
- [ ] Сайт работает: `/en`, `/ru`, `/es`
- [ ] Sitemap отправлен в Google Search Console
- [ ] (Опционально) Custom domain настроен
- [ ] (Опционально) Google Analytics добавлен

---

## 🎉 Готово!

Ваш landing page на GitHub Pages:
- ✅ Поддерживает 16 языков
- ✅ SEO оптимизирован
- ✅ Бесплатный хостинг
- ✅ HTTPS включен
- ✅ CDN от GitHub

**URL:** `https://fomind98.github.io/file-converter-landing/`

---

## 💡 Дополнительные ресурсы

- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [Custom Domain Setup](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [GitHub Actions for Pages](https://github.com/actions/deploy-pages)

---

## 🆘 Нужна помощь?

1. Проверьте Actions tab в репозитории на ошибки
2. Проверьте browser console (F12)
3. GitHub Pages status: Settings → Pages

**Типичные проблемы:**
- Забыли `404.html` → добавьте
- Неправильный path для subdirectory → обновите `pathSegmentsToKeep`
- CSS не загружается → используйте относительные пути
