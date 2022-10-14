

class Trip {
  String tester;
  String executorAndTrustee;
  String typeOfAssets;
  String executor1;
  String substituteExecutor;
  String gifts;
  String lawyer;

  Trip(
      this.tester,
      this.executorAndTrustee,
      this.typeOfAssets,
      this.executor1,
      this.substituteExecutor,
      this.gifts,
      this.lawyer,
      );

  Map<String, dynamic> toJson() => {
    'Tester': tester,
    'Executor and Trustee': executorAndTrustee,
    'Type of Assets': typeOfAssets,
    'Executor 1': executor1,
    'Substitute Executor': substituteExecutor,
    'Specific Gifts': gifts,
    'Lawyer': lawyer,
  };
}