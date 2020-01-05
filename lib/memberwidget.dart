import 'package:flutter/material.dart';

import 'member.dart';

class MemberState extends State<MemberWidget> {
  final Member member;

  MemberState(this.member);

  _showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(member.login),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
              Image.network(member.avatarUrl),
              RaisedButton(
                  child: Text('PRESS ME'),
                  onPressed: () {
                    _showAlertDialog(context);
                  })
            ])));
  }
}

class MemberWidget extends StatefulWidget {
  // 1
  final Member member;

  MemberWidget(this.member) {
    // 2
    if (member == null) {
      throw ArgumentError(
          "member of MemberWidget cannot be null. Received: '$member'");
    }
  }

  // 3
  @override
  createState() => MemberState(member);
}
