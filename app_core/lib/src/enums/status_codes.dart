enum StatusCodes {
  noConnection(599, 'Network Connect Timeout Error'),
  success(200, 'OK'),
  created(201, 'Created'),
  noContent(204, 'No Content'),
  badRequest(400, 'Bad Request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not Found'),
  methodNotAllowed(405, 'Method Not Allowed'),
  requestTimeout(408, 'Request Timeout'),
  internalServerError(500, 'Internal Server Error'),
  badGateway(502, 'Bad Gateway'),
  serviceUnavailable(503, 'Service Unavailable'),
  gatewayTimeout(504, 'Gateway Timeout'),
  unkown(0, 'Error Unkown');

  const StatusCodes(this.value, this.defaultMessage);

  final int value;
  final String defaultMessage;
}

StatusCodes getStatusCode(status) {
  switch (status) {
    case 599:
      return StatusCodes.noConnection;
    case 200:
      return StatusCodes.success;
    case 201:
      return StatusCodes.created;
    case 204:
      return StatusCodes.noContent;
    case 400:
      return StatusCodes.badRequest;
    case 401:
      return StatusCodes.unauthorized;
    case 403:
      return StatusCodes.forbidden;
    case 404:
      return StatusCodes.notFound;
    case 405:
      return StatusCodes.methodNotAllowed;
    case 408:
      return StatusCodes.requestTimeout;
    case 500:
      return StatusCodes.internalServerError;
    case 502:
      return StatusCodes.badGateway;
    case 503:
      return StatusCodes.serviceUnavailable;
    case 504:
      return StatusCodes.gatewayTimeout;
    default:
      return StatusCodes.unkown;
  }
}
