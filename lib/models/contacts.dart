class Contact {
  final int? id;
  final String name;
  final int accountNumber;

  Contact({this.id, required this.name, required this.accountNumber});

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? '',
        accountNumber = int.tryParse('${json['accountNumber']}') ?? 0;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'accountNumber': accountNumber,
      };
}
