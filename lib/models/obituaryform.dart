class obiTrip {
  String name;
  String dateofdeath;
  String locationofwake;
  String funeraldate;
  String funeraltime;
  String familynames;
  String phone;
  String newspaper;

  obiTrip(
      this.name,
      this.dateofdeath,
      this.locationofwake,
      this.funeraldate,
      this.funeraltime,
      this.familynames,
      this.phone,
      this.newspaper
      );

  Map<String, dynamic> toJson() => {
    'title': name,
    'dateofdeath': dateofdeath,
    'location': locationofwake,
    'funeraldate': funeraldate,
    'funeraltime': funeraltime,
    'familynames': familynames,
    'phone': phone,
    'newspaper': newspaper,
  };
}
