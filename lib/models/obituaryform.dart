class obiTrip {
  String name;
  String dateofdeath;
  String locationofwake;
  String funeraldate;
  String funeraltime;
  String familynames;
  String newspaper;
  //DateTime startDate;
  //DateTime endDate;

  obiTrip(
      this.name,
      this.dateofdeath,
      this.locationofwake,
      this.funeraldate,
      this.funeraltime,
      this.familynames,
      this.newspaper
      );

  Map<String, dynamic> toJson() => {
    'title': name,
    'dateofdeath': dateofdeath,
    'location': locationofwake,
    'funeraldate': funeraldate,
    'funeraltime': funeraltime,
    'familynames': familynames,
    'newspaper': newspaper,
  };
}