part of user_bio;

class BioForm extends StatelessWidget {
  const BioForm(this.nameController, {Key? key}) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //gender picker
        BlocBuilder<UserBioBloc, UserBioState>(
          buildWhen: (prev, after) {
            if (after is LoadedState && prev is LoadedState) {
              if (after.gender == prev.gender) {
                return false;
              }
            }
            return true;
          },
          builder: (context, state) {
            if (state is LoadedState) {
              return Row(
                children: [
                  Opacity(
                    opacity: state.gender == 0 ? 1 : 0.5,
                    child: GestureDetector(
                      onTap: () {
                        context.read<UserBioBloc>().add(ChangeGenderEvent(0));
                      },
                      child: Image.asset(
                        "assets/images/boy.png",
                        width: context.screenSize.width * 0.2,
                        height: context.screenSize.width * 0.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Opacity(
                    opacity: state.gender == 1 ? 1 : 0.5,
                    child: GestureDetector(
                      onTap: () {
                        context.read<UserBioBloc>().add(ChangeGenderEvent(1));
                      },
                      child: Image.asset(
                        "assets/images/girl.png",
                        width: context.screenSize.width * 0.2,
                        height: context.screenSize.width * 0.2,
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const SizedBox(height: AppDimens.SIZED_SPACING * 2),
        //input name
        MInputField(
          controller: nameController,
          hintText: R.yourname.translate,
          suffixIcon: const Icon(Icons.close),
        ),
        const SizedBox(height: AppDimens.SIZED_SPACING * 2),
        BlocBuilder<UserBioBloc, UserBioState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return MIconTextButton(
                icon: Icons.cake_outlined,
                text: FormatUtil.toShortDate(state.birthDay),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) {
                      return SizedBox(
                        height: context.screenSize.height / 3,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          maximumDate: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (DateTime newDate) {
                            context
                                .read<UserBioBloc>()
                                .add(ChangeBirthDayEvent(newDate));
                          },
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
