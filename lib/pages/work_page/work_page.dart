import 'package:flutter/material.dart';
import './widgets/work_list.dart';
import 'package:tanaka_app/widgets/fixed_body/fixed_body.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work'),
      ),
      body: FixedBody(
        child: WorkList(),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
