import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
