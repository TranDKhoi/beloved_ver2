part of reset_pass;

class ResetPassPage extends StatelessWidget {
  ResetPassPage(this._entity, {Key? key}) : super(key: key);

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  final ResetPassEntity _entity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<ResetPassBloc>(),
      child: Scaffold(
        body: BlocConsumer<ResetPassBloc, ResetPassState>(
          listener: (context, state) {
            if (state is SuccessState) {
              NavigationUtil.pushAndRemoveUntil(page: const MainAuthPage());
            }
          },
          builder: (context, state) => Column(
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
                          Text(R.resetyourpassword.translate,
                              style: AppStyle.pinkBoldTitle),
                          SizedBox(height: context.screenSize.height * 0.03),
                          ResetForm(
                            passController: _passController,
                            rePassController: _rePassController,
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
                      onTap: () => NavigationUtil.pushAndRemoveUntil(
                          page: const MainAuthPage()),
                      icon: Icons.cancel_outlined,
                      text: R.cancel.translate,
                    ),
                    const VerticalDivider(width: 0),
                    MLabelButton(
                      onTap: () => context.read<ResetPassBloc>().add(
                            ConfirmButtonClickedEvent(
                                pass: _passController.text,
                                rePass: _rePassController.text,
                                entity: _entity),
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
