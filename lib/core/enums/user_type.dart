enum UserType {
  private,
  business;

  static UserType fromString(String value) {
    switch (value.trim().toLowerCase()) {
      case 'private':
        return UserType.private;
      case 'business':
        return UserType.business;
      default:
        throw Exception('Unknown UserType: $value');
    }
  }
}

enum OperationType {
  deposit,
  withdraw;

  static OperationType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'deposit':
        return OperationType.deposit;
      case 'withdraw':
        return OperationType.withdraw;
      default:
        throw Exception('Unknown OperationType: $value');
    }
  }
}