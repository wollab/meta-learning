# Meta Learning social assets

Updated: 2026-08-12

Use the focused v1 set as the current Facebook/Page identity for Meta Learning. It presents Meta Learning by itself first, without foregrounding the wider tool ecosystem.

## Preview workflow

For smooth mobile preview in the Codex app and on the local prototype:

1. Generate social post images with image gen.
2. Copy selected outputs into the campaign folder for content-system history:
   `03_Documents/06_Business_Systems/WoL-Owned-Audience-System/content-community-communication/campaigns/2026-08-meta-learning-facebook-launch/posts/`
3. Copy web-preview copies into:
   `public/images/social/`
4. If the local server is running from `dist` / Astro preview, also copy the same files into:
   `dist/images/social/`
5. Open the gallery from a phone on the same Wi-Fi:
   `http://192.168.1.132:4328/social-preview.html`

Use English in-image hooks when image gen must render the text itself. Thai in-image text remains unreliable for public-ready spelling unless manually typeset afterward.

## Current recommended files

- Facebook cover: `public/brand/imagegen/facebook-cover-focused-v1-1640x624.png`
- Facebook cover without text: `public/brand/imagegen/facebook-cover-focused-v1-no-text-1640x624.png`
- Link preview / OG image: `public/brand/imagegen/facebook-cover-focused-v1-og-1200x630.png`
- Square social profile draft: `public/brand/imagegen/facebook-profile-doodle-v2-1080.png`
- Small square preview: `public/brand/imagegen/facebook-profile-doodle-v2-320.png`
- Master generated image: `public/brand/imagegen/facebook-cover-focused-v1-master.png`

## Current post image drafts

- Post 01: `public/images/social/post-01-how-do-we-learn-imagegen.png`
  - Hook: `How do we learn?`
  - Status: recommended draft; image gen rendered the text directly and spelling is acceptable.
- Post 02: `public/images/social/post-02-start-with-your-goal-imagegen.png`
  - Hook: `Start with your goal`
  - Status: recommended draft; image gen rendered the text directly and spelling is acceptable.
- Post 03: `public/images/social/post-03-map-not-label-imagegen.png`
  - Hook: `Map, not label`
  - Status: recommended draft; image gen rendered the text directly and spelling is acceptable.
- Post 04 pinned guide: `public/images/social/post-04-use-the-map-imagegen.png`
  - Hook: `Use the map`
  - Status: recommended pinned/how-to-use draft; image gen rendered the text directly and spelling is acceptable.
- Post 05: `public/images/social/post-05-pick-a-path-imagegen.png`
  - Hook: `Pick a path`
  - Status: August guide series; image gen rendered the text directly and spelling is acceptable.
- Post 06: `public/images/social/post-06-compare-ideas-imagegen.png`
  - Hook: `Compare ideas`
  - Status: August guide series; image gen rendered the headline directly and spelling is acceptable. The image includes additional English row labels that support the compare concept.
- Post 07: `public/images/social/post-07-follow-the-links-imagegen.png`
  - Hook: `Follow the links`
  - Status: August guide series; image gen rendered the text directly and spelling is acceptable.
- Post 08: `public/images/social/post-08-check-evidence-imagegen.png`
  - Hook: `Check evidence`
  - Status: August guide series; image gen rendered the text directly and spelling is acceptable.
- Mobile gallery: `public/social-preview.html`

## Visual direction

- Friendly hand-drawn doodle, warm paper background, turquoise/yellow/plum accents.
- Should feel like one clear idea: a person asking how learning works, following a path through questions, evidence, and reflection.
- Avoid showing the wider ecosystem in the cover: no tarot, no wizard hat, no multiple tools.
- Keep the page hook focused on `Meta Learning` and `มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร`.

## Usage note

The square profile crop is usable as a placeholder, but the strongest long-term profile image is still the imagegen logo mark at:

- `public/brand/imagegen/logo-mark-imagegen-512.png`

Use `facebook-cover-focused-v1-1640x624.png` as the Facebook cover/header. Use the logo mark for profile/avatar unless Chief explicitly wants the square doodle crop.
