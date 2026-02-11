import 'package:appwrite/appwrite.dart';
import 'package:zentory_app/core/error/failures.dart';

class ErrorHandler {
  static String mapAppwriteError(dynamic e) {
    if (e is AppwriteException) {
      switch (e.code) {
        case 401:
          return 'Sesión expirada o no autorizado. Por favor inicia sesión de nuevo.';
        case 403:
          return 'No tienes permisos para realizar esta acción.';
        case 404:
          return 'El recurso solicitado no fue encontrado.';
        case 409:
          return 'Ya existe un registro con estos datos.';
        case 429:
          return 'Demasiadas solicitudes. Por favor espera un momento.';
        default:
          return e.message ?? 'Error inesperado en el servidor (${e.code})';
      }
    }
    return 'Error de conexión: Por favor verifica tu internet.';
  }

  static Failure toFailure(dynamic e) {
    return Failure.serverError(mapAppwriteError(e));
  }
}
