part of user_bio;

class UserBioPage extends StatelessWidget {
  UserBioPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<UserBioBloc>()..add(InitEvent()),
      child: Scaffold(
        body: Column(
          children: [
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
                          R.yourare.translate,
                          style: AppStyle.pinkBoldTitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppDimens.SIZED_SPACING * 3),
                        BioForm(_nameController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColor.primaryColor,
              height: 0,
            ),
            SizedBox(
              height: context.screenSize.height / 15,
              child: Row(
                children: [
                  Builder(
                    builder: (context) => MLabelButton(
                      onTap: () => context
                          .read<UserBioBloc>()
                          .add(SaveBioEvent(_nameController.text)),
                      text: R.save.translate,
                      icon: Icons.check_circle_outline,
                      isAccept: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
