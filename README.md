# Meta Learning - Public Web

เว็บ Astro สำหรับอ่าน public snapshot ของคลังภาษาไทยว่าด้วยประวัติศาสตร์แนวคิดการเรียนรู้โลก ภายใต้ชื่อ public brand: Meta Learning — มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร

Live site: `https://wollab.github.io/meta-learning/`
Repository: `https://github.com/wollab/meta-learning`

## Current Experience

ระบบภาพแบบ WoL ที่อนุมัติแล้วถูกนำมาใช้ในสามเส้นทางหลัก:

- `/` เริ่มสำรวจจากคำถาม
- `/timeline/` ดูเส้นทางแนวคิดหลายสายและระเบียนทุกช่วงเวลา
- `/compare/` เปรียบเทียบได้สูงสุดสามแนวคิดผ่านสถานการณ์ใกล้ตัว

อ่าน `DESIGN_DIRECTION.md` ก่อนทำงานภาพต่อ และดูผลตรวจล่าสุดที่ `design-qa.md` กับภาพใน `qa/`

## Source of Truth

ข้อมูลหลักอยู่ที่:

`03_Documents/04_Knowledge_Base/01_Inbox/04_Personal_Learning/2026-08-11-global-learning-theories-history/data/global-learning-theories.json`

ไฟล์ `src/data/theories.json` สร้างด้วย `npm run sync:data` และไม่ควรถูกแก้แทนฐานวิจัย

## Run

```powershell
npm install
npm run dev
```

### เปิดดูจากมือถือใน Wi-Fi เดียวกัน

ระหว่างพัฒนา ใช้คำสั่งนี้เพื่อเปิด Astro dev server ให้เครื่องอื่นในวง LAN เข้าถึงได้:

```powershell
npm run dev:lan
```

หรือหลัง `npm run build` ใช้ production preview:

```powershell
npm run preview:lan
```

จากนั้นเปิด `http://<IPv4 ของเครื่อง>:4328/` บนมือถือ เครื่องคอมพิวเตอร์ต้องเปิดอยู่และเชื่อม Wi-Fi เครือข่ายเดียวกัน ปัจจุบันตรวจผ่านที่ `http://192.168.1.132:4328/` เมื่อวันที่ 2026-08-12

ถ้า IPv4 เปลี่ยน ให้ดูค่าใหม่ด้วย `Get-NetIPAddress -AddressFamily IPv4` และเลือก address ของ Wi-Fi ที่ไม่ขึ้นต้นด้วย `127.` หรือ `169.254` หากมือถือยังเข้าไม่ได้ ให้ตรวจว่าเครือข่าย Windows เป็น Private และอนุญาต Node.js หรือโปรแกรม preview ผ่าน Windows Firewall เฉพาะ Private network

### Brand identity

Direction B — “Many Paths” เป็นบุคลิกหลักที่อนุมัติแล้ว เว็บใช้ ImageGen mark จาก `public/brand/imagegen/` โดยตรง ส่วนไฟล์ Facebook profile/cover ที่พร้อมอัปโหลดอยู่ในโฟลเดอร์เดียวกัน ภาพ cover ใช้ doodle illustration เพื่อให้ friendly และเชื่อมกับภาษาภาพในเว็บ อ่านที่มาและกติกาการใช้ใน `BRAND_IDENTITY_OPTIONS.md`

ถ้าต้อง export social assets ใหม่ ให้ใช้ PowerShell 7 ขึ้นไปเพื่อป้องกันข้อความไทยเพี้ยน:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File scripts/export-brand-assets.ps1
```

## Quality Gate

```powershell
npm run build
```

คำสั่ง `npm run build` จะ sync ข้อมูลจาก canonical KB ก่อน ตรวจ public snapshot เรียก Astro check และสร้าง static site ตามลำดับ ส่วน GitHub Pages ใช้ `npm run build:pages` กับ snapshot ที่ commit แล้ว เพราะ GitHub runner ไม่มี canonical KB ในเครื่องเรา

## GitHub publish

โปรเจกต์นี้เป็น Git repo แยกของตัวเองและ push ไป `wollab/meta-learning` แล้ว ใช้เครื่องมือกลางใน workspace สำหรับ push ซ้ำหลังแก้เว็บ:

```powershell
pwsh -NoProfile -File C:\Users\moren\OneDrive\Desktop\Work\Codex-AI\01_Agent_Ops\github-web-publish\publish-web.ps1 `
  -ProjectRoot "C:\Users\moren\OneDrive\Desktop\Work\Codex-AI\02_Programs\04_Experimental\Global-Learning-Theories-History-Web" `
  -CommitMessage "Update Meta Learning prototype" `
  -Push
```

## Routes

- `/theories/`, `/theories/[slug]/`
- `/paths/` — เริ่มอ่านจากช่วงชีวิต เป้าหมาย และคำถามที่สนใจ โดยใช้ canonical syntheses
- `/timeline/`, `/map/`, `/compare/`
- `/people/`, `/contexts/`, `/sources/`
- `/method/`, `/gaps/`
