import 'package:reactive_forms/reactive_forms.dart';

class AuthFormModel {
  final FormGroup form;

  AuthFormModel()
      : form = FormGroup({
          'email': FormControl<String>(
            validators: [
              Validators.required,
              Validators.email,
            ],
          ),
          'password': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(8),
            ],
          ),
          'name': FormControl<String>(),
        });

  FormControl<String> get emailControl =>
      form.control('email') as FormControl<String>;
  FormControl<String> get passwordControl =>
      form.control('password') as FormControl<String>;
  FormControl<String> get nameControl =>
      form.control('name') as FormControl<String>;
}
