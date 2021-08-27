import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nyoba/provider/BannerProvider.dart';
import 'package:nyoba/provider/CategoryProvider.dart';
import 'package:nyoba/provider/FlashSaleProvider.dart';
import 'package:nyoba/provider/ProductProvider.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  bool isReload = false;

  Future<void> fetchHomeData(context) async {
    final banner = Provider.of<BannerProvider>(context, listen: false);
    await banner.fetchBanner();
    fetchHomeCategories(context);
  }

  Future<void> fetchHomeCategories(context) async {
    final categories = Provider.of<CategoryProvider>(context, listen: false);
    if (categories.categories.isEmpty){
      await categories.fetchCategories();
    }
    fetchProductCategories(context);
  }

  Future<void> fetchProductCategories(context) async {
    final categories = Provider.of<CategoryProvider>(context, listen: false);
    if (categories.productCategories.isEmpty){
      await categories.fetchProductCategories();
    }
    fetchBannerMini(context);
  }

  Future<void> fetchBannerMini(context) async {
    final banner = Provider.of<BannerProvider>(context, listen: false);
    await banner.fetchBannerMini();
  }

  Future<void> fetchFlashSale(context) async {
    final flashSale = Provider.of<FlashSaleProvider>(context, listen: false);
    await flashSale.fetchFlashSale();
    fetchNewProducts(context);
  }

  Future<void> fetchNewProducts(context) async {
    final product = Provider.of<ProductProvider>(context, listen: false);
    await product.fetchNewProducts('', page: 1);
    fetchSpecialProducts(context);
  }

  Future<void> fetchSpecialProducts(context) async {
    final product = Provider.of<ProductProvider>(context, listen: false);
    await product.fetchExtendProducts('special').then((value) {
      product.fetchSpecialProducts(product.productSpecial.products);
    });
    fetchBestProducts(context);
  }

  Future<void> fetchBestProducts(context) async {
    final product = Provider.of<ProductProvider>(context, listen: false);
    await product.fetchExtendProducts('our_best_seller').then((value) {
      product.fetchBestProducts(product.productBest.products);
    });
    fetchRecommendationProducts(context);
  }

  Future<void> fetchRecommendationProducts(context) async {
    final product = Provider.of<ProductProvider>(context, listen: false);
    await product.fetchExtendProducts('recomendation').then((value) {
      product.fetchRecommendationProducts(product.productRecommendation.products);
    });
    isReload = false;
  }
}
