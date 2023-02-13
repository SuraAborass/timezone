import 'package:get/get.dart';
import '../../DataAccessLayer/Models/brand.dart';
import '../../DataAccessLayer/Repositories/brand_repo.dart';

class TopBrandsController extends GetxController{
  BrandsRepo repo = BrandsRepo();
  List<Brand> topBrands = [];
  Brand? brand;
  var loading = false.obs;

  @override
  void onInit() async {
    await getBrands();
    super.onInit();
  }

  Future<void> getBrands() async {
    loading.value = true;
    topBrands = await repo.myBrands();
    update();
    loading.value = false;
  }
}