import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: _bodyWidget(context),
    );
  }

  _appBarWidget(context) {
    return AppBar(
      title: Text(
        'title_home'.tr,
        style: AppTextStyle.instance.subtitle1.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  _bodyWidget(context) {
    return const SizedBox();
  }
}
