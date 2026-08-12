# Design Direction: Meta Learning

Updated: 2026-08-12

Public name: Meta Learning
Thai line: มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร

## Selected System

The three approved concepts are one connected experience, not alternatives:

1. `design-references/01-question-playground.png` -> Home `/`
   - Start with an everyday question.
   - Show a playful relationship-map preview.
   - Send a relevant set of three records to Compare.
2. `design-references/02-theory-metro.png` -> Timeline `/timeline/`
   - Show parallel intellectual routes rather than a single great-thinker line.
   - Keep broad periods explicit when an exact year is not supported.
   - Retain a complete period ledger beneath the visual routes.
3. `design-references/03-learning-lab.png` -> Compare `/compare/`
   - Start with an everyday learning situation.
   - Compare up to three records using the same evidence-aware fields.
   - Keep historical influence separate from current evidence and limitations.

## Brand Identity Status

- Direction B, “Many Paths”, was selected by Chief on 2026-08-12. The selected ImageGen personality is the production source; the later deterministic SVG redraw is superseded.
- Three identity directions are recorded in `BRAND_IDENTITY_OPTIONS.md` and `design-references/brand-concepts/2026-08-12/`.
- The retained master is `public/brand/imagegen/logo-profile-master.png`; header, social profile, favicon, and cover assets must remain visually derived from this ImageGen family.
- The Facebook cover now uses a doodle-style ImageGen background to match the site's learning-map illustrations. Text is added by `scripts/export-brand-assets.ps1`, not generated inside the bitmap.

## Visual Rules

- Primary blue: `#50C2C0`
- Primary yellow: `#FEC566`
- Ink: `#2F3338`
- Paper: `#FFFEF8`
- Secondary coral: `#FF766B`
- Secondary violet: `#6E5AA8`
- Heading: Kanit
- Body: Bai Jamjuree
- Radius: 0-6px, except circular nodes and compact category pills
- No dark photo heroes, decorative blobs, nested cards, or heavy shadows. Subtle tactile depth already present in the approved ImageGen mark is allowed.
- Doodles must explain a learning mechanism or help navigation. They are not filler.
- Public copy is written for readers. Build status and implementation notes stay in repository documents.

## Production Assets

- `public/images/doodles/learning-map.png`
- `public/images/doodles/theory-timeline.png`
- `public/images/doodles/compare-scenes.png`
- `public/brand/imagegen/logo-mark-imagegen-512.png`
- `public/brand/imagegen/facebook-profile-1080.png`
- `public/brand/imagegen/facebook-cover-1640x923.png`

These assets contain no embedded text so labels remain accessible, responsive, and editable in HTML.

## Implementation Notes

- Theme layer: `src/styles/playful-theme.css`
- Shared header and navigation: `src/layouts/BaseLayout.astro`
- Home questions pass selected IDs through the Compare query string.
- Timeline visual tracks are curated entry routes; the full dataset remains available in the period ledger.
- Compare scenarios are reader prompts. They do not alter the stored research records.
- Research data remains the source for theory names, definitions, evidence, critiques, and source references.

## Next Iteration

- Apply the same visual tokens to the remaining archive, relationship, people, source, method, and detail pages.
- Replace route-preview curation only when new records have passed the research quality gate.
- Add richer graph interaction only with a proven graph library and after keyboard behavior is designed.
- Recheck Google Fonts loading in the final deployment environment; the system font fallback is already defined.
