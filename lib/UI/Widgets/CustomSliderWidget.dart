import 'package:demo_template/Constants/Localizations/AppText.dart';
import 'package:demo_template/Controller/AddUserController.dart';
import 'package:demo_template/Models/APIs/APIMethode.dart';
import 'package:demo_template/Models/User.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CustomSlidableWidget extends StatefulWidget {
  final Widget? avatarIcon;
  final User? user;

  const CustomSlidableWidget({
    Key? key,
    this.avatarIcon,
    this.user,
  }) : super(key: key);

  @override
  State<CustomSlidableWidget> createState() => _CustomSlidableWidgetState();
}

class _CustomSlidableWidgetState extends State<CustomSlidableWidget> {
  final AddUserController addUserController = Get.put(AddUserController());
  final APIMethode apiMethode = APIMethode();

  @override
  void initState() {
    addUserController.addUser(name, email, gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: 300,
      decoration: BoxDecoration(
        color: AppColor.lightPinkColor,
        shape: BoxShape.rectangle,
      ),
      child: Slidable(
        /// Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),

        /// The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          /// A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          /// All actions are defined in the children parameter.
          children: [
            /// A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: addUserController.modifyUserMethod,
              backgroundColor: AppColor.successColor,
              foregroundColor: AppColor.whiteColor,
              icon: Icons.update,
              label: updateUser,
            ),
          ],
        ),

        /// The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                var val = apiMethode.deleteUser(
                  id: widget.user!.id!.toString(),
                );
                if (kDebugMode) {
                  print("$val");
                }
                Navigator.of(context);
              },
              backgroundColor: AppColor.successColor,
              foregroundColor: AppColor.whiteColor,
              icon: Icons.delete,
              label: deleteUser,
            ),
          ],
        ),

        /// The child of the Slidable is what the user sees when the component is not dragged.
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.user!.id.toString(),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.user!.name!,
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        child: Text(
                          widget.user!.gender!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.user!.email!,
                  ),
                ],
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 20,),
              //   child: Text(
              //     email,
              //   ),
              // ),
              // const SizedBox(
              //   width: 40,
              // ),
              // IconButton(padding: const EdgeInsets.only(left: 50,),
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.circle,
              //     color: AppColor.successColor,
              //   ),
              // ),
            ],
          ),
          // title: Text(
          //   sliderTitle!,
          //   // textAlign: TextAlign.center,
          // ),
        ),
      ),
    );
  }
}
