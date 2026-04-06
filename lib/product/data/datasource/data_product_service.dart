import 'package:product/application/api/apclient.dart';
import 'package:product/application/constants/constants.dart';
import 'package:product/product/data/model/data_product_model.dart';

class DataProductService {
  final ApiClient apiClient;

  DataProductService(this.apiClient);

  Future<List<DataProductModel>> getData() async {
    try {
      final response = await apiClient.get(Constants.productEndpoint);

      print("STATUS: ${response.statusCode}");
      print("DATA TYPE: ${response.data.runtimeType}");

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data; // ✅ safer

        return jsonData.map((e) => DataProductModel.fromJson(e)).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("🔥 ERROR: $e"); // ✅ debug real problem
      rethrow; // ✅ don't hide error
    }
  }
}
