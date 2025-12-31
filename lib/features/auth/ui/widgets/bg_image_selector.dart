import 'dart:async';

import 'package:flutter/material.dart';
import 'package:macos_dock/macos_dock.dart';

class BgImageSelector extends StatefulWidget {
  final List<String> bgImagesList;
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;
  const BgImageSelector({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
    required this.bgImagesList,
  });

  @override
  State<BgImageSelector> createState() => _BgImageSelectorState();
}

class _BgImageSelectorState extends State<BgImageSelector> {
  Timer? _hoverTimer;

  void _onHoverEntered(int index) {
    _hoverTimer?.cancel();

    _hoverTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onIndexChanged(index);
    });
  }

  void _onHoverExited() {
    _hoverTimer?.cancel();
  }

  final double _scaleFactor = 0.6;

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
            children: (scale) => widget.bgImagesList.map((item) {
              int itemIndex = widget.bgImagesList.indexOf(item);
              return _buildIcon(item, scale, itemIndex);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, double scale, int index) {
    return MouseRegion(
      onEnter: (_) => _onHoverEntered(index),
      onExit: (_) => _onHoverExited(),
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
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        widget.onIndexChanged(index);
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
