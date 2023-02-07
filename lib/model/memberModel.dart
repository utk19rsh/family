class Member {
  Member({
    required this.id,
    required this.name,
    required this.children,
    required this.packageAmount,
    required this.totalAchievedIncome,
    required this.totalExpectedIncome,
  });
  final String name;
  final List<Member> children;
  final int id;
  final double? packageAmount;
  final double totalAchievedIncome, totalExpectedIncome;

  factory Member.fromJson({
    required int id,
    required String name,
    required List<Member> children,
    required double packageAmount,
    required double totalAchievedIncome,
    required double totalExpectedIncome,
  }) {
    return Member(
      id: id,
      children: children,
      name: name,
      packageAmount: packageAmount,
      totalAchievedIncome: totalAchievedIncome,
      totalExpectedIncome: totalExpectedIncome,
    );
  }
}
