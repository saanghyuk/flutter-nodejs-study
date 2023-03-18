import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/info/page/infoPage.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:provider/provider.dart';
import 'package:singular_flutter_sdk/singular.dart';
import 'package:singular_flutter_sdk/singular_config.dart';


class InfoDetailPage extends StatefulWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  State<InfoDetailPage> createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    SingularConfig config = new SingularConfig('nate_cb8d7305c84d77e2dd54d2b498deda3f_c61a8065', 'c8ad58c6c483caf3061fb709b55abeab');
    config.customUserId = "jeongah0727@nate.com";
    Singular.start(config);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LogProvider logProvider = context.read<LogProvider>();


    return WillPopScope(
        onWillPop: () async {
          logProvider.send("InfoDetailPage - ${DateTime.now()}");
          return true;
        },
        child: InfoDetailPageView(),
      );
  }
}

class InfoDetailPageView extends StatelessWidget {
  const InfoDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HI"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            Singular.event("sngLogin");
            Singular.eventWithArgs("eventName", {"attributeName":"attributeValue"});
            return ListTile(
              onTap: (){
                // Singular.event(sngLogin);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    InfoItemPage.path, (route) => false
                );
              },
              leading: Icon(Icons.add_a_photo_outlined),
              title: Text("Hello - $index"),
              subtitle: Text("Welcome"),
              trailing: Icon(Icons.add_business),
            );
          }
      )
    );
  }
}
