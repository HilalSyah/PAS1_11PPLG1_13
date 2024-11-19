import 'package:get/get.dart';
import 'package:pas/Model/LoginPostModel.dart';
import 'package:pas/Pages/Home.dart';
import '../Service/ApiServiceLogin.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isLogged = false.obs;
  var userData = Rxn<LoginModel>(); // Gunakan Rxn untuk memungkinkan null

  final ApiServiceLogin apiService = ApiServiceLogin();

  // Fungsi untuk login
  Future<void> login(String username, String password) async {
    isLoading(true);
    print('Mengirim username: $username, password: $password');
    try {
      final user = await apiService.login(username, password);
      userData.value = user;
      isLogged(true);
      Get.snackbar('Success', 'Login berhasil');
      Get.offAll(() => const Home());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
