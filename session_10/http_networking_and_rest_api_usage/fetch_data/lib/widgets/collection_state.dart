import 'package:flutter/material.dart';

class CollectionState extends StatelessWidget {
  const CollectionState({required this.message, this.error = false, super.key});

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              error ? Icons.cloud_off_outlined : Icons.folder_open_outlined,
              size: 42,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
