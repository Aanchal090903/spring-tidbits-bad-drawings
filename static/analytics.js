/**
 * Vercel Web Analytics initialization script
 * This script initializes Web Analytics for tracking page views and user interactions
 * For static sites, this file serves as a module export for the analytics package
 */
(async function initializeAnalytics() {
  try {
    const { inject } = await import('@vercel/analytics');
    if (typeof inject === 'function') {
      inject();
    }
  } catch (error) {
    // Silently fail if analytics fails to load - this won't break the site
    if (typeof console !== 'undefined' && console.debug) {
      console.debug('Vercel Web Analytics: Failed to initialize', error);
    }
  }
})();
