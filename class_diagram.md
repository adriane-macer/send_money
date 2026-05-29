# Class Diagram

## Login

```txt
+----------------------+
|    LoginPage         |
+----------------------+
           |
           v
+----------------------+
|     LoginCubit       |
+----------------------+
           |
           v
+----------------------+
|    LoginUseCase      |
+----------------------+
           |
           v
+----------------------+
|   AuthRepository     |
+----------------------+
           |
           v
+----------------------+
| AuthRepositoryImpl   |
+----------------------+
```


## Send Money

```txt
+----------------------+
|  SendMoneyPage    |
+----------------------+
           |
           v
+----------------------+
|  SendMoneyCubit    |
+----------------------+
           |
           v
+-----------------------------+
| SendMoneyUseCase      |
+-----------------------------+
           |
           v
+-----------------------------+
| SendMoneyRepository       |
+-----------------------------+
           |
           v
+-----------------------------+
| SendMoneyRepositoryImpl   |
+-----------------------------+
           |
           v
+-----------------------------+
| SendMoneyRemoteDataSource |
+-----------------------------+
```

## Transactions

```txt
+----------------------+
|  TransactionsPage    |
+----------------------+
           |
           v
+----------------------+
|  TransactionCubit    |
+----------------------+
           |
           v
+-----------------------------+
| GetTransactionsUseCase      |
+-----------------------------+
           |
           v
+-----------------------------+
| TransactionRepository       |
+-----------------------------+
           |
           v
+-----------------------------+
| TransactionRepositoryImpl   |
+-----------------------------+
           |
           v
+-----------------------------+
| TransactionRemoteDataSource |
+-----------------------------+
```

# 🔄 Sequence Diagram
## Send Money Flow

```txt
User
  |
  | Tap Submit
  v
SendMoneyPage
  |
  v
SendMoneyCubit
  |
  v
SendMoneyUseCase
  |
  v
SendMoneyRepository
  |
  v
RemoteDataSource
  |
  v
Fake API

<----- Response -----

RemoteDataSource
  |
  v
Repository
  |
  v
UseCase
  |
  v
Cubit emits:
  - Loading
  - Success / Failure
  |
  v
UI updates
  |
  v
Bottom Sheet shown
```

# 🔄 Sequence Diagram — Transactions Fetch
```txt
User opens Transactions Page
          |
          v
BlocProvider create TransactionCubit()..fetch()
          |
          v
GetTransactionsUseCase
          |
          v
TransactionRepository
          |
          v
RemoteDataSource
          |
          v
API Request

<----- Response -----

Cubit emits:
- Loading
- Success / Failure

UI renders:
- Loader
- List
- Error
```