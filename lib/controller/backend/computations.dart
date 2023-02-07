import 'dart:convert';

import 'package:family/model/memberModel.dart';
import 'package:flutter/material.dart';

class Computations {
  Computations(this.context);
  final BuildContext context;

  Future<List<Member>> extractMemberTree(String jsonPath) async {
    List<Member> members = [];
    String json = await DefaultAssetBundle.of(context).loadString(jsonPath);
    List<dynamic> body = jsonDecode(json) as List<dynamic>;
    for (int i = 0; i < body.length; i++) {
      Map<String, dynamic> map = body[i];
      members.add(_getTree(map));
    }
    return members;
  }

  Member _getTree(Map<String, dynamic> map) {
    List<Member> children = [];
    if (map["Children"].isNotEmpty) {
      for (int i = 0; i < map["Children"].length; i++) {
        children.add(_getTree(map["Children"][i]));
      }
    }
    return Member.fromJson(map, children);
  }
}
