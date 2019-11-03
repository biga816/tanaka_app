import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

import 'package:tanaka_app/models/profile.dart';

// Include generated file
part 'profile_store.g.dart';

// This is the class used by rest of your codebase
class ProfileStore = _ProfileStore with _$ProfileStore;

// The store-class
abstract class _ProfileStore with Store {
  @observable
  // Observable<Profile> profile = Observable(null);
  Profile profile;

  @action
  Future fetchProfile(int id) async {
    String url = "http://blog.tanakas.org/wp-json/wp/v2/users/" + id.toString();
    Map<String, dynamic> params = {"_embed": null};

    Response response = await Dio().get(url, queryParameters: params);
    Profile _profile = Profile.fromMap(response.data);

    // this.profile.value = _profile;
    this.profile = _profile;
  }
}
