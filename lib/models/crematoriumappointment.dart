class CrematoriumAppointment {
  String user_id;
  String name;
  String address;
  String description;
  String appt_date;
  String appt_time;
  String package;

/**/

  CrematoriumAppointment( {
    this.user_id = "",
    required this.name,
    required this.address,
    required this.description,
    required this.appt_date,
    required this.appt_time,
    required this.package,

  });

  Map<String, String> getJson() {
    return {
      'user_id' : this.user_id,
      'name' : this.name,
      'address' : this.address,
      'description' : this.description,
      'appt_date' : this.appt_date,
      'appt_time': this.appt_time,
      'package' : this.package
    };
  }



}