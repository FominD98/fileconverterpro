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
// Mobile Menu (if needed in future)
// ============================================
function initMobileMenu() {
    // Placeholder for mobile menu functionality
    // Can be implemented if mobile menu is added to HTML
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
// Initialize Everything
// ============================================
function init() {
    console.log('File Converter Pro Landing Page - Initializing...');

    // Initialize all features
    initFormatTabs();
    initFAQ();
    initVideoPlayer();
    initSmoothScrolling();
    initScrollReveal();
    initHeaderScrollEffect();
    initEventTracking();
    initLazyLoading();

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
