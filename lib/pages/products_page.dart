import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/controller/products_controller.dart';
import 'package:pas_mobile_11pplg1_25/components/custom_product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.find<ProductsController>();

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productList.isEmpty) {
          return Center(
            child: Text(
              'Tidak ada produk',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              final item = controller.productList[index];
              return ProductCard(
                product: item,
                onFavoriteChanged: (isFav) {
                  if (isFav) {
                    Get.snackbar('Favorit', 'Ditambahkan ke favorit');
                  } else {
                    Get.snackbar('Favorit', 'Dihapus dari favorit');
                  }
                },
              );
            },
          ),
        );
      }),
    );
  }
}
