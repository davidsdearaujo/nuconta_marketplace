import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/app/modules/core/core_module.dart';
import 'package:nuconta_marketplace/app/modules/design_system/design_system_module.dart';

class BuyButtonWidget extends StatelessWidget {
  final MoneyType price;
  final VoidCallback? onPressed;
  const BuyButtonWidget({Key? key, required this.price, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorPalette.current.orange,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.fromLTRB(30, 15, 15, 15),
        child: Row(
          children: [
            Expanded(child: Text('$price', style: FontPalette.current.buttonText)),
            Container(
              decoration: BoxDecoration(
                color: ColorPalette.current.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 18),
                  const SizedBox(width: 10),
                  Text('Buy', style: FontPalette.current.buttonDescription),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
