import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/helper/db_helper.dart';
import 'package:pas_mobile_11pplg1_25/models/store_model.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  final DBHelper _db = DBHelper();

  var favorites = <TableModelStore>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    try {
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(TableModelStore product) async {
    isLoading.value = true;
    try {
      await _db.insertFavorite(product);
      
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan favorit: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFavorite(int productId) async {
    isLoading.value = true;
    try {
      await _db.deleteFavorite(productId);
      final list = await _db.getFavorites();
      favorites.assignAll(list);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menghapus favorit: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleFavorite(TableModelStore product) async {
    if (isFavoriteSync(product.id)) {
      await removeFavorite(product.id);
    } else {
      await addFavorite(product);
    }
  }

  bool isFavoriteSync(int productId) => favorites.any((e) => e.id == productId);

  Future<bool> isFavorite(int productId) async {
    final row = await _db.getFavoriteRowByProductId(productId);
    return row != null;
  }
}
