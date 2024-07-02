import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

class TextFieldEntity {
  TextEditingController textController;
  String hint;
  String label;
  bool isEnabled;
  bool isPassword;
  TextInputType keyboardType;
  bool? isAutofocus;

  TextInputAction? textInputAction;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  TextFieldEntity({
    required this.textController,
    required this.hint,
    this.label = "",
    this.isPassword = false,
    this.isEnabled = true,
    this.isAutofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.validator,
    this.inputFormatters,
  }) {
    ValidationBuilder.setLocale('id');
  }

  static final List<TextFieldEntity> authLogin = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Email",
      label: "Email Address",
      keyboardType: TextInputType.emailAddress,
      isPassword: false,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        } else if (!EmailValidator.validate(value.trim())) {
          return 'Invalid email format';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Password",
      hint: "Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
  ];

  static final List<TextFieldEntity> authRegister = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Username",
      hint: "Input your username",
      keyboardType: TextInputType.text,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your username';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Email",
      hint: "Input your email",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        } else if (!EmailValidator.validate(value.trim())) {
          return 'Invalid email format';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Password",
      hint: "Input your password",
      isPassword: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Repeat Password",
      hint: "Repeat Password",
      isPassword: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
  ];

  static final List<TextFieldEntity> authForgotPassword = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Email Adress",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        } else if (!EmailValidator.validate(value.trim())) {
          return 'Invalid email format';
        }

        return null;
      },
    ),
  ];

  static final List<TextFieldEntity> verificationOTP = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*';
        }
        if (value.length > 1) {
          return 'Max 1';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*';
        }
        if (value.length > 1) {
          return 'Max 1';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      textInputAction: TextInputAction.next,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*';
        }
        if (value.length > 1) {
          return 'Max 1';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      textInputAction: TextInputAction.done,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '*';
        }
        if (value.length > 1) {
          return 'Max 1';
        }

        return null;
      },
    ),
  ];

  static final List<TextFieldEntity> updateProfile = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Username",
      label: "Username",
      keyboardType: TextInputType.name,
      focusNode: FocusNode(),
      isEnabled: false,
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Name",
      label: "Name",
      keyboardType: TextInputType.name,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name required';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Phone Number",
      label: "Phone Number",
      keyboardType: TextInputType.phone,
      focusNode: FocusNode(),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value != null || value!.trim().isEmpty) {
          if (!RegExp(r'^0.+(\d{9,12})$').hasMatch(value)) {
            return 'Please input a valid phone number, starting with 0';
          }
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Address",
      label: "Address",
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Birthplace",
      label: "Birthplace",
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Birthdate",
      label: "Birthdate",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Instagram",
      label: "Instagram",
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Facebook",
      label: "Facebook",
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Tiktok",
      label: "Tiktok",
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Nickname",
      label: "Nickname",
      keyboardType: TextInputType.name,
      focusNode: FocusNode(),
    ),
  ];

  static final List<TextFieldEntity> requestEventForm = [
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Event Name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Event Name Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Description",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Description Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Event PIC",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Event PIC Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Phone Number",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone Number Required';
        }
        return null;
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Date",
      isEnabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Date Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Start Time",
      isEnabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Start Time Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "End Time",
      isEnabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'End Time Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Location",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Location Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "City",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'City Required';
        }
        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '1.300.000',
      ),
      hint: "",
      label: "Price",
      isEnabled: false,
    ),
    TextFieldEntity(
      textController: TextEditingController(
        text: '',
      ),
      hint: "",
      label: "Negotiation Price",
      textInputAction: TextInputAction.done,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    ),
  ];

  static final List<TextFieldEntity> changePassword = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Current Password",
      keyboardType: TextInputType.visiblePassword,
      focusNode: FocusNode(),
      // label: "New Password".toUpperCase(),
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your current password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "New Password",
      keyboardType: TextInputType.visiblePassword,
      focusNode: FocusNode(),
      // label: "New Password".toUpperCase(),
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your New password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Repeat New Password",
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      focusNode: FocusNode(),
      // label: "Repeat Password".toUpperCase(),
      isPassword: true,
    ),
  ];

  static final List<TextFieldEntity> resetPassword = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter New Password",
      focusNode: FocusNode(),
      // label: "New Password",
      isPassword: true,
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Enter Confirm Password",
      focusNode: FocusNode(),
      // label: "Confirm Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
    ),
  ];
}
