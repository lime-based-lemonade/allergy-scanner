import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// QR code / bar code scanner page
class ScannerPage extends ConsumerWidget {
  ScannerPage({super.key});

  final _isContentScannedProvider = StateProvider((ref) => false);
  final _noContentSnackbar = const SnackBar(content: Text("A snackbar it is!"));

  BuildContext? _context;
  WidgetRef? _ref;
  ScaffoldMessengerState? _scaffoldMessengerState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BarcodeScannerSimple();
    _context = context;
    _ref = ref;
    _scaffoldMessengerState = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product scanner"),
      ),
      body: Stack(
        children: [
          MobileScanner(
            // Do not scan codes if something was already scanned
            onDetect:
                ref.watch(_isContentScannedProvider) ? _handleBarcode : null,
          )
        ],
      ),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    final value = barcodes.barcodes.firstOrNull?.displayValue;

    if (value == null) {
      _scaffoldMessengerState?.showSnackBar(_noContentSnackbar);
      return;
    }

    _displayResult(value);
  }

  void _displayResult(String name) async {
    if (_context == null) {
      return;
    }

    // TODO: Call the API wrapper and await its response
    bool safe = false;
  }
}

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  Barcode? _barcode;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: _handleBarcode,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Center(child: _buildBarcode(_barcode))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BarcodeScannerSimple extends StatefulWidget {
  const BarcodeScannerSimple({super.key});

  @override
  State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
}

class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
  Barcode? _barcode;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
