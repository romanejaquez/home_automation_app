class DeviceResponse {

  final String message;
  int statusCode;
  bool success;

  DeviceResponse({
    this.message = '',
    required this.statusCode,
    this.success = false,
  });
}