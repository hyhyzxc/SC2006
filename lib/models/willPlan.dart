class WillPlan {
  String user_id;
  String testator_name;
  String executor_and_trustee;
  String type_of_assets;
  String executor_1;
  String substitute_executor;
  String specific_gifts;

/**/

  WillPlan( {
    this.user_id = "",
    required this.testator_name,
    required this.executor_and_trustee,
    required this.type_of_assets,
    required this.executor_1,
    required this.substitute_executor,
    required this.specific_gifts,
  });

  Map<String, String> getJson() {
    return {
      'user_id' : this.user_id,
      'tester_name' : this.testator_name,
      'executor_and_trustee' : this.executor_and_trustee,
      'type_of_assets' : this.type_of_assets,
      'executor_1' : this.executor_1,
      'substitute_executor': this.substitute_executor,
      'specific_gifts' : this.specific_gifts,
    };
  }


}