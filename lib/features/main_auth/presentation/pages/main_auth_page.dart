part of '../main_auth.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SuccessState) {
            print("ok nha");
            // NavigationUtil.pushAndRemoveUntil(page: page);
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              //BACKGROUND
              const Background(),
              //BUTTON
              SizedBox(
                height: context.screenSize.height / 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SignupLabel(),
                    VerticalDivider(
                      thickness: AppDimens.DIVIDER_THICKNESS,
                      width: 0,
                    ),
                    SignInLabel(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
