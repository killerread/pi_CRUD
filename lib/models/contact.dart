class Contact {
  int? id;
  String name;
  String email;
  String phone;

  Contact({this.id, required this.name, required this.email, required this.phone});

  // Convert Contact to Map (for database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  // Convert Map to Contact
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
