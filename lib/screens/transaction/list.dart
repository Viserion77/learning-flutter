import 'package:flutter/material.dart';
import 'package:learning_flutter/components/centered_message.dart';
import 'package:learning_flutter/http/webclients/transactions.dart';
import 'package:learning_flutter/models/transaction.dart';

class TransferList extends StatefulWidget {
  const TransferList({
    Key? key,
  }) : super(key: key);

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
      body: FutureBuilder<List<Transaction>>(
        initialData: const [],
        future: TransactionWebclient().findAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CenteredMessage('loading', loading: true);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final List<Transaction> _transferList = snapshot.data;
              if (_transferList.isNotEmpty) {
                return ListView.builder(
                  itemCount: _transferList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Transaction transfer = _transferList[index];
                    return TransferItem(transfer);
                  },
                );
              }

              return const CenteredMessage(
                'No data!',
                icon: Icons.warning,
              );
            }
          }
          return const CenteredMessage('Unknown error!');
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transaction _transfer;

  const TransferItem(
    this._transfer, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.contact.toString()),
        leading: const Icon(Icons.monetization_on),
      ),
    );
  }
}
