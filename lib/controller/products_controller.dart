import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_25/models/store_model.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var productList = <TableModelStore>[].obs;

  static const String baseUrl = "https://fakestoreapi.com/products";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // API returns a JSON array -> parse to List<TableModelStore>
        final products = tableModelStoreFromJson(response.body);
        productList.assignAll(products);
        Get.snackbar(
          'Berhasil',
          'Berhasil mengambil ${products.length} produk',
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal mengambil data produk: ${response.statusCode}',
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data produk: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await fetchProducts();
  }
}
