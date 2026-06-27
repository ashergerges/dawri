enum ContractType { player, coaching, refereeing }

enum PaymentType { oneTime, monthly, perMatch }

class TargetUserModel {
  final String name;
  final String avatarUrl;
  final String roleBadgeKey;
  final String specialtyKey;

  const TargetUserModel({
    required this.name,
    required this.avatarUrl,
    required this.roleBadgeKey,
    required this.specialtyKey,
  });
}

class CreateContractMockData {
  static const targetUser = TargetUserModel(
    name: 'الكابتن خالد الشمري',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
    roleBadgeKey: 'createContractRoleBadgeCoach',
    specialtyKey: 'createContractSpecialty',
  );
}