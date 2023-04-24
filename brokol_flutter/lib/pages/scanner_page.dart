import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerHome extends StatefulWidget {
  // const ScannerHome({super.key});
  const ScannerHome({Key? key}) : super(key: key);

  @override
  State<ScannerHome> createState() => _ScannerHomeState();
}

class _ScannerHomeState extends State<ScannerHome> {
  bool _isPermissionGranted = false;

  late final Future<void> _future;

  @override
  void initState() {
    super.initState();

    _future = _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Text recognition sample'),
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Text(
                _isPermissionGranted
                    ? 'Camera permission granted'
                    : 'Camera permission not granted',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
