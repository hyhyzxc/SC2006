

class Trip {
  String tester;
  String executorAndTrustee;
  String executor1;
  String substituteExecutor;
  String gifts;
  String lawyer;

  Trip(
      this.tester,
      this.executorAndTrustee,
      this.executor1,
      this.substituteExecutor,
      this.gifts,
      this.lawyer,
      );

  Map<String, dynamic> toJson() => {
    'Tester': tester,
    'Executor and Trustee': executorAndTrustee,
    'Executor 1': executor1,
    'Substitute Executor': substituteExecutor,
    'Specific Gifts': gifts,
    'Lawyer': lawyer,
  };
}