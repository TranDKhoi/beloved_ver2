part of '../signup.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _rePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<SignupBloc>(),
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is ConfirmSuccessState) {
            NavigationUtil.push(
                page: VerifyEmailPage(
                    _emailController.text.trim(), _passController.text.trim()));
          }
        },
        builder: (context, state) => Scaffold(
          body: Column(
            children: [
              //form signup
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenSize.width / 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(R.sign_up.translate,
                              style: AppStyle.pinkBoldTitle),
                          SizedBox(height: context.screenSize.height * 0.03),
                          SignupForm(
                            emailController: _emailController,
                            passController: _passController,
                            rePassController: _rePassController,
                          ),
                          SizedBox(height: context.screenSize.height * 0.03),
                          //description
                          Text(
                            R.wewillsendyouasecretcode.translate,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    //title
                  ],
                ),
              ),
              //button
              const Divider(
                color: AppColor.primaryColor,
                height: 0,
              ),
              SizedBox(
                height: context.screenSize.height / 15,
                child: Row(
                  children: [
                    MLabelButton(
                      onTap: () => NavigationUtil.pop(),
                      icon: Icons.cancel_outlined,
                      text: R.cancel.translate,
                    ),
                    const VerticalDivider(width: 0),
                    MLabelButton(
                      onTap: () => context.read<SignupBloc>().add(
                            ConfirmButtonClickedEvent(
                                email: _emailController.text,
                                pass: _passController.text,
                                repass: _rePassController.text),
                          ),
                      icon: Icons.check_circle_outline,
                      text: R.confirm.translate,
                      isAccept: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
