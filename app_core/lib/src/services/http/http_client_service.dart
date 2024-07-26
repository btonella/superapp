import 'package:app_core/src/enums/enums.dart';
import 'package:dio/dio.dart';

///
/// A classe abstrata [HttpClientServices] define um conjunto de métodos que devem ser implementados pelas
/// classes que a implemetarem. Esses métodos são responsáveis por realizar requisições HTTP para uma determinada API,
/// utilizando diferentes métodos HTTP (GET, POST, PUT, DELETE, etc.), e retornar uma resposta em formato JSON.
/// Além disso, a classe também define um método para obter o endereço IP do dispositivo que está realizando
/// a requisição. Essa classe é utilizada como base para a implementação de serviços de comunicação
/// com APIs em diferentes plataformas.
///
abstract class HttpClientService {
  ///
  /// Método responsável por realizar requisições HTTP para uma determinada API,
  /// utilizando diferentes métodos HTTP (GET, POST, PUT, DELETE, etc.), e retornar uma resposta em formato JSON
  /// dentro o [Response] no parametro data.
  ///
  Future<Response?> request({
    required ApiName apiName,
    required String endpoint,
    required RequestMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}
