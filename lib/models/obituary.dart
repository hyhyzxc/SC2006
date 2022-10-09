class Obituary{

  int id;
  String name;
  String phone;

  Obituary({
    this.id = 0,
    this.name = "",
    this.phone = "",
  });

  factory Obituary.fromJson(Map<String, dynamic> json) {
    return Obituary(
      id: json['id'],
      name:json['name'],
      phone:json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;

    return data;
  }



}