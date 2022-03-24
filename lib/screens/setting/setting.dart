import 'package:bearvoca/screens/setting/components/settingBody.dart';
import 'package:flutter/material.dart';

import 'components/settingHeader.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 프로필'),
      ),
      body: SingleChildScrollView(
        child: SettingBody(),
      ),
    );
  }
}
