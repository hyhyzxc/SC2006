class Lawyer{
  String user_id;
  int id;
  String firm;
  String address;
  String name;
  int experience;
  String fluency;
  String phone;

  Lawyer({
    this.user_id="",
    this.id=0,
    this.firm="",
    this.address="",
    this.name="",
    this.experience=0,
    this.fluency="",
    this.phone = "",
  });

  factory Lawyer.fromJson(Map<String, dynamic> json) {
    return Lawyer(
      id:json['id'],
      firm:json['firm'],
      address:json['address'],
      name:json['name'],
      experience:json['experience'],
      fluency:json['fluency'],
      phone:json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firm'] = this.firm;
    data['address'] = this.address;
    data['name'] = this.name;
    data['experience'] = this.experience;
    data['fluency'] = this.fluency;
    data['phone'] = this.phone;

    return data;
  }

  Map<String, String> getJson() {
    return {
      'user_id' : this.user_id,
      'name' : this.name,
      'firm' : this.firm,
      'address' : this.address,
      'experience' : this.experience.toString()+" years",
      'fluency': this.fluency,
      'phone' : this.phone,
    };
  }
}