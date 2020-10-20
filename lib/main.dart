import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'CameraAwesome'),
        '/full': (context) => CameraFullView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _switchFlash = ValueNotifier(CameraFlashes.NONE);
  final _sensor = ValueNotifier(Sensors.BACK);
  final _photoSize = ValueNotifier<Size>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Hero(
        tag: 'camera',
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/full');
          },
          child: Center(
            child: Container(
              width: 400,
              height: 400,
              child: CameraAwesome(
                testMode: false,
                onPermissionsResult: (result) {},
                selectDefaultSize: (availableSizes) => availableSizes.first,
                onCameraStarted: () {},
                onOrientationChanged: (newOrientation) {},
                sensor: _sensor,
                photoSize: _photoSize,
                switchFlashMode: _switchFlash,
                orientation: DeviceOrientation.portraitUp,
                fitted: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CameraFullView extends StatelessWidget {
  final _switchFlash = ValueNotifier(CameraFlashes.NONE);
  final _sensor = ValueNotifier(Sensors.BACK);
  final _photoSize = ValueNotifier<Size>(null);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'camera',
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CameraAwesome(
            testMode: false,
            onPermissionsResult: (result) {},
            selectDefaultSize: (availableSizes) => availableSizes.first,
            onCameraStarted: () {},
            onOrientationChanged: (newOrientation) {},
            sensor: _sensor,
            photoSize: _photoSize,
            switchFlashMode: _switchFlash,
            orientation: DeviceOrientation.portraitUp,
            fitted: false,
          ),
        ),
      ),
    );
  }
}
