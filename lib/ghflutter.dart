import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'member.dart';
import 'strings.dart';
import 'memberwidget.dart';

final GetIt getIt = GetIt.instance;

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}

class GHFlutterState extends State<GHFlutter> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  _pushMember(Member member) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemberWidget(member)));
  }

  Widget _buildRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListTile(
            dense: true,
            title: Text("${_members[i].login}", style: _biggerFont),
            leading: CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage(_members[i].avatarUrl)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              _pushMember(_members[i]);
            }));
  }

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = json.decode(response.body);

      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.appTitle),
        ),
        body: ListView.separated(
            itemBuilder: (_, position) {
              return _buildRow(position);
            },
            itemCount: _members.length,
            separatorBuilder: (context, index) {
              return Divider();
            }));
  }
}
