#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Автоматическое добавление data-i18n атрибутов ко всем текстовым элементам
"""

import re

# Читаем HTML файл
with open('index.html', 'r', encoding='utf-8') as f:
    html = f.read()

# Список замен для добавления data-i18n
replacements = [
    # Format tabs
    (r'<button class="format-tab active" data-tab="images">',
     r'<button class="format-tab active" data-tab="images" data-i18n="formats.tabs.images">'),
    (r'<button class="format-tab" data-tab="documents">',
     r'<button class="format-tab" data-tab="documents" data-i18n="formats.tabs.documents">'),
    (r'<button class="format-tab" data-tab="data">',
     r'<button class="format-tab" data-tab="data" data-i18n="formats.tabs.data">'),
    (r'<button class="format-tab" data-tab="media">',
     r'<button class="format-tab" data-tab="media" data-i18n="formats.tabs.media">'),

    # Format descriptions
    (r'<p class="format-description">\s*Конвертируйте между всеми популярными форматами изображений',
     r'<p class="format-description" data-i18n="formats.descriptions.images">\n                        Конвертируйте между всеми популярными форматами изображений'),
    (r'<p class="format-description">\s*Профессиональная конвертация документов',
     r'<p class="format-description" data-i18n="formats.descriptions.documents">\n                        Профессиональная конвертация документов'),
    (r'<p class="format-description">\s*Конвертируйте табличные данные между Excel',
     r'<p class="format-description" data-i18n="formats.descriptions.data">\n                        Конвертируйте табличные данные между Excel'),
    (r'<p class="format-description">\s*Конвертация видео и аудио файлов',
     r'<p class="format-description" data-i18n="formats.descriptions.media">\n                        Конвертация видео и аудио файлов'),

    # Steps
    (r'<h3 class="step__title">Добавьте файлы</h3>',
     r'<h3 class="step__title" data-i18n="howItWorks.steps.step1.title">Добавьте файлы</h3>'),
    (r'<p class="step__description">\s*Перетащите файлы в окно приложения',
     r'<p class="step__description" data-i18n="howItWorks.steps.step1.desc">\n                        Перетащите файлы в окно приложения'),
    (r'<h3 class="step__title">Выберите формат</h3>',
     r'<h3 class="step__title" data-i18n="howItWorks.steps.step2.title">Выберите формат</h3>'),
    (r'<p class="step__description">\s*Выберите желаемый формат конвертации',
     r'<p class="step__description" data-i18n="howItWorks.steps.step2.desc">\n                        Выберите желаемый формат конвертации'),
    (r'<h3 class="step__title">Получите результат</h3>',
     r'<h3 class="step__title" data-i18n="howItWorks.steps.step3.title">Получите результат</h3>'),
    (r'<p class="step__description">\s*Дождитесь завершения конвертации',
     r'<p class="step__description" data-i18n="howItWorks.steps.step3.desc">\n                        Дождитесь завершения конвертации'),

    # Pricing
    (r'<div class="pricing-card__badge">Лучшее предложение</div>',
     r'<div class="pricing-card__badge" data-i18n="pricing.badge">Лучшее предложение</div>'),
    (r'<h3 class="pricing-card__title">File Converter Pro</h3>',
     r'<h3 class="pricing-card__title" data-i18n="pricing.appTitle">File Converter Pro</h3>'),
    (r'<p class="pricing-card__subtitle">Разовая покупка навсегда</p>',
     r'<p class="pricing-card__subtitle" data-i18n="pricing.oneTime">Разовая покупка навсегда</p>'),
    (r'<p class="pricing-card__note">Доступна бесплатная пробная версия</p>',
     r'<p class="pricing-card__note" data-i18n="pricing.trial">Доступна бесплатная пробная версия</p>'),

    # CTA
    (r'<h2 class="cta__title">Готовы начать конвертацию файлов\?</h2>',
     r'<h2 class="cta__title" data-i18n="cta.title">Готовы начать конвертацию файлов?</h2>'),
    (r'<p class="cta__subtitle">\s*Присоединяйтесь к тысячам пользователей',
     r'<p class="cta__subtitle" data-i18n="cta.subtitle">\n                    Присоединяйтесь к тысячам пользователей'),
    (r'<p class="cta__features">\s*✓ Разовая покупка навсегда',
     r'<p class="cta__features" data-i18n="cta.features">\n                    ✓ Разовая покупка навсегда'),
]

# Применяем замены
for pattern, replacement in replacements:
    html = re.sub(pattern, replacement, html, flags=re.MULTILINE | re.DOTALL)

# Сохраняем измененный HTML
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(html)

print("✅ Все data-i18n атрибуты добавлены!")
