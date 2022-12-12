import '../../library/library_server.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import "dart:io" as io;

class DbServerServices implements IDbServerServices {
  @override
  Future<Database> openDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    var path = ".dart_tool/sqflite_common_ffi/databases/main_db.db";

    var dbExists = await io.File(path).exists();

    if (!dbExists) {
      createDatabase();
      return await databaseFactory.openDatabase('main_db.db');
    }
    return await databaseFactory.openDatabase('main_db.db');
  }

  Future createDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;

    var db = await databaseFactory.openDatabase('main_db.db');
    await db.transaction((txn) async {
      await txn.execute('''
          CREATE TABLE users
          (
          main_users_id     integer PRIMARY KEY AUTOINCREMENT,
          name              char(50) NOT NULL,
          email             char(50) NOT NULL,
          created_date      char(26) NOT NULL,
          profile_pic_url   char(50) NOT NULL,
          updated_date      char(26),
          deleted_date      char(26),
          hash_connect      integer UNIQUE,
          password          char(256),
          CHECK (LENGTH(created_date) >= 26),
          );
        ''');

      await txn.execute('''
          CREATE TABLE friends_chat
          (
          chat_id               integer PRIMARY KEY AUTOINCREMENT,
          friend1_id           integer NOT NULL,
          friend2_id           integer NOT NULL,
          created_date          char(26) NOT NULL,
          delete_date           char(26),
          updated_date          char(26),
          CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( main_users_id ),
          CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( main_users_id )
          );
        ''');

      await txn.execute('''
          CREATE TABLE messages
          (
          message_id       integer PRIMARY KEY AUTOINCREMENT,
          chat_id          integer NOT NULL,
          sender_id        integer NOT NULL,
          content          char(50) NOT NULL,
          created_date     char(26) NOT NULL,
          updated_date      char(26),
          deleted_date      char(26),
          CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( chat_id ) REFERENCES friends_chat ( chat_id ),
          CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( main_users_id ),
          CHECK (LENGTH(created_date) >= 26)
          );
        ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_2 ON friends_chat
          (
          friend1_id
          );
        ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_3 ON friends_chat
          (
          friend2_id
          )
        ''');

      await txn.execute('''
          CREATE INDEX MESSAGES_FK_2 ON messages
          (
          chat_id
          );
      ''');
      await txn.execute('''
          CREATE INDEX MESSAGES_FK_3 ON messages
          (
          sender_id
          );
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, hash_connect, password) VALUES ('test1', 't1@t1.t1', '2022-12-02T21:36:32.653712', 'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg', '', '', 1, 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, hash_connect, password) VALUES ('test2', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg', '', '', 2, 'pass',)
      ''');
      await txn.execute('''
          INSERT INTO friends_chat (friend1_id, friend2_id, created_date, deleted_date, updated_date) VALUES (1, 2, '2022-12-02T21:36:32.653712', '', '')
      ''');
    });
  }
}
