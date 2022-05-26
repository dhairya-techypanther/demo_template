import 'package:demo_template/Constants/Localizations/AppText.dart';
import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:demo_template/Models/User.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSlidableWidget extends StatefulWidget {
  // final String? sliderTitle;
  final Widget? avatarIcon;
  final User? user;

  const CustomSlidableWidget({
    Key? key,
    this.avatarIcon, this.user,
  }) : super(key: key);

  @override
  State<CustomSlidableWidget> createState() => _CustomSlidableWidgetState();
}

class _CustomSlidableWidgetState extends State<CustomSlidableWidget> {

  @override
  void initState() {
    APIService.addUser(name, email, gender);
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
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),

        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),

          // A pane can dismiss the Slidable.
          dismissible: DismissiblePane(onDismissed: () {}),

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: newUserMethod,
              backgroundColor: AppColor.successColor,
              foregroundColor: AppColor.whiteColor,
              icon: Icons.update,
              label: updateUser,
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: deleteUserMethod,
              backgroundColor: AppColor.successColor,
              foregroundColor: AppColor.whiteColor,
              icon: Icons.delete,
              label: deleteUser,
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.userAvatarIcon,
                height: 35,
                width: 40,
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, textAlign: TextAlign.start),
                  Text(
                    widget.user!.gender!,
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20,),
                child: Text(
                  email,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              IconButton(padding: const EdgeInsets.only(left: 50,),
                onPressed: () {},
                icon: const Icon(
                  Icons.circle,
                  color: AppColor.successColor,
                ),
              ),
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

void newUserMethod(BuildContext context) {
  Get.toNamed(addUserRoute);
}

void deleteUserMethod(BuildContext context) {
  Get.delete();
}
