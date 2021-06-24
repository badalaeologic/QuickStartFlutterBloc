import 'dart:async';

class Validators {
  Validators();

  static final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length > 4) {
      sink.add(name);
    } else {
      sink.addError('Please enter a valid name');
    }
  });

  static final validateEmail = StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (email, sink) {
      final RegExp _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,4}",
      );

      if (_emailRegExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );

  static final validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Invalid password, please enter more than 4 characters');
    }
  });

  static final validateUserType =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (userType, sink) {
    if (userType.isNotEmpty) {
      sink.add(userType);
    } else {
      sink.addError('Select User Type');
    }
  });

  static final validateMobile =
      StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (mobile, sink) {
      if (mobile.length >= 10) {
        sink.add(mobile);
      } else {
        sink.addError('Enter a valid mobile');
      }
    },
  );

  static final validateSignMobile =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (mobile, sink) {
      if (mobile.length >= 10) {
        sink.add("$mobile");
      } else {
        sink.addError('Enter a valid mobile');
      }
    },
  );

  static final validOtp = StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (otp, sink) {
      final RegExp _otpRegExp = RegExp(
        r'^[0-9]',
      );

      if (otp.length == 6) {
        sink.add(otp);
      } else {
        sink.addError('Enter a valid otp');
      }
    },
  );

  static final validPassword = StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (otp, sink) {
      final RegExp _otpRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]',
      );

      if (otp.length >= 4) {
        sink.add("$otp");
      } else {
        sink.addError('Enter a valid password');
      }
    },
  );

  static final validSignPassword =
      StreamTransformer<dynamic, dynamic>.fromHandlers(
    handleData: (value, sink) {
      var passwordRegex = RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$');
      if (passwordRegex.hasMatch(value)) {
        sink.add("$value");
      } else {
        sink.addError(
            'Minimum six characters, at least one uppercase letter, one lowercase letter and one number');
      }
    },
  );

  static final validFullName = StreamTransformer<String, String>.fromHandlers(
    handleData: (otp, sink) {
      final RegExp _otpRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]',
      );

      if (_otpRegExp.hasMatch(otp) && otp.length == 4) {
        sink.add(otp);
      } else {
        sink.addError('Enter a valid name');
      }
    },
  );
}
