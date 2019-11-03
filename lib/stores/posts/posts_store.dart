import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

import 'package:tanaka_app/models/post.dart';

// Include generated file
part 'posts_store.g.dart';

// This is the class used by rest of your codebase
class PostsStore = _PostsStore with _$PostsStore;

// The store-class
abstract class _PostsStore with Store {
  @observable
  ObservableList<Post> posts = ObservableList.of([]);

  @observable
  int page = 1;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @action
  Future fetchPosts(int page) async {
    try {
      this.loading = true;
      if (page == 1) {
        this.posts.clear();
      }

      String url = "http://blog.tanakas.org/wp-json/wp/v2/posts";
      Map<String, dynamic> params = {
        "page": page,
        "per_page": 10,
        "_embed": null
      };

      Response response = await Dio().get(url, queryParameters: params);
      List<Post> _posts =
          response.data.map<Post>((data) => Post.fromMap(data)).toList();

      this.posts.addAll(_posts);
      this.page = page;
    } catch (e) {
      if (e is DioError &&
          e.response.statusCode == 400 &&
          e.response.data['code'] == 'rest_post_invalid_page_number') {
        return;
      }
      print(e);
    } finally {
      this.loading = false;
    }
  }
}
