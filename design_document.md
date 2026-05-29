
# 📘 Design Documentation

## Architecture Overview

```txt
Clean Architecture

Presentation Layer
    ↓
Domain Layer
    ↓
Data Layer
```

## 1. Presentation Layer

Responsible for:

- UI
- Cubit state management
- Navigation

Components:
- Pages
- Widgets
- Cubits
- States

Example:
```txt
SendMoneyPage
    ↓
SendMoneyCubit
    ↓
SendMoneyState
```

## 2. Domain Layer

Responsible for:

- Business rules
- Use cases
- Repository contracts

Components:
```txt
Entities
Repositories
UseCases
```

Example:
```txt
GetTransactionsUseCase
```

## 3. Data Layer

Responsible for:

- API communication
- DTO/model parsing
- Repository implementation

Components:

- RemoteDataSource
- RepositoryImpl
- Models

## State Management Flow
```txt
UI Event
   ↓
Cubit Action
   ↓
UseCase
   ↓
Repository
   ↓
API
   ↓
Cubit State
   ↓
UI Update
```

## Routing Design

Using go_router

Routes:

```txt
/
/dashboard
/send-money
/transactions
```

## Dependency Injection

Using get_it

Responsibilities:

- decouple dependencies
- easier testing
- singleton management

# Testing Strategy
## Unit Tests
- UseCases
- Cubits
- Validators
## Widget Tests
- Navigation
- UI states
- Button interactions
## Repository Tests
- API contract behavior
- Model Tests
- JSON parsing


