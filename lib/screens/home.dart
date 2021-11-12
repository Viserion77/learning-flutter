import 'package:flutter/material.dart';
import 'package:learning_flutter/screens/contacts/list.dart';
import 'package:learning_flutter/screens/transaction/list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Flutter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/logo.jpg'),
          ),
          SizedBox(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FutureIcon(
                  futureIcon: Icons.monetization_on,
                  featureName: 'Transfer',
                  onTap: () => _showContactsList(context),
                ),
                _FutureIcon(
                  futureIcon: Icons.description,
                  featureName: 'Transaction feed',
                  onTap: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransferList(),
      ),
    );
  }

  void _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ContactsList(),
      ),
    );
  }
}

class _FutureIcon extends StatelessWidget {
  const _FutureIcon({
    Key? key,
    required IconData futureIcon,
    required String featureName,
    required Function onTap,
  })  : _futureIcon = futureIcon,
        _featureName = featureName,
        _onTap = onTap,
        super(key: key);

  final IconData _futureIcon;
  final String _featureName;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => _onTap(),
          child: SizedBox(
            width: 152.0,
            height: 104.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(_futureIcon),
                  Text(
                    _featureName,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
