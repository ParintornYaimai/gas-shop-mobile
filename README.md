# siamgasshop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---------------------------------------------------- FOLDER STRUCTURE ----------------------------------------------------\

lib/
│
├── core/                  # ของกลาง ใช้ร่วมกันทั้งแอป
│   ├── constants/          # ค่าคงที่ เช่น colors, strings
│   ├── themes/             # theme, text styles
│   ├── utils/              # helper, formatter, validator
│   └── services/           # service กลาง เช่น api, storage
│
├── data/                   # ชั้น data (Model + Repository)
│   ├── models/             # model / dto
│   │   └── user_model.dart
│   │
│   ├── repositories/       # repository
│   │   └── user_repository.dart
│   │
│   └── datasources/        # แหล่งข้อมูล
│       ├── remote/         # api, http
│       │   └── user_api.dart
│       └── local/          # sqlite, sharedprefs
│           └── user_local.dart
│
├── features/               # แยกตาม feature
│   └── login/
│       ├── view/
│       │   └── login_view.dart
│       │
│       ├── viewmodel/
│       │   └── login_viewmodel.dart
│       │
│       └── widgets/        # widget เฉพาะ feature
│           └── login_button.dart
│
├── routes/
│   └── app_routes.dart
│
├── di/                     # dependency injection
│   └── injector.dart
│
└── main.dart
