import 'package:archii_server_client/archii_server_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

/// Singleton class to manage Serverpod client connection
class ServerConnection {
  static final ServerConnection _instance = ServerConnection._internal();
  factory ServerConnection() => _instance;
  ServerConnection._internal();

  late Client client;
  bool _isInitialized = false;

  /// Initialize the Serverpod client connection
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Configure the client
    // For development, use localhost
    // For production, use your server URL
    client = Client('http://localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor();

    _isInitialized = true;
  }

  /// Dispose resources
  void dispose() {
    client.close();
    _isInitialized = false;
  }
}

/// Global instance for easy access
final serverConnection = ServerConnection();
