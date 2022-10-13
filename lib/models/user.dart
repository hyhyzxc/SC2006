class Users {
  String user_id;
  String username;
  String email;
  String contactNumber;

  Users ({
    this.user_id = "",
    required this.username,
    required this.email,
    required this.contactNumber,
  });

  Map<String, String> getJson() {
    return {
      'user_id': this.user_id,
      'username' : this.username,
      'email': this.email,
      'contactNumber' : this.contactNumber,
    };
  }

  static Users fromJson(Map<String, dynamic> json) => Users(
    user_id: json['user_id'],
    username: json['username'],
    email: json['email'],
    contactNumber: json['contactNumber'],
  );
}