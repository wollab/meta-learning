# Brand Identity Options

Updated: 2026-08-12

## Purpose

ชุดนี้ใช้บันทึกการเลือกบุคลิกหลักของ “Meta Learning — มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร” และที่มาของ production assets

## Decision

Chief เลือก Direction B — Many Paths เมื่อ 2026-08-12 และต่อมาเปลี่ยนชื่อ public brand เป็น “Meta Learning — มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร”

บุคลิกที่ต้องการร่วมกันคือ: จริงจังแต่ชวนสำรวจ, เห็นความหลากหลายของโลก, แยกประวัติศาสตร์ออกจากสถานะหลักฐานปัจจุบัน และไม่ทำให้ประวัติศาสตร์ดูเป็นเส้นเดียว

## Options

### A — Global Constellation / แผนที่ความคิดเชื่อมโลก

ไฟล์: `design-references/brand-concepts/2026-08-12/concept-a-global-constellation.png`

- สื่อสารเรื่องโลก เครือข่าย และคลังความรู้ได้ตรงที่สุด
- เชื่อมกับภาพ relationship map ในเว็บได้ทันที
- ข้อจำกัด: รายละเอียดจุดและเส้นมากเกินไปสำหรับ favicon หรือ avatar ขนาดเล็ก ต้องลดทอนอย่างมากก่อนใช้งานจริง

### B — Many Paths / หลายเส้นทางของการเรียนรู้

ไฟล์: `design-references/brand-concepts/2026-08-12/concept-b-many-paths.png`

- หลายเส้นทางคงเอกลักษณ์ของตัวเอง แต่สนทนากันรอบพื้นที่ว่างกลางภาพ
- ใช้เป็น social avatar ได้ชัดที่สุดในสามแบบ และไปต่อกับระบบสี turquoise, saffron และ violet ของเว็บได้ดี
- ข้อจำกัด: รอบ vector refinement ต้องลดรอยตัดด้านในและทำให้ทรงไม่ถูกอ่านเป็นคนจับมือหรือดอกไม้มากเกินไป
- Status: selected; the ImageGen rendering is the approved production personality. The deterministic SVG redraw was evaluated and superseded because it lost the organic, conversational quality of the selected concept.

### C — Living Archive / คลังหลักฐานที่มีชีวิต

ไฟล์: `design-references/brand-concepts/2026-08-12/concept-c-living-archive.png`

- สื่อชั้นเวลา เส้นหลักฐาน และการตรวจย้อนกลับได้ดี
- เหมาะกับบุคลิก editorial และ evidence-aware
- ข้อจำกัด: silhouette ใกล้ target หรือ radar ซึ่งอาจให้ความรู้สึกประเมินผล/จับเป้ามากกว่าการเรียนรู้

## Production Assets

Current approved ImageGen family:

- `public/brand/imagegen/logo-profile-master.png` — retained ImageGen master
- `public/brand/imagegen/logo-mark-imagegen-512.png` — active web-header mark
- `public/brand/imagegen/favicon-imagegen-64.png` — active favicon
- `public/brand/imagegen/facebook-profile-1080.png` — Facebook upload master with circular-crop safe area
- `public/brand/imagegen/facebook-profile-320.png` — minimum-quality reference export
- `public/brand/imagegen/facebook-cover-background.png` — editable text-free ImageGen background
- `public/brand/imagegen/facebook-cover-background-doodle.png` — selected doodle-style text-free Facebook cover background
- `public/brand/imagegen/facebook-cover-1640x923.png` — finished 16:9 Facebook cover with deterministic Thai typography
- `public/brand/imagegen/facebook-cover-1640x923-no-text.png` — flexible 16:9 cover background
- `scripts/export-brand-assets.ps1` — reproducible crops, sizes, and exact-text export

The older `public/brand/*.svg` and SVG-derived PNG files remain only as a superseded comparison set. They are not active site assets and should not be treated as the identity master.

Header ใช้ master mark คู่กับข้อความ HTML เพื่อให้ชื่อภาษาไทย responsive และเข้าถึงได้ ไม่ฝังตัวอักษรไว้ใน raster logo

Clear space ขั้นต่ำเท่ากับความหนาของเส้นหนึ่งช่วง ห้ามยืด บีบ หมุน หรือเปลี่ยนลำดับสี เครื่องหมายต้องมีพื้นที่ว่างตรงกลางและคงลำดับสี turquoise → saffron → violet → charcoal ตามเข็มนาฬิกา อนุญาตเฉพาะมิติและเงานุ่มที่มีอยู่ใน ImageGen master; ห้ามเติมเอฟเฟกต์ใหม่จนรบกวน silhouette

## Generation Notes

- Mode: built-in image generation
- Use case: `logo-brand`
- Shared constraints: strong small-size silhouette, no words or letters inside the mark, no stock/logo imitation, no watermark
- A prompt focus: connected global learning nodes opening like an atlas
- B prompt focus: distinct paths meeting around open dialogue space
- C prompt focus: layered time strata connected by one evidence thread

Concept B ได้รับการยกระดับเป็น production raster master เมื่อ 2026-08-12 โดยรักษาความนุ่มและความไม่สมมาตรเล็กน้อยที่ Chief เลือก ส่วน Concept A/C ยังเป็น exploration เท่านั้น
