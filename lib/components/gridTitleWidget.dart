
import 'package:flutter/material.dart'; 

class GridTitleWidget extends StatelessWidget {
  final Widget title;
  final EdgeInsets padding;
  final SliverGridDelegateWithFixedCrossAxisCount delegate;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const GridTitleWidget({Key? key, required this.title, required this.padding, required this.delegate, required this.itemCount, required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        this.title,
        Expanded(
            child: GridView.builder(
                padding: this.padding,
                gridDelegate: this.delegate,
                itemCount: this.itemCount,
                itemBuilder: this.itemBuilder,
          )
        )],
    );
  }
}
