import 'package:reactive_forms/reactive_forms.dart';

class ZentoryValidationMessages {
  static Map<String, ValidationMessageFunction> get messages => {
        ValidationMessage.required: (error) => 'Este campo es obligatorio',
        ValidationMessage.email: (error) => 'Debe ingresar un correo válido',
        ValidationMessage.minLength: (error) =>
            'Debe tener al menos ${(error as Map)['requiredLength']} caracteres',
        ValidationMessage.maxLength: (error) =>
            'Debe tener máximo ${(error as Map)['requiredLength']} caracteres',
        ValidationMessage.pattern: (error) => 'El formato no es válido',
        ValidationMessage.mustMatch: (error) => 'Los campos no coinciden',
        ValidationMessage.min: (error) =>
            'El valor debe ser mayor o igual a ${(error as Map)['min']}',
        ValidationMessage.max: (error) =>
            'El valor debe ser menor o igual a ${(error as Map)['max']}',
        ValidationMessage.number: (error) => 'Debe ingresar un número válido',
        ValidationMessage.creditCard: (error) =>
            'Debe ingresar una tarjeta de crédito válida',
        ValidationMessage.equals: (error) =>
            'El valor no coincide con el esperado',
        ValidationMessage.contains: (error) => 'El valor no está permitido',
        ValidationMessage.any: (error) => 'Al menos una opción debe ser válida',
      };
}
