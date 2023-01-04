import 'package:flutter/material.dart';

class InfoItemPage extends StatelessWidget {
  static const String path = "/info/detail/item";
  const InfoItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItemPageView();
  }
}

class InfoItemPageView extends StatelessWidget {
  const InfoItemPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

