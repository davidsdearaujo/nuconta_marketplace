import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';
import 'package:nuconta_marketplace/app/modules/design_system/design_system_module.dart';
import 'package:nuconta_marketplace/app/modules/marketplace/presenter/widgets/offer_card_widget.dart';

import '../stores/marketplace_store.dart';

class MarketplacePage extends StatefulWidget {
  final String title;
  const MarketplacePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> with LoadingMixin, ErrorMixin {
  @override
  final MarketplaceStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      store.refresh();
    });
    Modular.to.addListener(() {
      print('Current PATH: ${Modular.to.path}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<MarketplaceStore, Failure, MarketplaceState>(
        store: store,
        onState: (context, state) {
          if (state.offers == null) return Container();
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, right: 10),
                        child: Text('Marketplace', style: FontPalette.current.appbarTitle),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Balance'),
                        Text('${state.balance}', style: FontPalette.current.cardPrice),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  color: ColorPalette.current.orange,
                  onRefresh: () async {
                    store.refresh();
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.all(25),
                    itemCount: state.offers!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final currentOffer = state.offers![index];
                      return GestureDetector(
                        onTap: () => Modular.to.pushNamed('./details', arguments: currentOffer, forRoot: true),
                        child: OfferCardWidget(currentOffer),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
