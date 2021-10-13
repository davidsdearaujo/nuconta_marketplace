import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'marketplace_store.dart';

class MarketplacePage extends StatefulWidget {
  final String title;
  const MarketplacePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends ModularState<MarketplacePage, MarketplaceStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<MarketplaceStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Text('$counter'),
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}