/**
 * File Converter Pro - Landing Page JavaScript
 * Handles interactive features, animations, and user interactions
 */

// ============================================
// Configuration
// ============================================
const CONFIG = {
    // YouTube video ID - UPDATE THIS when you have the video
    youtubeVideoId: '', // Will be set dynamically or by user

    // Smooth scroll offset for fixed header
    scrollOffset: 80,

    // Animation delays
    scrollRevealDelay: 100
};

// ============================================
// DOM Elements
// ============================================
const elements = {
    formatTabs: document.querySelectorAll('.format-tab'),
    formatContents: document.querySelectorAll('.format-content'),
    faqQuestions: document.querySelectorAll('.faq-question'),
    faqItems: document.querySelectorAll('.faq-item'),
    videoPlaceholder: document.getElementById('videoPlaceholder'),
    videoContainer: document.getElementById('videoContainer'),
    scrollRevealElements: document.querySelectorAll('.scroll-reveal')
};

// ============================================
// Format Tabs Functionality
// ============================================
function initFormatTabs() {
    elements.formatTabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const targetTab = tab.dataset.tab;

            // Remove active class from all tabs and contents
            elements.formatTabs.forEach(t => t.classList.remove('active'));
            elements.formatContents.forEach(c => c.classList.remove('active'));

            // Add active class to clicked tab
            tab.classList.add('active');

            // Show corresponding content
            const targetContent = document.querySelector(`[data-content="${targetTab}"]`);
            if (targetContent) {
                targetContent.classList.add('active');
            }
        });
    });
}

// ============================================
// FAQ Accordion Functionality
// ============================================
function initFAQ() {
    elements.faqQuestions.forEach((question, index) => {
        question.addEventListener('click', () => {
            const faqItem = elements.faqItems[index];
            const isActive = faqItem.classList.contains('active');

            // Close all FAQ items
            elements.faqItems.forEach(item => item.classList.remove('active'));

            // Toggle clicked item
            if (!isActive) {
                faqItem.classList.add('active');
            }
        });
    });
}

// ============================================
// Video Player Functionality
// ============================================
function initVideoPlayer() {
    if (!elements.videoPlaceholder || !elements.videoContainer) return;

    elements.videoPlaceholder.addEventListener('click', () => {
        loadYouTubeVideo();
    });
}

