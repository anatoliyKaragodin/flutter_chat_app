
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
Выодит список чатов.
Например:
[{chat_id: 1, friend1_id: 1, friend2_id: 2, created_date: 2022-12-02T21:36:32.653712, deleted_date: , updated_date: 2022-12-02T21:36:32.653712}]
```
