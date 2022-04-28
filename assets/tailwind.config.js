// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
const theme_colors = {
  transparent: 'transparent',
  current: 'currentColor',
  blueViolet: '#540D6E',
  paradisePink: '#ee4266',
  sunglow: '#ffd23f',
  honeydew: '#f3fcf0',
  pineTree: '#1f271b'
}

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    colors: theme_colors,
    extend: {
      fontFamily: {
        mono: ["Input", "monospace"],
        sans: ["Inter", "sans-serif"]
      }
    },
  },
  daisyui: {
    themes: [{
      mytheme: {
        "primary": theme_colors.blueViolet,
        "secondary": theme_colors.paradisePink,
        "accent": theme_colors.sunglow,
        "neutral": theme_colors.pineTree,
        "base-100": "#fff",
        "info": "#79D3E7",
        "success": "#20BC5E",
        "warning": "#E79127",
        "error": "#F6282B",
      }
    }]
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require("daisyui"),
  ]
}
