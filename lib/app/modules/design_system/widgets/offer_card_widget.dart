import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/app/modules/design_system/design_system_module.dart';

import '../../marketplace/marketplace_module.dart';

class OfferCardWidget extends StatelessWidget {
  final OfferEntity entity;
  const OfferCardWidget(this.entity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 15,
      shadowColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(child: Hero(tag: 'offer-image-${entity.id}', child: Image.network(entity.imageUrl, width: double.infinity))),
            const SizedBox(height: 15),
            Text(entity.name, style: FontPalette.current.cardTitle, textAlign: TextAlign.center),
            const SizedBox(height: 5),
            Text('${entity.price}', style: FontPalette.current.cardPrice, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
