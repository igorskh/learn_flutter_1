import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'strings.dart';
import 'favourites.dart';
import 'ghflutter.dart';
import 'counterview.dart';

final GetIt getIt = GetIt.instance;

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = getIt.get<Favourites>();

    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<int>(
                  stream: _counter.subjectCounter,
                  builder: (context, snapshot) {
                    return Text(
                      'You have pushed the button ${snapshot.data} times',
                    );
                  }),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GHFlutter()));
                },
                child: Text(
                    'Members List',
                    style: TextStyle(fontSize: 20)
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CounterView()));
                },
                child: Text(
                    'Counter View',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
