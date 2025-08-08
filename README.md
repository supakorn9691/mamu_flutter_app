# MaMu – Mutelu Prayer App (Flutter Starter)

Flutter starter สำหรับ Fern เพื่อเริ่มโปรเจกต์ `mamu_flutter_app` แบบเร็วสุด:
- หน้า Home: รายชื่อบทสวดจาก `assets/data/chants.json`
- หน้าบทสวด: แสดงเนื้อหา + ปุ่ม "ฟังเสียง" (รองรับ assets/audio)
- โครงสร้างพร้อมขยายต่อ (AI, News, Bookmark, Notifications)

## โครงสร้าง
```
lib/
  main.dart
  screens/
    home_screen.dart
    chant_screen.dart
  models/
    chant.dart
assets/
  data/chants.json
  audio/                # ใส่ไฟล์ .mp3 ที่นี่ (ตอนนี้เป็น placeholder)
  fonts/                # ใส่ Mitr TTF ที่นี่ (placeholder)
pubspec.yaml
```

## การรัน (บนเครื่อง หรือ Gitpod)
1) ติดตั้ง Flutter (ถ้ารันบนเครื่อง) หรือเปิดใน Gitpod
2) รันคำสั่ง:
```
flutter pub get
flutter run -d chrome   # รันแบบ Web
```
หรือรันบน Android Emulator/Device:
```
flutter run
```

## ฟอนต์ (Mitr)
- โฟลเดอร์ `assets/fonts/` เป็น **placeholder**
- นำไฟล์ Mitr เช่น `Mitr-Regular.ttf` มาใส่ แล้ว **uncomment** บล็อก `fonts:` ใน `pubspec.yaml`
- ถ้าไม่ใส่ฟอนต์ แอปยังรันได้ (จะใช้ฟอนต์ระบบแทน)

## เสียง (Audio)
- ใส่ไฟล์ `.mp3` ไว้ใน `assets/audio/`
- ตัวอย่างใน `assets/data/chants.json` อ้างถึง:
  - `assets/audio/wai_phra.mp3`
  - `assets/audio/chinabunchorn.mp3`
  - `assets/audio/metta.mp3`
- ตอนนี้เป็น placeholder หากไม่มีไฟล์จริง ปุ่มจะขึ้นแจ้งเตือนว่าเล่นไม่ได้

## อัปขึ้น GitHub
```bash
git init
git add .
git commit -m "Initial commit - MaMu Flutter Starter"
git branch -M main
git remote add origin https://github.com/<YOUR_USERNAME>/mamu_flutter_app.git
git push -u origin main
```

## เปิดใน Gitpod (แนะนำเริ่มแบบไม่ต้องติดตั้งอะไร)
- เปลี่ยน <YOUR_USERNAME> ให้ถูกต้อง แล้วเปิด:
  ```
  https://gitpod.io/#https://github.com/<YOUR_USERNAME>/mamu_flutter_app
  ```
- เลือก Editor: **VS Code (Browser)**
- จากนั้นใน Terminal ของ Gitpod:
  ```
  flutter pub get
  flutter run -d chrome
  ```

## ต่อไปนี้ทำอะไรต่อดี
- เพิ่มหน้า News & Events (อ่านจาก `assets/data/news.json`)
- เพิ่ม Bookmark + Notifications
- ใส่ AdMob + เตรียม MaMu+ UI
- เตรียม build APK และปล่อยบน Google Play
```

