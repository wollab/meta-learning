import { defineConfig } from 'astro/config';
export default defineConfig({site:'https://wollab.github.io',base:process.env.BASE_PATH||'/',trailingSlash:'always'});
