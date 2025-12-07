part of 'utils.dart';
class Validators {
  // Email Validator
  static final email = EmailValidator(errorText: 'Enter a valid email address');

  // Password Validator , rules
  static final password = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[!@#\$&*~])',
  errorText: 'Password must have at least one special character')
  ]);

  // Required Validator with Optional Field Name
  static RequiredValidator requiredWithFieldName(String? fieldName) =>
    RequiredValidator(errorText: '${fieldName ?? ''} is required');

  // Plain Required Validator
  static final required = RequiredValidator(errorText: 'Field is required');

  // First Name / Last Name Validator
  static final name = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    PatternValidator(r'^[a-zA-Z]+$',
        errorText: 'Name must contain only letters'),
  ]);

  // Age Validator
  static final age = MultiValidator([
    RequiredValidator(errorText: 'Age is required'),
    PatternValidator(r'^[0-9]+$', errorText: 'Age must be a number'),
    //     ? null : 'Age must be between 1 and 120')
  ]);
  
}
