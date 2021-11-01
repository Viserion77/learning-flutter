import 'package:flutter/material.dart';
import 'package:learning_flutter/models/transfer.dart';
import 'package:learning_flutter/screens/transfer/form.dart';

class TransferList extends StatefulWidget {
  TransferList({
    Key? key,
  }) : super(key: key);
  final List<Transfer> _transferList = [];

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  final String _titleAppBar = 'Transferências';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titleAppBar,
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferList.length,
        itemBuilder: (BuildContext context, int index) {
          final Transfer transfer = widget._transferList[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const TransferForm();
            }),
          );
          future.then(
            (Transfer? value) => {
              setState(() {
                widget._transferList.add(value!);
              })
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(
    this._transfer, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.numberAccount.toString()),
        leading: const Icon(Icons.monetization_on),
      ),
    );
  }
}
