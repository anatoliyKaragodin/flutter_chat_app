
### Первый терминал: запуск сервера
```
$ dart run bin/server.dart
Server listening on port 8080
```

### Второй терминал для запросов
```
$ curl http://localhost:8080
Connection!

$ curl http://localhost:8080/get_all_chats
Выводит список чатов.
Например:
[{chat_id: 1, friend1_id: 1, friend2_id: 2, created_date: 2022-12-02T21:36:32.653712, deleted_date: , updated_date: 2022-12-02T21:36:32.653712}]

$ curl -X POST http://localhost:8080/create_chat -H 'Content-Type: application/json' -d '{"users":[100, 200]}'
Создает чат.

Проверяем:
$ curl http://localhost:8080/get_all_chats
Ответ с сервера:
[{chat_id: 1, friend1_id: 1, friend2_id: 2, created_date: 2022-12-02T21:36:32.653712, deleted_date: , updated_date: 2022-12-02T21:36:32.653712}, {chat_id: 2, friend1_id: 11, friend2_id: 22, created_date: 2022-12-20T22:25:27.439540, deleted_date: null, updated_date: 2022-12-20T22:25:27.439540}, {chat_id: 3, friend1_id: 100, friend2_id: 200, created_date: 2022-12-20T22:35:41.081992, deleted_date: null, updated_date: 2022-12-20T22:35:41.083499}] 
```
