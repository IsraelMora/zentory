import 'package:reactive_forms/reactive_forms.dart';

class ProductFormModel {
  final FormGroup form;

  ProductFormModel({
    String name = '',
    String description = '',
    double price = 0.0,
    int stock = 0,
    String category = 'General',
  }) : form = FormGroup({
          'name': FormControl<String>(
            value: name,
            validators: [
              Validators.required,
              Validators.minLength(3),
            ],
          ),
          'description': FormControl<String>(value: description),
          'price': FormControl<double>(
            value: price,
            validators: [
              Validators.required,
              Validators.min(0),
            ],
          ),
          'stock': FormControl<int>(
            value: stock,
            validators: [
              Validators.required,
              Validators.min(0),
            ],
          ),
          'category': FormControl<String>(
            value: category,
            validators: [
              Validators.required,
            ],
          ),
        });

  FormControl<String> get nameControl =>
      form.control('name') as FormControl<String>;
  FormControl<String> get descriptionControl =>
      form.control('description') as FormControl<String>;
  FormControl<double> get priceControl =>
      form.control('price') as FormControl<double>;
  FormControl<int> get stockControl =>
      form.control('stock') as FormControl<int>;
  FormControl<String> get categoryControl =>
      form.control('category') as FormControl<String>;
}
