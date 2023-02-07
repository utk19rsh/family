import 'package:family/controller/constants/constants.dart';
import 'package:family/model/memberModel.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatefulWidget {
  const MemberTile({
    Key? key,
    required this.members,
  }) : super(key: key);

  final List<Member> members;

  @override
  State<MemberTile> createState() => _MemberTileState();
}

class _MemberTileState extends State<MemberTile> {
  bool showChildren = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10).copyWith(left: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.members.length,
      itemBuilder: (context, index) {
        Member user = widget.members[index];
        Color color = red;
        if (user.packageAmount != null) {
          if (user.packageAmount! > 0 &&
              user.totalAchievedIncome < user.totalExpectedIncome) {
            color = green;
          } else if (user.packageAmount == 0) {
            color = red;
          } else if (user.packageAmount! > 0 &&
              user.totalAchievedIncome >= user.totalExpectedIncome) {
            color = pink;
          }
        }
        return Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => showChildren = !showChildren),
                  child: Row(
                    children: [
                      Icon(
                        showChildren
                            ? Icons.remove_circle_outline_sharp
                            : Icons.add_box_outlined,
                        color: user.children.isNotEmpty ? color : trans,
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          user.name,
                          style: const TextStyle(color: white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: showChildren && user.children.isNotEmpty
                  ? MemberTile(members: user.children)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
