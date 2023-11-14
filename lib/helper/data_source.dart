
import 'base_netwrok.dart';

class StarDataSource {
  static StarDataSource instance = StarDataSource();
  Future<Map<String, dynamic>> loadCharcters() {
    return BaseNetwork.get("films");
  }
}
