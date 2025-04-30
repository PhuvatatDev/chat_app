# 💬 Chat App - Flutter + Firebase

This project is a messaging application built with **Flutter** and **Firebase**.

I followed a YouTube tutorial by **Mitch Koko** to learn how to structure my code properly in a real-world Flutter app.  
While this isn’t a full Clean Architecture setup, the code is clean, modular, and well organized.

✅ **Tutorial completed.**  
This marks the end of the learning journey for this chat application.

---

## 🎯 Purpose

The main goal of this project was to **master real-time messaging with Firebase**, and learn how to:

- Organize and modularize Flutter code
- Work with Firebase Authentication and Firestore
- Implement chat and user interaction logic
- Stream and display real-time data using `StreamBuilder`

---

## 🚀 Features

### 🔐 Authentication
- Email & password login and registration
- Firebase Authentication integrated

### 💬 Chat System
- Send and receive real-time messages with Firestore
- Auto-updating message list with `StreamBuilder`
- Custom `ChatBubble` UI widget
- Unique chat room ID generation between two users

### 👥 User Management
- Display a list of all users (excluding self)
- Navigate to private one-on-one chat
- Block / Unblock users
- Filter out blocked users from chat list
- Dedicated blocked users screen with unblock action

### 🚨 Moderation
- Report messages (stored in a `Reports` collection in Firestore)

---

## 🧠 What I Learned

- Working with **Firebase Firestore streams**
- Structuring a Flutter project into **components, pages, and services**
- Handling **real-time user interactions**
- Designing backend logic with clean frontend interaction
- Debugging real-world Flutter issues (`RangeError`, async handling, etc.)

---

## 📁 Project Structure

```bash
/lib
├── components/       # Reusable UI widgets (user_tile, chat_bubble)
├── models/           # Data models (Message)
├── pages/            # UI pages (home, login, register, chat, blocked)
├── services/
│   ├── auth/         # Firebase Auth logic
│   └── chat/         # Chat logic: messaging, blocking, reporting
└── main.dart         # App entry point
