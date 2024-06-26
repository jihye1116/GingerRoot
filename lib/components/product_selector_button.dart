// product_selector_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ProductSelectorButton extends StatefulWidget {
  final int id;
  final IconData mIcon;
  final Function(int) changeIcon;

  const ProductSelectorButton({
    Key? key,
    required this.id,
    required this.mIcon,
    required this.changeIcon,
  }) : super(key: key);

  @override
  _ProductSelectorButtonState createState() => _ProductSelectorButtonState();
}

class _ProductSelectorButtonState extends State<ProductSelectorButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: _isSelected ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(widget.mIcon, color: Colors.black),
        onPressed: () {
          _toggleSelected();
          widget.changeIcon(widget.id); // Notify parent about icon change
        },
      ),
    );
  }

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
