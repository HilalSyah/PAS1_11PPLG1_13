import 'package:get/get.dart';
import 'package:pas/Model/GetModel2.dart';
import 'package:pas/Service/ApiServiceGet2.dart';

class AnimeController extends GetxController {
  var isLoading = false.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      var posts = await AnimeService.fetchPosts();
      postList.assignAll(posts);
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
