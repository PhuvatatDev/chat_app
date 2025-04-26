# 💬 Chat App - Clean Architecture (Flutter + Firebase)

A chat application built using Flutter and Firebase, following Clean Architecture principles.  
This project is part of my journey to **learn how to structure my code properly** and **master Flutter development**.  
I am following a tutorial to help me **practice professional code organization** and **build production-ready apps** step by step.

---

## 🚀 Features (Work in Progress)

- ✅ Login & Register UI (with authentication toggle)
- ✅ Firebase project setup (configured with FlutterFire CLI)
- ✅ Firebase initialization inside `main.dart`
- ✅ App builds and connects to Firebase successfully
- 🔄 Firebase Authentication (sign-in & sign-up logic - in progress)
- 🔜 Real-time chat with Firestore
- 🔜 User presence & online status
- 🔜 Sending, reading, and displaying messages
- 🔜 Clean Architecture folder structure: `features/`, `config/`, `themes/`

---

## 📁 Project Structure

lib/ ├── components/ # Reusable UI widgets (buttons, textfields, user tiles) ├── models/ # Data models (e.g., Message) ├── pages/ # Screens/pages (home, chat, login, register, settings) ├── services/ # Business logic (auth and chat services) ├── theme/ # App themes (light mode, colors) ├── firebase_options.dart # Firebase configuration file └── main.dart # Entry point of the application
