part of forgot_pass;

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm(this._emailController, this._codeController, {Key? key})
      : super(key: key);

  final TextEditingController _codeController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          context.read<ForgotPassBloc>().add(ConfirmCodeEvent(
                              _emailController.text, _codeController.text));
                        }),
                    SizedBox(height: context.screenSize.height * 0.03),
                    //resend code
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          R.didntreceiveanycode.translate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(width: AppDimens.SIZED_SPACING * 0.5),
                        GestureDetector(
                          onTap: () => context.read<ForgotPassBloc>().add(
                              ResendButtonClickedEvent(_emailController.text)),
                          child: Text(
                            R.resend.translate,
                            textAlign: TextAlign.center,
                            style: AppStyle.underlineBlueNormal,
                          ),
                        ),
                      ],
                    ),
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
                onTap: () => context.read<ForgotPassBloc>().add(
                    ConfirmCodeEvent(
                        _emailController.text, _codeController.text)),
                icon: Icons.check_circle_outline,
                text: R.confirm.translate,
                isAccept: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
