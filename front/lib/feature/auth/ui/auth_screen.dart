import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/auth/ui/components/app_text_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    this.error,
  });
  final String? error;

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const _pageSwitchDuration = Duration(milliseconds: 100);
  static const _validateDuration = Duration(milliseconds: 300);

  late PageController _pageViewController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();
  final _nameFocus = FocusNode();

  final GlobalKey<FormState> _signInKey = GlobalKey();
  final GlobalKey<FormState> _signUpKey = GlobalKey();
  bool get _hasAnyFocus =>
      _passFocus.hasFocus || _emailFocus.hasFocus || _nameFocus.hasFocus;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0);
    final error = widget.error;
    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _showMessage(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bodies = [_buildSignInBody(), _buildSignUpBody()];

    return Scaffold(
      appBar: null,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        itemCount: bodies.length,
        itemBuilder: (context, index) {
          return _buildBody(bodies[index], index);
        },
      ),
    );
  }

  Widget _buildBody(List<Widget> signBody, int index) {
    return Form(
      key: index == 0 ? _signInKey : _signUpKey,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const Spacer(),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: signBody,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSignInBody() {
    return [
      const Text('Sign In'),
      TextFormField(
        onTap: _signInValidate,
        focusNode: _emailFocus,
        onTapOutside: (event) {
          _emailFocus.unfocus();
          _signInValidate();
        },
        controller: _emailController,
        decoration: const InputDecoration(hintText: 'Email'),
        validator: _validateEmail,
        onEditingComplete: _signInValidate,
      ),
      TextFormField(
        onTap: _signInValidate,
        focusNode: _passFocus,
        controller: _passwordController,
        decoration: const InputDecoration(hintText: 'Password'),
        validator: _validatePassword,
        obscureText: true,
        onTapOutside: (event) {
          _passFocus.unfocus();
          _signInValidate();
        },
        onEditingComplete: _signInValidate,
      ),
      ElevatedButton(
        onPressed: () {
          final valid = _signInKey.currentState?.validate();
          if (valid == true) {
            _onTapToSignIn(context.authCubit);
          }
        },
        child: const Text('Sign In'),
      ),
      Wrap(
        alignment: WrapAlignment.center,
        children: [
          const Text('Not registered yet?'),
          AppTextButton(
            onPressed: () {
              _passwordController.text = '';
              _pageViewController.nextPage(
                duration: _pageSwitchDuration,
                curve: Curves.ease,
              );
            },
            text: 'Sign Up',
          )
        ],
      )
    ];
  }

  List<Widget> _buildSignUpBody() {
    return [
      const Text('Sign Up'),
      TextFormField(
        onTap: _signUpValidate,
        controller: _nameController,
        decoration: const InputDecoration(hintText: 'Name'),
        validator: _validateName,
        focusNode: _nameFocus,
        onTapOutside: (event) {
          _nameFocus.unfocus();
          _signUpValidate();
        },
        onEditingComplete: _signUpValidate,
      ),
      TextFormField(
        onTap: _signUpValidate,
        focusNode: _emailFocus,
        onTapOutside: (event) {
          _emailFocus.unfocus();
          _signUpValidate();
        },
        controller: _emailController,
        decoration: const InputDecoration(hintText: 'Email'),
        validator: _validateEmail,
        onEditingComplete: _signUpValidate,
      ),
      TextFormField(
        onTap: _signUpValidate,
        focusNode: _passFocus,
        controller: _passwordController,
        decoration: const InputDecoration(hintText: 'Password'),
        validator: _validatePassword,
        obscureText: true,
        onTapOutside: (event) {
          _passFocus.unfocus();
          _signUpValidate();
        },
        onEditingComplete: _signUpValidate,
      ),
      ElevatedButton(
          onPressed: () {
            if (_signUpKey.currentState?.validate() == true) {
              _onTapToSignUp(context.authCubit);
            }
          },
          child: const Text('Sign Up')),
      TextButton(
        onPressed: () {
          _passwordController.text = '';
          _pageViewController.previousPage(
            duration: _pageSwitchDuration,
            curve: Curves.ease,
          );
        },
        child: const Text('Back'),
      )
    ];
  }

  void _onTapToSignIn(AuthCubit authCubit) => authCubit.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );

  void _onTapToSignUp(AuthCubit authCubit) => authCubit.signUp(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );

  void _signInValidate() {
    Future.delayed(
      _validateDuration,
      () => _signInKey.currentState?.validate(),
    );
  }

  void _signUpValidate() {
    Future.delayed(
      _validateDuration,
      () => _signUpKey.currentState?.validate(),
    );
  }

  String? _validateEmail(String? value) {
    if (!_hasAnyFocus) {
      if (value == null || value.isEmpty) {
        return "Email is empty";
      }

      if (!EmailValidator.validate(value)) {
        return "Email invalid";
      }

      return null;
    }
    return null;
  }

  String? _validateName(String? value) {
    if (!_hasAnyFocus) {
      if (value == null || value.isEmpty) {
        return "Name is empty";
      }

      return null;
    }
    return null;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  String? _validatePassword(
    String? value,
  ) {
    if (!_hasAnyFocus) {
      if (value == null || value.isEmpty) {
        return "Pass empty";
      }

      if (!RegExp(r'^[A-Za-z\d*;%)(_\]\[.,#@!$&^+=-]{6,20}$').hasMatch(value)) {
        return "Pass incorrect";
      }

      return null;
    }
    return null;
  }
}
