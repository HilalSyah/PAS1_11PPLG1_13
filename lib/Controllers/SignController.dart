import 'package:get/get.dart';
import 'package:pas/Model/SignPostModel.dart';
import '../Service/ApiServiceSign.dart';

class Signcontroller extends GetxController {
  // Variabel reaktif untuk menyimpan data input
  var username = ''.obs;
  var password = ''.obs;
  var fullName = ''.obs;
  var email = ''.obs;

  var isLoading = false.obs;
  var isRegistered = false.obs;
  var message = "".obs;

  final ApiServiceSign apiService = ApiServiceSign();

  // Fungsi untuk register user
  Future<void> register() async {
    isLoading(true);

    try {
      // Buat model user
      final user = SignUserModel(
        username: username.value, // Ambil nilai dari variabel reaktif
        password: password.value,
        fullName: fullName.value,
        email: email.value,
      );

      final responseMessage = await apiService.registerUser(user);
      message.value = responseMessage;
      isRegistered(true);
      Get.snackbar('Success', 'Account Created Successfully');
    } catch (e) {
      message.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
