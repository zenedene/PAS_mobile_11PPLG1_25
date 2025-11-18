import 'package:flutter/material.dart';

class CustomItemTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageUrl;
  final Widget? leadingWidget;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double? imageSize;
  final bool showImage;

  const CustomItemTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.imageUrl,
    this.leadingWidget,
    this.trailing,
    this.onTap,
    this.imageSize,
    this.showImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _buildLeading(),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            )
          : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget? _buildLeading() {
    if (leadingWidget != null) {
      return leadingWidget;
    }

    if (!showImage) {
      return null;
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl!,
          width: imageSize ?? 50,
          height: imageSize ?? 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        ),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      width: imageSize ?? 50,
      height: imageSize ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.image,
        color: Colors.grey.shade400,
        size: 30,
      ),
    );
  }
}