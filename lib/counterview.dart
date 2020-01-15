import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'strings.dart';
import 'favourites.dart';

final GetIt getIt = GetIt.instance;

class CounterView extends StatelessWidget {
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
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.decrement,
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ));
  }
}
