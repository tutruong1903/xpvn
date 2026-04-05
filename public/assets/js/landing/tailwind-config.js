/**
 * Tailwind CDN theme extension — landing page ("The Luminous Guardian").
 * Load immediately after https://cdn.tailwindcss.com
 */
tailwind.config = {
    darkMode: 'class',
    theme: {
        extend: {
            colors: {
                background: '#f9f9f9',
                'surface-container-high': '#e8e8e8',
                'surface-container-lowest': '#ffffff',
                'inverse-surface': '#2f3131',
                'surface-dim': '#dadada',
                outline: '#767586',
                'on-primary-container': '#fffbff',
                'outline-variant': '#c7c4d7',
                'on-error': '#ffffff',
                'on-secondary': '#ffffff',
                'on-primary': '#ffffff',
                'surface-bright': '#f9f9f9',
                'surface-container': '#eeeeee',
                primary: '#712ae2',
                'on-background': '#1a1c1c',
                'secondary-container': '#316bf3',
                'on-surface': '#1a1c1c',
                secondary: '#0051d5',
                'surface-container-highest': '#e2e2e2',
                surface: '#f9f9f9',
                'on-surface-variant': '#464554',
                'surface-variant': '#e2e2e2',
                'on-secondary-container': '#fefcff',
                'primary-container': '#8a4cfc',
                error: '#ba1a1a',
                'surface-container-low': '#f3f3f4',
            },
            borderRadius: {
                DEFAULT: '0.5rem',
                lg: '0.75rem',
                xl: '1rem',
                '2xl': '1.5rem',
                '3xl': '2rem',
                full: '9999px',
            },
            fontFamily: {
                headline: ['Manrope', 'sans-serif'],
                body: ['Inter', 'sans-serif'],
                label: ['Inter', 'sans-serif'],
            },
        },
    },
};
