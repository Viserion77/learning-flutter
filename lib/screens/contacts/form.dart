import 'package:flutter/material.dart';
import 'package:learning_flutter/components/input.dart';
import 'package:learning_flutter/database/dao/contacts_dao.dart';
import 'package:learning_flutter/models/contacts.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Input(
              controller: _controllerFullName,
              labelText: 'Full name',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Input(
                controller: _controllerAccountNumber,
                labelText: 'Account number',
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _createContact(context),
                  child: const Text('Create'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _createContact(context) {
    final String name = _controllerFullName.text;
    final int? accountNumber = int.tryParse(_controllerAccountNumber.text);

    if (name != '' && accountNumber != null) {
      final Contact newContact = Contact(0, name, accountNumber);
      ContactDao().save(newContact).then(
            (id) => Navigator.pop(context),
          );
    } else {}
  }
}
