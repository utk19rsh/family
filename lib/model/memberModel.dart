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

  factory Member.fromJson(Map<String, dynamic> map, List<Member> children) {
    return Member(
      id: map["Id"],
      name: map["Name"],
      children: children,
      packageAmount: map["PackageAmount"],
      totalAchievedIncome: map["TotalAchievedIncome"],
      totalExpectedIncome: map["TotalExpectedIncome"],
    );
  }
}
