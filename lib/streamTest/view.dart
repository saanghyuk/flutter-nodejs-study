import 'package:flutter/material.dart';
import 'package:flutterstudy/streamTest/provider.dart';
import 'package:provider/provider.dart';


class StreamTestPage extends StatelessWidget {
  const StreamTestPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    StreamTestProvider _provider = context.watch<StreamTestProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Text(_provider.value.toString(), style: TextStyle(fontSize: 50, color: Colors.blue)),
          Text(_provider.valueStream.toString(), style: TextStyle(fontSize: 50)),
          IconButton(onPressed: _provider.isStream ? _provider.cancel : null,
              icon: Icon(Icons.stop_circle)
          ),
          IconButton(onPressed: _provider.isPaused ? _provider.resume : _provider.pause, icon: _provider.isPaused ? Icon(Icons.play_arrow): Icon(Icons.pause)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child :Icon(Icons.add),
        onPressed: _provider.add,
      ),
    );
  }
}
