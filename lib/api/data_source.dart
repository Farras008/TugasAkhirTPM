import 'package:tugasakhirtpm/model/products_model.dart';

import 'base_network.dart';

class DataSource {
  static DataSource instance = DataSource();

  Future<List<ProductsModel>> loadMakeup(String username) {
    return BaseNetwork.getMakeup("${username}");
  }
}