function loadYouTubeVideo() {
    // Get video ID from data attribute or config
    const videoId = elements.videoPlaceholder.dataset.videoId || CONFIG.youtubeVideoId;

    if (!videoId) {
        alert('Видео скоро будет доступно! Video ID not set yet.');
        return;
    }

    // Create YouTube iframe
    const iframe = document.createElement('iframe');
    iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1&rel=0`;
    iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture';
    iframe.allowFullscreen = true;

    // Hide placeholder and show video
    elements.videoPlaceholder.style.display = 'none';
    elements.videoContainer.style.display = 'block';
    elements.videoContainer.appendChild(iframe);

    // Track video load event
    trackEvent('video', 'load', videoId);
}

// Helper function to set YouTube video ID dynamically
function setYouTubeVideoId(videoId) {
    CONFIG.youtubeVideoId = videoId;
    if (elements.videoPlaceholder) {
        elements.videoPlaceholder.dataset.videoId = videoId;
    }
}

// ============================================
// Smooth Scrolling
// ============================================
function initSmoothScrolling() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');

            // Don't prevent default for just "#"
            if (href === '#') return;

            e.preventDefault();

            const targetId = href.substring(1);
            const targetElement = document.getElementById(targetId);

            if (targetElement) {
                const offsetTop = targetElement.offsetTop - CONFIG.scrollOffset;

                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });

                // Update URL without scrolling
                history.pushState(null, null, href);
            }
        });
    });
}

// ============================================
// Scroll Reveal Animation
// ============================================
function initScrollReveal() {
    if (!elements.scrollRevealElements.length) return;

    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.classList.add('revealed');
                }, CONFIG.scrollRevealDelay);

                // Unobserve after revealing
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    elements.scrollRevealElements.forEach(el => {
        observer.observe(el);
    });
}

// ============================================
// Header Scroll Effect
// ============================================
function initHeaderScrollEffect() {
    const header = document.querySelector('.header');
    if (!header) return;

    let lastScroll = 0;

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        if (currentScroll > 100) {
            header.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
        } else {
            header.style.boxShadow = '0 1px 2px 0 rgba(0, 0, 0, 0.05)';
        }

        lastScroll = currentScroll;
    });
}

// ============================================
// Analytics & Tracking
// ============================================
function trackEvent(category, action, label) {
    // Google Analytics tracking (if available)
    if (typeof gtag !== 'undefined') {
        gtag('event', action, {
            'event_category': category,
            'event_label': label
        });
    }

    // Console log for debugging
    console.log(`Event tracked: ${category} - ${action} - ${label}`);
}

// Track button clicks
function initEventTracking() {
    // Track CTA buttons
    document.querySelectorAll('.btn--primary').forEach(btn => {
        btn.addEventListener('click', () => {
            const btnText = btn.textContent.trim();
            trackEvent('cta', 'click', btnText);
        });
    });

    // Track format tab clicks
    elements.formatTabs.forEach(tab => {
        tab.addEventListener('click', () => {
            trackEvent('formats', 'view', tab.dataset.tab);
        });
    });
}

// ============================================
// Performance Optimization
// ============================================
function initLazyLoading() {
    // Lazy load images
    const images = document.querySelectorAll('img[data-src]');

    const imageObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.removeAttribute('data-src');
                imageObserver.unobserve(img);
            }
        });
    });

    images.forEach(img => imageObserver.observe(img));
}

// ============================================
// Mobile Menu
// ============================================
function initMobileMenu() {
    const mobileMenuToggle = document.getElementById('mobileMenuToggle');
    const mobileNav = document.getElementById('mobileNav');
    const mobileNavLinks = document.querySelectorAll('.mobile-nav__link');

    if (!mobileMenuToggle || !mobileNav) return;

    // Toggle mobile menu
    mobileMenuToggle.addEventListener('click', (e) => {
        e.stopPropagation();
        mobileMenuToggle.classList.toggle('active');
        mobileNav.classList.toggle('active');

        // Prevent body scroll when menu is open
        if (mobileNav.classList.contains('active')) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = '';
        }
    });

    // Close menu when clicking on a link
    mobileNavLinks.forEach(link => {
        link.addEventListener('click', () => {
            mobileMenuToggle.classList.remove('active');
            mobileNav.classList.remove('active');
            document.body.style.overflow = '';
        });
    });

    // Close menu when clicking outside
    mobileNav.addEventListener('click', (e) => {
        if (e.target === mobileNav) {
            mobileMenuToggle.classList.remove('active');
            mobileNav.classList.remove('active');
            document.body.style.overflow = '';
        }
    });

    // Close menu on escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && mobileNav.classList.contains('active')) {
            mobileMenuToggle.classList.remove('active');
            mobileNav.classList.remove('active');
            document.body.style.overflow = '';
        }
    });
}

// ============================================
// Utility Functions
// ============================================

// Debounce function for performance
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Check if element is in viewport
function isInViewport(element) {
    const rect = element.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
}

// ============================================
// Form Validation (if contact form is added)
// ============================================
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// ============================================
// Language Switching with URL Routing
// ============================================

// Supported language codes and their URL paths
const SUPPORTED_LANGUAGES = {
    'en': 'en-US',
    'ru': 'ru-RU',
    'es': 'es-ES',
    'fr': 'fr-FR',
    'de': 'de-DE',
    'it': 'it-IT',
    'pt': 'pt-PT',
    'pl': 'pl-PL',
    'nl': 'nl-NL',
    'tr': 'tr-TR',
    'uk': 'uk-UA',
    'ja': 'ja-JP',
    'ko': 'ko-KR',
    'zh': 'zh-CN',
    'ar': 'ar-SA',
    'hi': 'hi-IN'
};

const DEFAULT_LANGUAGE = 'en';

// Get language from URL path (e.g., /en, /ru, /es)
function getLanguageFromURL() {
    const path = window.location.pathname;
    const matches = path.match(/^\/([a-z]{2})(\/|$)/);

    if (matches && SUPPORTED_LANGUAGES[matches[1]]) {
        return matches[1];
    }

    return null;
}

// Get language from localStorage
function getSavedLanguage() {
    const saved = localStorage.getItem('selectedLanguage');
    if (saved && SUPPORTED_LANGUAGES[saved]) {
        return saved;
    }
    return null;
}

// Get browser language
function getBrowserLanguage() {
    const browserLang = (navigator.language || navigator.userLanguage || '').toLowerCase();

    // Try exact match
    for (const [code, locale] of Object.entries(SUPPORTED_LANGUAGES)) {
        if (browserLang === locale.toLowerCase() || browserLang.startsWith(code + '-')) {
            return code;
        }
    }

    // Try language code only
    const langCode = browserLang.split('-')[0];
    if (SUPPORTED_LANGUAGES[langCode]) {
        return langCode;
    }

    // If browser language not supported, return null to fall back to DEFAULT_LANGUAGE
    return null;
}

// Handle GitHub Pages redirect from 404.html
function handleGitHubPagesRedirect() {
    // Check if we were redirected from 404.html
    const query = window.location.search;
    if (query && query.startsWith('?p=/')) {
        const path = query.replace('?p=/', '');
        // Replace the URL without the query parameter
        window.history.replaceState(null, null, '/' + path);
    }
}

// Determine initial language
function getInitialLanguage() {
    // Handle GitHub Pages redirect first
    handleGitHubPagesRedirect();

    // Priority: URL > localStorage > Browser > Default
    return getLanguageFromURL() || getSavedLanguage() || getBrowserLanguage() || DEFAULT_LANGUAGE;
}

// Update URL using History API
function updateURL(langCode, replaceState = false) {
    const newPath = `/${langCode}`;
    const newURL = window.location.origin + newPath + window.location.search + window.location.hash;

    if (replaceState) {
        window.history.replaceState({ language: langCode }, '', newURL);
    } else {
        window.history.pushState({ language: langCode }, '', newURL);
    }
}

let currentLanguage = getInitialLanguage();

// Get value from nested object using dot notation (e.g., 'nav.features')
function getNestedValue(obj, path) {
    return path.split('.').reduce((current, key) => current?.[key], obj);
}

// Update dynamic meta tags
function updateMetaTags(lang, translation) {
    const langCode = lang.split('-')[0];

    // Update page title
    if (translation.hero && translation.hero.title) {
        const cleanTitle = translation.hero.title.replace(/<[^>]*>/g, '');
        document.title = cleanTitle + ' - File Converter Pro';
    }

    // Update meta description
    if (translation.hero && translation.hero.subtitle) {
        const cleanDescription = translation.hero.subtitle.replace(/<[^>]*>/g, '');
        updateOrCreateMeta('name', 'description', cleanDescription);
    }

    // Update Open Graph tags
    updateOrCreateMeta('property', 'og:title', document.title);
    if (translation.hero && translation.hero.subtitle) {
        updateOrCreateMeta('property', 'og:description', translation.hero.subtitle.replace(/<[^>]*>/g, ''));
    }
    updateOrCreateMeta('property', 'og:locale', lang.replace('-', '_'));

    // Update Twitter tags
    updateOrCreateMeta('name', 'twitter:title', document.title);
    if (translation.hero && translation.hero.subtitle) {
        updateOrCreateMeta('name', 'twitter:description', translation.hero.subtitle.replace(/<[^>]*>/g, ''));
    }

    // Update HTML lang attribute
    document.documentElement.lang = langCode;
}

// Helper to update or create meta tags
function updateOrCreateMeta(attrName, attrValue, content) {
    let meta = document.querySelector(`meta[${attrName}="${attrValue}"]`);
    if (!meta) {
        meta = document.createElement('meta');
        meta.setAttribute(attrName, attrValue);
        document.head.appendChild(meta);
    }
    meta.setAttribute('content', content);
}

// Update hreflang tags
function updateHreflangTags() {
    // Remove existing hreflang tags
    document.querySelectorAll('link[rel="alternate"]').forEach(link => link.remove());

    // Add hreflang for each language
    const baseURL = window.location.origin;
    Object.keys(SUPPORTED_LANGUAGES).forEach(langCode => {
        const link = document.createElement('link');
        link.rel = 'alternate';
        link.hreflang = langCode;
        link.href = `${baseURL}/${langCode}`;
        document.head.appendChild(link);
    });

    // Add x-default
    const defaultLink = document.createElement('link');
    defaultLink.rel = 'alternate';
    defaultLink.hreflang = 'x-default';
    defaultLink.href = `${baseURL}/${DEFAULT_LANGUAGE}`;
    document.head.appendChild(defaultLink);
}

// Update canonical URL
function updateCanonicalURL(langCode) {
    let canonical = document.querySelector('link[rel="canonical"]');
    if (!canonical) {
        canonical = document.createElement('link');
        canonical.rel = 'canonical';
        document.head.appendChild(canonical);
    }
    canonical.href = `${window.location.origin}/${langCode}`;
}

// Apply translations to the page
function applyTranslations(lang, updateURLFlag = true) {
    // Get the language code (e.g., 'en' from 'en-US')
    const langCode = Object.keys(SUPPORTED_LANGUAGES).find(key => SUPPORTED_LANGUAGES[key] === lang) || lang;
    const fullLang = SUPPORTED_LANGUAGES[langCode] || lang;

    const translation = translations[fullLang];
    if (!translation) {
        console.error(`Translation for ${fullLang} not found`);
        return;
    }

    // Update all elements with data-i18n attribute
    document.querySelectorAll('[data-i18n]').forEach(element => {
        const key = element.getAttribute('data-i18n');
        const value = getNestedValue(translation, key);

        if (value) {
            // Check if element is an input/textarea
            if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA') {
                element.placeholder = value;
            } else {
                element.innerHTML = value;
            }
        }
    });

    // Update blog links based on language
    document.querySelectorAll('.blog-link').forEach(blogLink => {
        if (langCode === 'ru' || langCode === 'ru-RU') {
            blogLink.href = 'blog/index.html';
        } else {
            // For other languages, use blog/{lang}/ structure
            const blogLangCode = langCode.split('-')[0]; // Get 'en' from 'en-US'
            blogLink.href = `blog/${blogLangCode}/`;
        }
    });

    // Update meta tags
    updateMetaTags(fullLang, translation);

    // Update canonical URL
    updateCanonicalURL(langCode);

    // Update language button
    const langCodes = {
        'en': 'EN', 'ru': 'RU', 'es': 'ES', 'fr': 'FR',
        'de': 'DE', 'it': 'IT', 'pt': 'PT', 'pl': 'PL',
        'nl': 'NL', 'tr': 'TR', 'uk': 'UK', 'ja': 'JA',
        'ko': 'KO', 'zh': 'ZH', 'ar': 'AR', 'hi': 'HI'
    };
    const currentLangEl = document.getElementById('currentLang');
    if (currentLangEl) {
        currentLangEl.textContent = langCodes[langCode] || 'EN';
    }

    // Update URL if needed
    if (updateURLFlag && langCode !== getLanguageFromURL()) {
        updateURL(langCode, true);
    }

    // Store current language
    localStorage.setItem('selectedLanguage', langCode);
    currentLanguage = langCode;

    console.log(`Language changed to: ${langCode} (${fullLang})`);
}

// Initialize language selector
function initLanguageSelector() {
    const languageBtn = document.getElementById('languageBtn');
    const languageDropdown = document.getElementById('languageDropdown');
    const languageOptions = document.querySelectorAll('.language-option');

    if (!languageBtn || !languageDropdown) return;

    // Toggle dropdown
    languageBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        languageDropdown.classList.toggle('active');
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', () => {
        languageDropdown.classList.remove('active');
    });

    // Language selection
    languageOptions.forEach(option => {
        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const selectedFullLang = option.getAttribute('data-lang'); // e.g., 'en-US'
            const selectedLangCode = Object.keys(SUPPORTED_LANGUAGES).find(
                key => SUPPORTED_LANGUAGES[key] === selectedFullLang
            ) || selectedFullLang.split('-')[0]; // e.g., 'en'

            // Update active state
            languageOptions.forEach(opt => opt.classList.remove('active'));
            option.classList.add('active');

            // Apply translations and update URL
            applyTranslations(selectedFullLang, true);

            // Update URL in history
            updateURL(selectedLangCode, false);

            // Close dropdown
            languageDropdown.classList.remove('active');

            // Track language change
            trackEvent('language', 'change', selectedLangCode);
        });

        // Set active language
        const optionLang = option.getAttribute('data-lang');
        const optionLangCode = Object.keys(SUPPORTED_LANGUAGES).find(
            key => SUPPORTED_LANGUAGES[key] === optionLang
        ) || optionLang.split('-')[0];

        if (optionLangCode === currentLanguage) {
            option.classList.add('active');
        }
    });

    // Initialize hreflang tags
    updateHreflangTags();

    // Apply current language on load
    const currentFullLang = SUPPORTED_LANGUAGES[currentLanguage] || currentLanguage;
    applyTranslations(currentFullLang, false);

    // Ensure URL is correct on initial load
    if (!getLanguageFromURL() || getLanguageFromURL() !== currentLanguage) {
        updateURL(currentLanguage, true);
    }
}

// Handle browser back/forward buttons
window.addEventListener('popstate', (event) => {
    const urlLang = getLanguageFromURL();
    if (urlLang && urlLang !== currentLanguage) {
        const fullLang = SUPPORTED_LANGUAGES[urlLang];
        if (fullLang) {
            applyTranslations(fullLang, false);
        }
    }
});

// ============================================
// Initialize Everything
// ============================================
function init() {
    console.log('File Converter Pro Landing Page - Initializing...');

    // Initialize all features
    initLanguageSelector();
    initFormatTabs();
    initFAQ();
    initVideoPlayer();
    initSmoothScrolling();
    initScrollReveal();
    initHeaderScrollEffect();
    initEventTracking();
    initLazyLoading();
    initMobileMenu();

    console.log('File Converter Pro Landing Page - Ready!');
}

// ============================================
// Run on DOM Content Loaded
// ============================================
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    // DOM is already ready
    init();
}

// ============================================
// Export functions for external use
// ============================================
window.FileConverterPro = {
    setYouTubeVideoId,
    trackEvent,
    CONFIG
};

// ============================================
// Service Worker Registration (for PWA - optional)
// ============================================
if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
        // Uncomment when service worker is ready
        // navigator.serviceWorker.register('/sw.js')
        //     .then(registration => console.log('SW registered:', registration))
        //     .catch(error => console.log('SW registration failed:', error));
    });
}
