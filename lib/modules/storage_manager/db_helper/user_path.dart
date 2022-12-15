import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class UserPath {
  String _path = 'test1';
  String setPath(String name) {
    var dbPath = '';
    getDbPath().then((value) => dbPath = value);
    _path = join(dbPath, 'sfera_$name.db');
    return _path;
  }

  Future<String> getDbPath() async {
    var dbPath = await getTemporaryDirectory();
    print('PATH: ${dbPath.path}');
    // var _dbFileName = 'sfera';
    return dbPath.path;
  }

  String get path => setPath('test2');
}
