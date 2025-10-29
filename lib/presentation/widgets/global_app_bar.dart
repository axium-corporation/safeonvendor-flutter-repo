import "package:flutter/material.dart";
import "package:flutter_tabler_icons/flutter_tabler_icons.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:safeonvendor_flutter_repo/app/config/app_text_styles.dart";

class CommonCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isLogoPresentinCenter;

  final Widget rightSideLogo;
  final String title;
  final bool isTextpresentAtEnd;
  final Function() rightSideBtnPressed;
  final bool isBackButtonPresent;
  final bool isTrailingButtonPresent;
  final Function()? leadingButtonPressed;

  const CommonCustomAppBar({
    required this.title,
    required this.rightSideLogo,
    required this.rightSideBtnPressed,
    super.key,
    this.isBackButtonPresent = true,
    this.isTextpresentAtEnd = false,
    this.isLogoPresentinCenter = false,
    this.isTrailingButtonPresent = true,
    this.leadingButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
        kToolbarHeight + 20,
      ), // Extra height for curve
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.colorOne,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Centered Title
                if (isLogoPresentinCenter)
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 32,
                      width: 49,
                      fit: BoxFit.fill,
                    ),
                  ),
                if (!isLogoPresentinCenter)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      title,
                      style: AppTextStyles.kColorTextStyle17with500(
                        AppColor.pureWhite,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                // Logo on the left
                if (isBackButtonPresent)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: leadingButtonPressed ?? () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.bgGrey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              TablerIcons.chevron_left,
                              color: AppColor.buttonGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Logo on the right
                if (isTrailingButtonPresent)
                  GestureDetector(
                    onTap: () => rightSideBtnPressed(),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: isTextpresentAtEnd
                            ? Text(
                                "appbar.skip".tr,
                                style: AppTextStyles.kColorTextStyle15with500(
                                  AppColor.lightBlue,
                                ),
                              )
                            : Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColor.bgGrey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),

                                child: Center(child: rightSideLogo),
                              ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

Widget profileBellIcon() {
  return Container(
    height: 48,
    width: 48,
    decoration: BoxDecoration(
      color: AppColor.bgGrey,
      borderRadius: BorderRadius.circular(45),
    ),
    child: const Icon(TablerIcons.bell, size: 24),
  );
}
