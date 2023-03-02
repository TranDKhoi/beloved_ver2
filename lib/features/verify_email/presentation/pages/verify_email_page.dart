part of verify_email;

class VerifyEmailPage extends StatelessWidget {
  VerifyEmailPage(this.currentEmail, this.currentPassword, {Key? key})
      : super(key: key);

  final TextEditingController _codeController = TextEditingController();
  final String currentEmail;
  final String currentPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<VerifyEmailBloc>(),
      child: BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
        listener: (context, state) {
          if (state is SuccessState) {
            NavigationUtil.pushAndRemoveUntil(page: UserBioPage());
          }
        },
        builder: (context, state) => Scaffold(
          body: Column(
            children: [
              //code field
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
                          Text(
                            R.checkyouremail.translate,
                            style: AppStyle.pinkBoldTitle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: context.screenSize.height * 0.03),
                          MPinCodeField(
                              controller: _codeController,
                              onComplete: () {
                                context.read<VerifyEmailBloc>().add(
                                    ConfirmButtonClickedEvent(
                                        currentEmail, _codeController.text));
                              }),
                          SizedBox(height: context.screenSize.height * 0.03),
                          //resend code
                          ResendCodeLabel(currentEmail, currentPassword),
                        ],
                      ),
                    ),
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
                      onTap: () => context.read<VerifyEmailBloc>().add(
                          ConfirmButtonClickedEvent(
                              currentEmail, _codeController.text)),
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
