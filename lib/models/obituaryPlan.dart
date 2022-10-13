
class ObituaryPlan {
  String user_id;
  String deceased_name;
  String date_of_death;
  String location_of_wake;
  String funeral_date;
  String funeral_time;
  String names_of_family;

/**/

  ObituaryPlan( {
    this.user_id = "",
    required this.deceased_name,
    required this.date_of_death,
    required this.location_of_wake,
    required this.funeral_date,
    required this.funeral_time,
    required this.names_of_family,

  });

  Map<String, String> getJson() {
    return {
      'user_id' : this.user_id,
      'deceased_name' : this.deceased_name,
      'date_of_death' : this.date_of_death,
      'location_of_wake' : this.location_of_wake,
      'funeral_date' : this.funeral_date,
      'funeral_time': this.funeral_time,
      'names_of_family' : this.names_of_family
    };
  }


}