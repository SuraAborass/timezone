import 'package:get/get.dart';
import '../../DataAccessLayer/Models/category.dart';
import '../../DataAccessLayer/Repositories/category_repo.dart';

class CategoriesController extends GetxController{
  CategoriesRepo repo = CategoriesRepo();
  List<Category> categories = [];
  Category? category;
  var loading = false.obs;

  @override
  void onInit() async {
  await getCategories();
  super.onInit();
  }

  Future<void> getCategories() async {
  loading.value = true;
  categories = await repo.myCategories();
  update();
  loading.value = false;
  }


}