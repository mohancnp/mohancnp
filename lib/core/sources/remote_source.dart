
abstract class RemoteSource {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParams,
  });

  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  });

  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
  });
}
