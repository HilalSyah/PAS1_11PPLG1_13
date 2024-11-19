import 'package:get/get.dart';
import 'package:pas/Model/GetModel.dart';
import 'package:pas/Service/ApiServiceGet.dart';

class Postcontroller extends GetxController {

  var isLoading = true.obs;
  var postlist = <Getmodel>[].obs;

  @override
  void onInit() {
    fecthPost();
    super.onInit();
  }

  void fecthPost() async {
    try {
      isLoading(true);
      var posts = await ApiServiceGet().fetchPosts();
      postlist.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }

}