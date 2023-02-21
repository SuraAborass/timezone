import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import '../../DataAccessLayer/Models/favourite.dart';
import '../../DataAccessLayer/Repositories/favourite_repo.dart';



class FavouriteController extends GetxController{
  final UserController userController = Get.find();
  late List<Favourite> userFavourites = [];
  var favouriteRepo = FavouriteRepo();
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getFavourites();
    super.onInit();
  }

  Future<void> getFavourites() async {
    isLoading.value = true;
    userFavourites = await favouriteRepo.getUserFavourites(userController.user!.id);
    print(userFavourites);
    update();
    isLoading.value = false;
  }
}