part of forgot_pass;

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<ForgotPassBloc>(),
      child: Scaffold(
        body: BlocConsumer<ForgotPassBloc, ForgotPassState>(
          listener: (context, state) {
            if (state is ConfirmCodeSuccessState) {
              NavigationUtil.pushAndRemoveUntil(
                  page: ResetPassPage(state.resetPassEntity));
            }
          },
          builder: (context, state) {
            if (state is InitState) {
              return EmailForm(_emailController);
            }
            return VerifyCodeForm(_emailController, _codeController);
          },
        ),
      ),
    );
  }
}
