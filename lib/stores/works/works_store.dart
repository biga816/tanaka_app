import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

import 'package:tanaka_app/models/work.dart';

// Include generated file
part 'works_store.g.dart';

// This is the class used by rest of your codebase
class WorksStore = _WorksStore with _$WorksStore;

// The store-class
abstract class _WorksStore with Store {
  @observable
  ObservableList<Work> works = ObservableList.of([]);

  @observable
  int page = 1;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @action
  Future fetchWorks(int page) async {
    try {
      this.loading = true;

      String url = "http://blog.tanakas.org/wp-json/wp/v2/works";
      Map<String, dynamic> params = {
        "page": page,
        "per_page": 10,
        "_embed": null
      };

      Response response = await Dio().get(url, queryParameters: params);
      List<Work> _works =
          response.data.map<Work>((data) => Work.fromMap(data)).toList();

      if (page == 1) {
        this.works.clear();
      }

      this.works.addAll(_works);
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
