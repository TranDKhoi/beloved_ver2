part of home;

class AddPostForm extends StatelessWidget {
  AddPostForm({Key? key}) : super(key: key);

  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //avt and name here
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (GlobalData.ins.currentUser!.avatar != "")
                    //   CircleAvatar(
                    //     radius: 20,
                    //     backgroundImage: Image.network(
                    //       GlobalData.ins.currentUser!.avatar!,
                    //       fit: BoxFit.contain,
                    //     ).image,
                    //   ),
                    // if (GlobalData.ins.currentUser!.avatar == "")
                    //   Image.asset(
                    //     "assets/images/${GlobalData.ins.currentUser!.gender == 0 ? "boy.png" : "girl.png"}",
                    //     width: 40,
                    //     height: 40,
                    //   ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          GlobalVariable.currentUser!.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          FormatUtil.toShortDate(DateTime.now()),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        NavigationUtil.pop();
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //title here
                TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "whatmemoriesdoyouwanttosave",
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //images here
                // StreamBuilder<List<String>>(
                //     stream: _bloc.imageStream,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         if (snapshot.data!.isNotEmpty) {
                //           return SizedBox(
                //             height: 150,
                //             width: context.screenSize.width,
                //             child: ListView.separated(
                //               separatorBuilder: (context, i) => const SizedBox(
                //                 width: 10,
                //               ),
                //               physics: const BouncingScrollPhysics(),
                //               scrollDirection: Axis.horizontal,
                //               itemBuilder: (context, i) {
                //                 return GestureDetector(
                //                   onTap: () {
                //                     _bloc.pickSingleImage(i);
                //                   },
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       border: Border.all(
                //                         color: Colors.grey,
                //                         width: 0.5,
                //                       ),
                //                       borderRadius: BorderRadius.circular(7),
                //                     ),
                //                     child: Stack(
                //                       alignment: Alignment.topRight,
                //                       children: [
                //                         Image.file(
                //                           File(snapshot.data![i]),
                //                           width: 150,
                //                           height: 150,
                //                         ),
                //                         GestureDetector(
                //                             onTap: () {
                //                               _bloc.removeImage(i);
                //                             },
                //                             child: const Icon(
                //                                 Ionicons.close_outline)),
                //                       ],
                //                     ),
                //                   ),
                //                 );
                //               },
                //               itemCount: snapshot.data!.length,
                //             ),
                //           );
                //         } else {
                //           return GestureDetector(
                //             onTap: () {
                //               _bloc.pickMultiImage();
                //             },
                //             child: Container(
                //               margin: const EdgeInsets.only(top: 10),
                //               height: 50,
                //               width: context.screenSize.width,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(8),
                //                 border: Border.all(
                //                   color: Colors.grey,
                //                   width: 0.5,
                //                 ),
                //               ),
                //               child: const Icon(
                //                 Ionicons.image_outline,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //           );
                //         }
                //       }
                //       return GestureDetector(
                //         onTap: () {
                //           _bloc.pickMultiImage();
                //         },
                //         child: Container(
                //           margin: const EdgeInsets.only(top: 10),
                //           height: 50,
                //           width: context.screenSize.width,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey,
                //               width: 0.5,
                //             ),
                //           ),
                //           child: const Icon(
                //             Ionicons.image_outline,
                //             color: Colors.grey,
                //           ),
                //         ),
                //       );
                //     }),
                const Divider(
                  color: AppColor.primaryColor,
                  endIndent: 0,
                ),
                GestureDetector(
                  onTap: () async {
                    // await _bloc.createNewPost(_titleController.text.trim());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.check_circle_outline,
                          color: AppColor.primaryColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Post",
                          style: AppStyle.pinkBoldNormal,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
