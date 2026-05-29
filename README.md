# Send Money App

A Flutter Send Money application built using:

- Clean Architecture
- Cubit State Management
- go_router
- get_it
- TDD (Test-Driven Development)

---

# Features

## Authentication
- Login
- Logout
- Route navigation

## Dashboard
- Wallet balance
- Show/Hide balance
- Send Money button
- View Transactions button

## Send Money
- Amount validation
- API submission
- Loading state
- Success/Error bottom sheet

## Transactions
- Fetch transactions from API
- Loading state
- Failure state

---

# Architecture

The project follows:

```txt
Presentation
    ↓
Cubit
    ↓
UseCase
    ↓
Repository
    ↓
DataSource
    ↓
API

lib/
├── app/
├── core/
├── features/
│   ├── auth/
│   ├── send_money/
│   ├── transactions/
│   └── wallet/
```

##  Packages
- flutter_bloc
- go_router
- get_it
- equatable
- http
- mocktail
- bloc_test

# API Used

## Fake API:

https://jsonplaceholder.typicode.com/

# Getting Started
## Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VSCode / any IDE 

Check Flutter version:
```txt
flutter --version
```

## Installation

Clone repository:
```txt
git clone https://github.com/adriane-macer/send_money
```

Go to project:
```txt
cd send_money
```

Install dependencies:
```txt
flutter pub get
```

Run app:
```txt
flutter run
```

Run Unit Tests:
```txt
flutter test
```

## Folder Structure
```txt
lib/
├── app/
│   ├── router/
│   └── injector/
│
├── core/
│   └── constants/
│
├── features/
│   ├── auth/
│   ├── wallet/
│   ├── send_money/
│   └── transactions/
```

## Sample Credential
username: admin
password: 1234

# Design Decisions
## Why Cubit?

Simpler than Bloc for small-medium state handling.

## Why Clean Architecture?
- scalable
- testable
- maintainable
- feature isolation

## Why go_router?
- declarative routing
- route guards support
- scalable navigation

## Why get_it?

Simple dependency injection.

# Future Improvements
- Themes
- Typography
- Offline support
- Local database caching
- Pagination
- Token authentication
- Real backend integration

[Class Diagram](class_diagram.md)
[Design Document](design_document.md)


