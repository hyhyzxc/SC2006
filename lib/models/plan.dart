class Plan {
  String user_id;
  String obituaryPlanID;

  Plan({
    this.user_id = "",
    this.obituaryPlanID = "",
  });

  Map<String, String> getJson() {
    return {
      'user_id': this.user_id,
      'obituaryPlanID': this.obituaryPlanID,
    };
  }

  static Plan fromJson(Map<String, dynamic> json) => Plan(
    user_id: json['user_id'],
    obituaryPlanID: json['obituaryPlanID'],
  );
}