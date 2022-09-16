class FormValidationMixin {
  String? isEmpty(String? value) {
    if (value!.isEmpty) {
      return "field should not be empty";
    }
    return null;
  }

  String? dropdownEmpty(String? value) {
    if (value == null) {
      return "field should not be empty";
    }
    return null;
  }
}
