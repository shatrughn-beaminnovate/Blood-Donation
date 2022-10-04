class RoutingData {
  final String route;
  final Map<String, dynamic> _queryParameters;
  RoutingData({
    required this.route,
    required Map<String, dynamic> queryParameters,
  }) : _queryParameters = queryParameters;
  operator [](String key) => _queryParameters[key];
}
