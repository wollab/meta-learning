# Design QA

Date: 2026-08-12

## Scope

- Reference targets: all three files in `design-references/`
- Implemented routes: `/`, `/timeline/`, `/compare/`
- Desktop viewport: 1440 x 1024
- Mobile viewport: 390 x 844

## Results

- Home preserves the approved question-first hierarchy and relationship-map illustration.
- Timeline uses parallel color routes, broad periods, linked stations, and a complete period ledger.
- Compare uses an everyday scenario, three selectable records, evidence-aware rows, and explanatory doodles.
- WoL turquoise and yellow are dominant; coral and violet are restrained category aids.
- No page-level horizontal overflow at either viewport.
- Timeline and Compare expose horizontal scrolling only inside their labeled interactive regions on narrow screens.
- All raster assets load with non-zero natural dimensions.
- Home question navigation passed selected theory IDs to Compare correctly.
- Scenario buttons update prompt text and pressed state.
- Mobile menu opens, closes with Escape, and restores keyboard focus.
- Browser console: no errors or warnings during the tested flows.
- Data validation: 52 records, 48 relationships, 116 cited sources, 0 errors.
- Astro check/build: 0 errors, 0 warnings, 62 pages built.
- Link validation: 0 broken links.

## Captures

- `qa/home-desktop.png`
- `qa/home-mobile.png`
- `qa/timeline-desktop.png`
- `qa/timeline-mobile.png`
- `qa/compare-desktop.png`
- `qa/compare-mobile.png`

## Remaining P3 Polish

- Extend the playful theme to supporting routes in a later iteration.
- Consider local font files if the public deployment must work without Google Fonts.

## Brand and LAN update — 2026-08-12

- Chief selected Direction B, “Many Paths”. The concept raster was redrawn as a deterministic SVG with four separated routes and a clear central dialogue space.
- Header, favicon, 1080/512/180 social profile exports, monochrome/dark marks, and 1200×630 share artwork derive from the same master geometry.
- Visual checks passed at desktop 1440×1024, compact 500×844, and social 180×180. Captures: `qa/brand-home-desktop.png`, `qa/brand-home-mobile-500.png`, `qa/brand-map-mobile-500.png`, `qa/brand-sources-desktop.png`, and `qa/brand-record-desktop.png`.
- Supporting-route review found no clipped headings, broken layout, or off-canvas controls. Public eyebrow text is translated to Thai at the shared component boundary.
- LAN check returned HTTP 200 for home, Map, Compare, favicon, master logo, and social profile at `192.168.1.132:4328`.
- `npm.cmd run build`: 62 pages, 0 Astro errors/warnings, 0 broken internal links.

## Reader-path update — 2026-08-12

- Exposed canonical reading syntheses through `/paths/`; no duplicate reader-path database was created in the web project.
- Added three canonical paths for children/development, adults/work, and self-development, bringing the total to 13.
- Main navigation now prioritizes “เริ่มอ่าน”; People remains accessible from the home journey and footer.
- The page explicitly separates record kind/family from reader-goal and life-context navigation, and cautions against treating pedagogy, andragogy, and heutagogy as a fixed age ladder.
- Desktop 1440×1600 and compact 500×1200 captures show no visible horizontal overflow, clipped headings, or overlapping controls: `qa/paths-desktop.png`, `qa/paths-mobile-500.png`.
- LAN responses for `/paths/` returned HTTP 200 through both localhost and `192.168.1.132:4328`.
- Final research validator: 52 records, 128 sources, 48 relationships, 13 syntheses, 0 errors/warnings.
- Final build: 63 pages, 0 errors, 0 warnings, 0 hints, 0 broken internal links.

final result: passed

## ImageGen identity and Facebook asset update — 2026-08-12

- Chief confirmed that the organic ImageGen rendering of Direction B, “Many Paths”, is the production personality; the deterministic SVG redraw is superseded and no longer linked from the site.
- Header and favicon now use `public/brand/imagegen/logo-mark-imagegen-512.png` and `favicon-imagegen-64.png`. The original ImageGen master remains intact at `logo-profile-master.png`.
- Facebook exports are ready but not published: `facebook-profile-1080.png`, `facebook-profile-320.png`, `facebook-cover-1640x923.png`, and `facebook-cover-1640x923-no-text.png`.
- Profile artwork keeps all routes and nodes inside a circular-crop safe area. Cover artwork is 16:9, keeps the lower-left quiet for Page-profile overlap, and includes a text-free version for future copy changes.
- Export sizes and exact Thai typography are reproducible with `scripts/export-brand-assets.ps1`; ImageGen masters are never overwritten by the export script.
- Official Meta guidance checked on 2026-08-12: Page profile is circular-cropped and should be at least 320×320; Page cover is treated as 16:9, can be cropped/resized across screens, and PNG is preferred when artwork contains a logo or text.
- Real device-viewport QA at 390×844 returned `scrollWidth = clientWidth` (375 px content viewport), with the header mark loaded at natural size 512×512 and no browser warnings/errors. Capture: `qa/imagegen-brand-home-mobile.png`.
- Desktop capture: `qa/imagegen-brand-home-desktop.png`. LAN returned HTTP 200 for the home page, active mark, Facebook profile, and Facebook cover through `192.168.1.132:4328`.
- Final build: 52 records, 116 cited sources, 48 relationships, 63 pages, 0 Astro errors/warnings/hints, and 0 broken internal links.

final result: passed
