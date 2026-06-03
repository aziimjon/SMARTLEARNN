<div align="center">

# SmartLearn

### Cross-Platform Learning Management System

<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=22&pause=1000&color=02569B&center=true&vCenter=true&width=620&lines=AI-powered+Learning+Management+System;Flutter+client+for+mobile%2C+desktop+%26+web;Spring+Boot+REST+backend;Clean+Architecture+%7C+Scalable+%7C+Secure" />
</p>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Java](https://img.shields.io/badge/Java_21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot_4-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20macOS%20%7C%20Windows-555?style=flat-square)
![Status](https://img.shields.io/badge/status-diploma_project-blue?style=flat-square)

</div>

---

## 📖 Overview

**SmartLearn** is a cross-platform Learning Management System (LMS) built as a graduation thesis project — with an **AI tutor at its core**. A single **Flutter** codebase (mobile, desktop, web) is paired with a **Java Spring Boot** REST backend.

Its flagship feature is the **AI study assistant**: a personalized, Socratic-method tutor that answers course questions and guides learners step by step — a smart alternative to traditional self-study. Around it, SmartLearn covers the full educational workflow: courses and online courses, groups and schedules, attendance, homework and submissions, and resumable file uploads — all under a role and permission model (Admin, Teacher, Student, Parent).

---

## ✨ Key Features

- **🤖 AI study assistant (flagship)** — a personalized, Socratic-method AI tutor that answers course questions and guides learners — a smart alternative to traditional self-study
- **Role-based access control** — Admin, Teacher, Student and Parent profiles with granular permissions
- **Course management** — offline courses, sections, lessons, and self-paced online courses with progress tracking
- **Groups & scheduling** — group creation, lesson sessions, and recurring schedules
- **Attendance tracking** — marking and reviewing attendance per session
- **Homework** — assignments, submissions, and attachments
- **File handling** — resumable (TUS) uploads with MinIO object storage
- **Authentication & security** — JWT-based auth, rate limiting, and a configurable security layer
- **Internationalization** — English, Russian and Uzbek (en / ru / uz)
- **Real-time** — WebSocket (STOMP/SockJS) support for live updates
- **API documentation** — interactive Swagger UI via SpringDoc OpenAPI

---

## 📸 Screenshots

**Student app**

<p align="center">
  <img src="docs/screenshots/home.png" width="30%" />
  <img src="docs/screenshots/student_courses.png" width="30%" />
  <img src="docs/screenshots/ai_tutor.png" width="30%" />
</p>

**Admin panel**

<p align="center">
  <img src="docs/screenshots/users.png" width="30%" />
  <img src="docs/screenshots/courses.png" width="30%" />
  <img src="docs/screenshots/groups.png" width="30%" />
</p>

---

## 🏗 Architecture

A monorepo split into two independent applications plus project documentation:

```
SMARTLEARNN/
├── code/
│   ├── flutter/      # Flutter client (Android, iOS, Web, macOS, Windows)
│   └── backend/      # Spring Boot REST API (LMS server)
└── docs/             # Thesis, presentation and supporting documents
```

The Flutter client follows a **feature-first Clean Architecture** (data / domain / presentation layers) with dependency injection, a typed HTTP client and code-generated models. The backend is a layered **Spring Boot** service (controller → service → repository) with MapStruct DTO mappers, JPA specifications for filtering, and a modular security configuration.

---

## 🧰 Tech Stack

### 📱 Frontend — Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)

Riverpod · get_it / injectable · freezed · Dio · go_router · secure storage

### 🖥 Backend — Spring Boot

![Java](https://img.shields.io/badge/Java_21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot_4-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![Spring Security](https://img.shields.io/badge/Spring_Security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)
![Swagger](https://img.shields.io/badge/Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black)

Spring Boot 4 · Spring Security + JWT (jjwt) · Spring Data JPA / Hibernate · PostgreSQL · MinIO object storage · TUS resumable uploads · MapStruct + Lombok · Caffeine cache · SpringDoc OpenAPI (Swagger) · WebSocket (STOMP/SockJS) · Maven

### ⚙️ DevOps & Tools

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-121011?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (stable channel) and Dart
- JDK 21
- Docker & Docker Compose (recommended for the backend stack: app, PostgreSQL, MinIO)

### Frontend — Flutter client

```bash
cd code/flutter
flutter pub get
flutter run
```

### Backend — Spring Boot API

The API runs on port **8888**. Swagger UI: `http://localhost:8888/swagger-ui/index.html`

```bash
cd code/backend

# Option A — full stack with Docker (app + PostgreSQL + MinIO)
docker compose up -d --build

# Option B — run the app with Maven (needs PostgreSQL & MinIO running)
./mvnw spring-boot:run
```

> Copy `code/backend/.env.example` to `.env` and fill in the values (PostgreSQL, JWT secret, MinIO credentials) before running.

---

## 📑 Documentation

The `docs/` folder contains the full thesis and supporting materials:

| File | Description |
|------|-------------|
| Diploma_Work_SmartLearn.docx / .pdf | Graduation thesis (Word & PDF) |
| Presentation_SmartLearn.pptx | Defense presentation |
| Application_Kurbanov_A.pdf | Application document |

---

## 👥 Authors & Supervision

| Role | Person |
|------|--------|
| Author — Flutter client (mobile / desktop / web) & project lead | **Azimjon Kurbanov** ([@aziimjon](https://github.com/aziimjon)) |
| Backend — Spring Boot LMS API (collaboration) | **Abdurahmon Mirmaxsudov** ([@mirmaxsudov](https://github.com/mirmaxsudov)) |
| Academic supervisor | [@andreybond](https://github.com/andreybond) |
| Academic supervisor | [@Jelena1975](https://github.com/Jelena1975) |

---

## 🔗 Connect

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/azimjon_kurbanov)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/azimjon_kurbanov)
[![WhatsApp](https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.me/996999731999)
[![Gmail](https://img.shields.io/badge/Gmail-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:azimjon.kurbalovv@gmail.com)

---

<div align="center">

*Developed as a graduation thesis project · Riga Nordic University*

![Profile views](https://komarev.com/ghpvc/?username=aziimjon&style=flat-square)

</div>
