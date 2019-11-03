import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:tanaka_app/models/profile.dart';
import 'package:tanaka_app/stores/profile/profile_store.dart';
import 'package:tanaka_app/widgets/list_spinner/list_spinner.dart';

final profileStore = ProfileStore();

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  List<Function> disposers = [];
  Profile profile;

  @override
  void initState() {
    super.initState();
    // fetch all posts
    if (profile ?? true) {
      profileStore.fetchProfile(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 48, 0, 32),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image(
                      image: AssetImage('assets/images/me.jpg'),
                      fit: BoxFit.cover,
                      width: 200,
                    )),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Observer(builder: (_) {
                  if (profileStore.profile != null) {
                    return Html(
                      data: '${profileStore.profile?.description}',
                      linkStyle: const TextStyle(
                        color: Colors.cyan,
                      ),
                    );
                  }
                  return ListSpinner(loading: true);
                }))
          ],
        )));
  }
}
