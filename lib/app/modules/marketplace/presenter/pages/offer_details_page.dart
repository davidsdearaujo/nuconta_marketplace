import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nuconta_marketplace/app/modules/design_system/design_system_module.dart';

import '../../marketplace_module.dart';
import '../stores/marketplace_store.dart';
import '../widgets/buy_button_widget.dart';

class OfferDetailsPage extends StatefulWidget {
  final OfferEntity entity;
  const OfferDetailsPage(this.entity, {Key? key}) : super(key: key);

  @override
  _OfferDetailsPageState createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> {
  final MarketplaceStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: ColorPalette.current.purple),
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 25, left: 25, bottom: 25),
                child: BackButton(color: ColorPalette.current.white),
              ),
              Expanded(
                child: Hero(tag: 'offer-image-${widget.entity.id}', child: Image.network(widget.entity.imageUrl, width: double.infinity)),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: ColorPalette.current.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.entity.name, style: FontPalette.current.detailsTitle),
                    const SizedBox(height: 15),
                    Text(widget.entity.description, style: FontPalette.current.detailsDescription),
                    const SizedBox(height: 25),
                    BuyButtonWidget(
                      price: widget.entity.price,
                      onPressed: () async {
                        store.buyOffer(widget.entity.id).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Congratulations! You successful buyed the offer'),
                            backgroundColor: ColorPalette.current.orange,
                          ));
                          Modular.to.pop();
                          store.refresh();
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
