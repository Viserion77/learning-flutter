import 'package:flutter/material.dart';
import 'package:learning_flutter/database/dao/contacts_dao.dart';
import 'package:learning_flutter/models/contacts.dart';
import 'package:learning_flutter/screens/contacts/form.dart';
import 'package:learning_flutter/screens/transaction/form.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: ContactDao().findAll(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Contact>? contacts = snapshot.data as List<Contact>;

            if (contacts != null) {
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];

                  return _ContactItem(
                    contact: contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text('One error has occurred!'),
              ),
            );
          }
          return const Text('One error has occurred!');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem(
      {Key? key, required Contact contact, required Function onClick})
      : _contact = contact,
        _onClick = onClick,
        super(key: key);

  final Contact _contact;
  final Function _onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => _onClick(),
        title: Text(
          _contact.name,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          _contact.accountNumber.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
