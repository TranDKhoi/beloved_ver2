part of forgot_pass;

class EmailForm extends StatelessWidget {
  const EmailForm(this._emailController, {Key? key}) : super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    Text(
                      R.whichemailyouwanttoreset.translate,
                      style: AppStyle.pinkBoldTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.screenSize.height * 0.03),
                    MInputField(
                      hintText: R.enteryouremail.translate,
                      suffixIcon: const Icon(Icons.close),
                      controller: _emailController,
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
                onTap: () => context
                    .read<ForgotPassBloc>()
                    .add(ConfirmEmailEvent(_emailController.text)),
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
