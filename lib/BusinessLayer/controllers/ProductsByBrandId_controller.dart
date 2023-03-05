import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/top_brands_controller.dart';
import '../../DataAccessLayer/Models/brand.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/productsByBrandId_repo.dart';


class ProductsByBrandIdController extends GetxController{
  final TopBrandsController brandsController = Get.find();
  ProductsByBrandRepo repo = ProductsByBrandRepo();
  Product? product;
  List<Product> products = [];
  final Brand brand;
  ProductsByBrandIdController(this.brand);
  var loading = false.obs;

  @override
  void onInit() async {
    await getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    loading.value = true;
    products = await repo.products(brand.id);
    update();
    loading.value = false;
  }

}