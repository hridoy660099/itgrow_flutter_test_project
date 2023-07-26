import 'dart:async';

import 'package:flutter/material.dart';

class BaseViewmodel with ChangeNotifier{

  // StreamController to manage the isLoadingStream
  final _isLoadingController = StreamController<bool>.broadcast();

  // Getter for the isLoadingStream
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  // Flag to track the loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Method to update the loading state
  void setLoading(bool value) {
    _isLoading = value;
    _isLoadingController.add(_isLoading);
  }

  // Dispose method to close the stream controller
  @override
  void dispose() {
    super.dispose();
    _isLoadingController.close();
  }
}