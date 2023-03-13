class ExceptionResponse {
  late List<Errors> errors;

  ExceptionResponse({required this.errors});

  ExceptionResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    print(errors.runtimeType);
    data['errors'] = errors.map((v) => v.toJson()).toList();
    return data;
  }

  static String getMessage(Map<String, dynamic> exceptionResponse) {
    ExceptionResponse data = ExceptionResponse.fromJson(exceptionResponse);

    return data.errors[0].message;
  }
}

class Errors {
  late String message;

  Errors({required this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
