# WoL ecosystem analytics hooks

Updated: 2026-08-12

This project now uses privacy-light analytics preparation without loading any third-party tracker by default.

## What is already implemented

- Cross-site links include UTM parameters:
  - `utm_source`
  - `utm_medium=ecosystem_link`
  - `utm_campaign`
- Cross-site links include data hooks:
  - `data-wol-event="ecosystem_link"`
  - `data-wol-source`
  - `data-wol-target`
- Pages dispatch a browser event when a hooked link is clicked:
  - event name: `wol:ecosystem-link`
  - detail: `{ event, source, target }`

## Current source names

- `meta-learning`
- `meta-learning-tools`
- `9-learning-angles`
- `tarot-of-learning`
- `wizardhat`
- `wizardhat-result`

## Current campaign names

- `learning_flywheel`
- `meta_learning_flywheel`
- `result_bridge`
- `reflection_bridge`
- `outcome_bridge`

## Future setup

When Chief chooses an analytics tool, add one small listener that catches `wol:ecosystem-link` and forwards it to the selected platform.

Example shape:

```js
window.addEventListener('wol:ecosystem-link', (event) => {
  // send event.detail.event, event.detail.source, event.detail.target
  // to GA4, Plausible, PostHog, or another selected analytics tool
});
```

Do not add third-party tracking by default until the public privacy/consent approach is decided.
