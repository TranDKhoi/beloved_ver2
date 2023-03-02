part of home;

class MorePostButton extends StatelessWidget {
  const MorePostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimens.SCREEN_PADDING / 2),
          child: GestureDetector(
            onTap: () async {
              await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return AddPostForm();
                  });
              // _bloc.getPost();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.SIZED_SPACING),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    Text(
                      R.morepost.translate,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
