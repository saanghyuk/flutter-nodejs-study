
import 'package:flutter/material.dart'; 

class GridTitleWidget extends StatelessWidget {
  // final Widget title;
  // final EdgeInsets padding;
  // final SliverGridDelegateWithFixedCrossAxisCount delegate;
  // final int itemCount;
  // final Widget Function(BuildContext, int) itemBuilder;

  const GridTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.redAccent,
          padding: EdgeInsets.all(20.0),
          child: Text("TITLE"),
        ),
        Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
            ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.blueAccent,
              )),
          )
      ],
    );
  }
}
