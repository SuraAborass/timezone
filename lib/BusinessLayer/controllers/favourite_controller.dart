import 'package:get/get.dart';
import 'package:timezone/DataAccessLayer/Clients/box_client.dart';
import 'package:timezone/DataAccessLayer/Models/favourite.dart';
import 'package:timezone/DataAccessLayer/Models/product.dart';
import 'package:timezone/DataAccessLayer/Repositories/product_repo.dart';
import 'package:timezone/PresentationLayer/widgets/snackbars.dart';

class FavouriteController extends GetxController {
  ProductRepo productRepo = ProductRepo();
  BoxClient boxClient = BoxClient();
  List<Favourite> favoritesProducts = [];
  List<Product> products = [];

  var adding = false.obs;

  num totalValue = 0;
  num discount = 0;
  num netValue = 0;
  @override
  void onInit() async {
    await getFavorites();
    await syncCartsOnline();

    super.onInit();
  }

  Future<void> getFavorites() async {
    favoritesProducts = await boxClient.getFavorites();
    print(favoritesProducts);
    update();
  }

  Future<void> syncFavorites() async {
    if (products.isNotEmpty) {
      favoritesProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    update();
  }

  Future<void> syncCartsOnline() async {
    List<int> ids = favoritesProducts.map((e) => e.productId).toList();
    products = await productRepo.productsByIds(ids);
    if (products.isNotEmpty) {
      print(products);
      for (var favoriteitem in favoritesProducts) {
        favoriteitem.product = products
            .where((element) => element.id == favoriteitem.productId)
            .first;
      }
      favoritesProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    update();
  }

  Future<void> toggleFavorite(Product? product) async {
    if (product != null) {
      Favourite? index = favoritesProducts
          .firstWhereOrNull((element) => element.productId == product.id);
      if (index != null) {
        favoritesProducts
            .removeWhere((element) => element.productId == product.id);
        SnackBars.showSuccess("Removed Successfully");
      } else {
        var favorite = Favourite(productId: product.id);
        adding.value = true;
        products.add(product);
        favorite.product = product;
        favoritesProducts.add(favorite);
        await boxClient.AddToFavorite(favoritesProducts);
        adding.value = false;
        SnackBars.showSuccess("Added Successfully");
      }
      print(favoritesProducts);
      await syncFavorites();
      update();
    }
  }

  bool checkFavorite(Product product) {
    Favourite? index = favoritesProducts
        .firstWhereOrNull((element) => element.productId == product.id);
    if (index != null) {
      return false;
    }
    return true;
  }
}
