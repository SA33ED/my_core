class ErrorModel {
  final String detail;
  final Map<String, List<String>>? errors;

  ErrorModel({required this.detail, this.errors});

  // Factory method to create an instance from JSON
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      detail: json['message'] ?? "Somthing Went Wrong",
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          List<String>.from(value),
        ),
      ),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': detail,
      'errors': errors?.map(
        (key, value) => MapEntry(key, value),
      ),
    };
  }

  // Helper method to get errors for a specific field
  List<String>? getErrorsForField(String field) {
    return errors?[field];
  }
}
