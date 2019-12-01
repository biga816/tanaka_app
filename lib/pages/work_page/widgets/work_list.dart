import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import 'package:tanaka_app/stores/works/works_store.dart';
import 'package:tanaka_app/models/work.dart';
import 'package:tanaka_app/widgets/list_spinner/list_spinner.dart';
import './work_list_item.dart';

final work = WorksStore();

class WorkList extends StatefulWidget {
  @override
  WorkListState createState() => WorkListState();
}

class WorkListState extends State<WorkList> with TickerProviderStateMixin {
  AnimationController animationController;
  ScrollController controller;
  List<Function> disposers = [];
  bool isEnableLoading = true;
  List<Work> works = [];

  @override
  void initState() {
    super.initState();
    controller = new ScrollController();
    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);

    // fetch all works
    if (work.page == 1 && work.works.length == 0) {
      work.fetchWorks(work.page);
    }

    // observe store
    disposers.add(work.works.observe((list) {
      isEnableLoading = true;
      works = list.object.toList();
    }));
  }

  @override
  void dispose() {
    disposers.forEach((disposer) => disposer());
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: new RefreshIndicator(
        onRefresh: () => work.fetchWorks(1),
        child: Observer(builder: (_) {
          return ListView.builder(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 90),
              controller: controller,
              itemBuilder: (context, i) {
                if (i < work.works.length) {
                  // item
                  // if (i.isOdd) return Divider();
                  // final index = i ~/ 2;
                  animationController.forward();
                  return _buildRow(
                    work.works[i],
                    Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: this.animationController,
                        curve: Interval((1 - 1 / (i + 1)) * 1, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                  );
                } else {
                  // loading
                  return Observer(
                    builder: (_) => Padding(
                      padding: EdgeInsets.only(bottom: 58),
                      child: ListSpinner(loading: work.loading),
                    ),
                  );
                }
              },
              itemCount: work.works.length + 1);
        }),
      ),
    );
  }

  Widget _buildRow(Work work, Animation animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    child: WorkListItem(
                      thumbnail: Image(
                          image: NetworkImage(work.media.medium),
                          fit: BoxFit.cover),
                      title: work.title,
                      body: work.content,
                    ),
                    onTap: () => goToDetail(work)),
              ),
            ),
          );
        });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0 && isEnableLoading) {
        isEnableLoading = false;
        work.fetchWorks(work.page + 1);
      }
    }
    return false;
  }

  void goToDetail(Work work) {
    // open link
    html.window.open(work.link, '_blank');
  }
}
