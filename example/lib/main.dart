import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:screenshot_image/screenshot_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenshotImagePlugin = ScreenshotImage.instance;

  @override
  void initState() {
    super.initState();
  }

  void enableScreenshot() {
    _screenshotImagePlugin.screenshotOn();
  }

  void disableScreenshot() {
    _screenshotImagePlugin.screenshotOff();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              CupertinoButton(onPressed: enableScreenshot, child: const Text('enable')),
              CupertinoButton(onPressed: disableScreenshot, child: const Text('disable')),
            ],
          ),
        ),
      ),
    );
  }
}
