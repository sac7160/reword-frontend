import 'package:bearvoca/screens/setting/components/settingBody.dart';
import 'package:flutter/material.dart';

import 'components/settingHeader.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: SingleChildScrollView(
        child: SettingBody(),
      ),
    );
  }
}
