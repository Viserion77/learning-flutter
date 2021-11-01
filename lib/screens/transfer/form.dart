import 'package:flutter/material.dart';
import 'package:learning_flutter/components/input.dart';
import 'package:learning_flutter/models/transfer.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final String _appBarTitle = 'criando Transferencia';

  final String _numberAccountLabel = 'Numero da conta';
  final String _numberAccountHint = '0';
  String? _numberAccountError;
  final String _numberAccountErrorNull = 'Numero da conta não pode ser nulo';

  final String _valueInputLabel = 'Valor';
  final String _valueInputHint = '0.0';
  String? _valueInputError;
  final String _valueInputErrorNull = 'Valor não pode ser nulo';

  final String _confirmButtonText = 'Confirmar';

  final TextEditingController _controllerNumberAccount =
      TextEditingController();

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
            Input(
              controller: _controllerNumberAccount,
              hintText: _numberAccountLabel,
              labelText: _numberAccountHint,
              errorText: _numberAccountError,
              onTap: () => _clearNumberAccountError(),
              onChanged: (value) => _clearNumberAccountError(),
            ),
            Input(
              controller: _controllerValue,
              labelText: _valueInputLabel,
              hintText: _valueInputHint,
              errorText: _valueInputError,
              icon: Icons.monetization_on,
              onTap: () => _clearValueError(),
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

  void _clearNumberAccountError() {
    setState(() {
      _numberAccountError = null;
    });
  }

  void _createTransfer(BuildContext context) {
    final int? numberAccount = int.tryParse(_controllerNumberAccount.text);
    final double? value = double.tryParse(_controllerValue.text);

    if (numberAccount != null && value != null) {
      final Transfer transfer = Transfer(numberAccount, value);
      Navigator.pop(context, transfer);
    } else {
      setState(() {
        if (numberAccount == null) {
          _numberAccountError = _numberAccountErrorNull;
        }
        if (value == null) {
          _valueInputError = _valueInputErrorNull;
        }
      });
    }
  }
}
