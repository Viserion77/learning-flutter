import 'package:flutter/material.dart';
import 'package:learning_flutter/components/input.dart';
import 'package:learning_flutter/http/webclients/transactions.dart';
import 'package:learning_flutter/models/contacts.dart';
import 'package:learning_flutter/models/transaction.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(Contact contact, {Key? key})
      : _contact = contact,
        super(key: key);
  final Contact _contact;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final String _appBarTitle = 'Create Transfer';

  final String _valueInputLabel = 'Value';
  final String _valueInputHint = '0.0';
  String? _valueInputError;
  final String _valueInputErrorNull = 'Value can\'t be null';

  final String _confirmButtonText = 'Transfer';

  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget._contact.name,
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget._contact.accountNumber.toString(),
                style: const TextStyle(fontSize: 36.0),
              ),
            ),
            Input(
              controller: _controllerValue,
              labelText: _valueInputLabel,
              hintText: _valueInputHint,
              errorText: _valueInputError,
              icon: Icons.monetization_on,
              keyboardType: TextInputType.number,
              onTap: _clearValueError,
              onChanged: (value) => _clearValueError(),
            ),
            ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: Text(_confirmButtonText),
            ),
          ],
        ),
      ),
    );
  }

  void _clearValueError() {
    setState(() {
      _valueInputError = null;
    });
  }

  void _createTransfer(BuildContext context) {
    final double? value = double.tryParse(_controllerValue.text);

    if (value != null) {
      final Transaction transfer = Transaction(widget._contact, value);
      TransactionWebclient()
          .save(transfer)
          .then((value) => Navigator.pop(context));
    } else {
      setState(() {
        _valueInputError = _valueInputErrorNull;
      });
    }
  }
}
