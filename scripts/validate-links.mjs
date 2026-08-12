import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const dist = path.join(root, 'dist');
const htmlFiles = [];
const rawBasePath = process.env.BASE_PATH || '';
const basePath = rawBasePath && rawBasePath !== '/'
  ? `/${rawBasePath.replace(/^\/+|\/+$/g, '')}/`
  : '/';

const walk = (dir) => {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const target = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(target);
    else if (entry.name.endsWith('.html')) htmlFiles.push(target);
  }
};

walk(dist);
const broken = [];

for (const file of htmlFiles) {
  const html = fs.readFileSync(file, 'utf8');
  const hrefs = [...html.matchAll(/href=["']([^"']+)["']/g)].map((match) => match[1]);
  for (const rawHref of hrefs) {
    if (/^(https?:|mailto:|tel:|data:|#|javascript:)/.test(rawHref)) continue;
    const href = rawHref.split('#')[0].split('?')[0];
    if (!href) continue;
    const normalizedHref = href.startsWith(basePath) && basePath !== '/'
      ? `/${href.slice(basePath.length)}`
      : href;
    const candidate = normalizedHref.startsWith('/')
      ? path.join(dist, normalizedHref.replace(/^\/+/, ''))
      : path.resolve(path.dirname(file), normalizedHref);
    const options = path.extname(candidate) ? [candidate] : [candidate, `${candidate}.html`, path.join(candidate, 'index.html')];
    if (!options.some((item) => fs.existsSync(item))) {
      broken.push(`${path.relative(dist, file)} -> ${rawHref}`);
    }
  }
}

console.log(JSON.stringify({ pagesChecked: htmlFiles.length, brokenLinks: broken }, null, 2));
if (broken.length) process.exit(1);
