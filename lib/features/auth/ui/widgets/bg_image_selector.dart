import 'package:flutter/material.dart';
import 'package:macos_dock/macos_dock.dart';

import '../../../../core/constants/AppAssets.dart';

class CustomMacOSDock extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  const CustomMacOSDock({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final double _scaleFactor = 0.8;

  final double _translateFactor = 1.3;

  final double _radiusFactor = 5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: MacosDock(
            scaleFactor: _scaleFactor,
            translateFactor: _translateFactor,
            radiusFactor: _radiusFactor,
            iconSpacing: 10,
            animationDuration: const Duration(milliseconds: 200),
            enableReordering: false,
            children: (scale) =>
                AppAssets.bgImages.map((item) {
                  int itemIndex = AppAssets.bgImages.indexOf(item);
                  return _buildIcon(item, scale,itemIndex);
                }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, double scale, int index) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        onIndexChanged(index);
      },
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
