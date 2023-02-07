import 'package:family/controller/backend/computations.dart';
import 'package:family/controller/constants/constants.dart';
import 'package:family/model/memberModel.dart';
import 'package:family/views/home/components/memberTile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Member>>(
      future: Computations(context).extractMemberTree("assets/data.json"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Member> members = snapshot.data!;
          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(title: const Text("Family Tree")),
            body: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: members
                          .map(
                            (e) => MemberTile(members: [e]),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
