import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg1_25/models/store_model.dart';

class ProductCard extends StatefulWidget {
  final TableModelStore product;
  final bool isFavorite;
  final ValueChanged<bool>? onFavoriteChanged;

  const ProductCard({
    Key? key,
    required this.product,
    this.isFavorite = false,
    this.onFavoriteChanged,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (widget.onFavoriteChanged != null) {
      widget.onFavoriteChanged!(_isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.product.image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey.shade200,
                  child: Icon(Icons.broken_image, color: Colors.grey.shade400),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Favorite button
            Column(
              children: [
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
