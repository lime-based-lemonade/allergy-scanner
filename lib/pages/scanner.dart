import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// QR code / bar code scanner page
class ScannerPage extends ConsumerWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product scanner"),),
      body: const Center(),
    );
  }
}
