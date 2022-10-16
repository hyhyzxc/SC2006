class AfterLifeFacilities{
  int id;
  String name;
  String address;
  String description;
  String phone;
  String link;
  int rating;
  double corlong; //coordinate longitude
  double corlat;  //coordinate latitude

  AfterLifeFacilities({
    this.id=0,
    this.name = "",
    this.address = "",
    this.description = "",
    this.phone = "",
    this.link="",
    this.rating = 0,
    this.corlong = 0,
    this.corlat = 0
  });

  factory AfterLifeFacilities.fromJson(Map<String, dynamic> json) {
    return AfterLifeFacilities(
      id:json['id'],
      name:json['name'],
      address:json['address'],
      description:json['description'],
      phone:json['phone'],
      link:json['link'],
      rating:json['rating'],
      corlong:json['corlong'],
      corlat:json['corlat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address']=this.address;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['link']=this.link;
    data['rating'] = this.rating;
    data['corlong'] = this.corlong;
    data['corlat'] = this.corlat;

    return data;
  }


}