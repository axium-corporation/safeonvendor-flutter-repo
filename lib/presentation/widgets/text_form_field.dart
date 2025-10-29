import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_tabler_icons/flutter_tabler_icons.dart";
import "package:get/get.dart";
import "package:safeonvendor_flutter_repo/app/config/app_colors.dart";
import "package:safeonvendor_flutter_repo/app/config/app_text_styles.dart";
import "package:safeonvendor_flutter_repo/presentation/widgets/empty_space.dart";

class CustomTextFeild extends StatelessWidget {
  final String label;
  final bool mandatory;
  final IconData? prefixIcons;
  final Widget? suffixIcons;
  final TextEditingController? controller;
  final String? hint;
  final bool? obsureBool;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final int? maxLEngth;
  final Function(String)? onchange;
  final Function(String)? onSubmited;
  final int? maxlines;
  final bool autoValidate;
  final bool success;
  final bool denySpaces;
  final bool readOnly;
  final int? minLines;
  final bool paddingReduces;
  final double? borderRadius;
  final Color? borderColor;
  final void Function()? onTap;
  final Color? fillColor;
  final Widget? prefixWidget;
  final Widget? checkBox;
  final FocusNode? focusNode;
  final bool textAlignCenter;
  final bool isContentPaddingReduce;
  final Color? labelColor;
  const CustomTextFeild({
    required this.label,
    required this.validator,
    required this.keyboardType,
    required this.maxLEngth,
    super.key,
    this.denySpaces = false,
    this.prefixIcons,
    this.suffixIcons,
    this.controller,
    this.hint,
    this.onchange,
    this.obsureBool,
    this.onSubmited,
    this.autoValidate = true,
    this.success = false,
    this.readOnly = false,
    this.maxlines = 1,
    this.mandatory = false,
    this.minLines = 1,
    this.paddingReduces = false,
    this.onTap,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.prefixWidget,
    this.checkBox,
    this.focusNode,
    this.textAlignCenter = false,
    this.isContentPaddingReduce = false,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingReduces
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Row(
              children: [
                checkBox ?? const SizedBox.shrink(),
                if (checkBox != null) 4.width,
                Text(
                  label,
                  style: AppTextStyles.kColorTextStyle13with400(
                    labelColor ?? AppColor.pureWhite,
                  ),
                ),
                3.width,
                if (mandatory)
                  Text(
                    "*",
                    style: AppTextStyles.kColorTextStyle14with600(
                      AppColor.bgGrey,
                    ),
                  ),
              ],
            ),
          if (label.isNotEmpty) 8.height,
          TextFormField(
            // obscuringCharacter: "*",
            textAlignVertical: TextAlignVertical.center, // centers vertically
            textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,

            onTap: onTap,
            focusNode: focusNode,
            //For auto highlight remove the below lines
            autocorrect: false,
            enableSuggestions: false,
            enableIMEPersonalizedLearning: false,
            //End of auto highlight remove the below lines
            maxLength: maxLEngth,
            minLines: minLines,
            maxLines: maxlines,
            autovalidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            readOnly: readOnly,
            obscureText: obsureBool ?? false,
            keyboardType: keyboardType,
            inputFormatters: keyboardType == TextInputType.number
                ? [FilteringTextInputFormatter.digitsOnly]
                : [if (denySpaces) NoLeadingTrailingWhitespaceFormatter()],

            // style: AppTextStyles.kColorTextStyle15with400(AppColor.textGrey),
            controller: controller,
            validator: validator,
            onChanged: onchange,
            onFieldSubmitted: onSubmited,
            cursorColor: AppColor.laraInputBorder,

            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(maxWidth: 106),
              errorMaxLines: 2,
              filled: true,

              fillColor: fillColor ?? AppColor.pureWhite,
              hintStyle: AppTextStyles.kColorTextStyle15with400(
                AppColor.textGrey,
              ),
              hintText: hint,
              counterText: "",
              border: InputBorder.none,
              prefixIcon:
                  prefixWidget ??
                  (prefixIcons != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            left: 12,
                            right: 6,
                          ),
                          child: Icon(prefixIcons, color: AppColor.textGrey),
                        )
                      : null),
              suffixIcon: suffixIcons,
              contentPadding: isContentPaddingReduce
                  ? EdgeInsets.zero
                  : const EdgeInsets.all(16),
              errorStyle: AppTextStyles.kColorTextStyle12with400(
                AppColor.error,
              ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: AppColor.pureWhite.withValues(alpha: 0.04),),
              //   borderRadius: BorderRadius.circular(16),
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.pureWhite.withValues(alpha: 0.04),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      borderColor ?? AppColor.pureBlack.withValues(alpha: 0.16),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      borderColor ?? AppColor.pureBlack.withValues(alpha: 0.16),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.error),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.error),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final RxString searchText;
  final TextEditingController textController;
  final String hintText;
  final TextStyle? hintStyle;
  final Color backgroundColor;
  final Color iconColor;
  final Color shadowColor;
  final VoidCallback? onClearTap;
  final Color? borderColor;

  const SearchBarWidget({
    required this.searchText,
    required this.textController,
    required this.backgroundColor,
    required this.iconColor,
    required this.shadowColor,
    super.key,
    this.hintText = "Search...",
    this.hintStyle,
    this.onClearTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor ?? Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(TablerIcons.search, color: iconColor),
          8.width,
          Expanded(
            child: TextField(
              controller: textController,
              onChanged: (val) => searchText.value = val,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: hintStyle,
              ),
            ),
          ),
          Obx(
            () => searchText.value.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      textController.clear();
                      searchText.value = "";
                      onClearTap?.call();
                    },
                    child: Icon(TablerIcons.x, color: iconColor),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class NoLeadingTrailingWhitespaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove leading and trailing white spaces
    final trimmedText = newValue.text.trimLeft();

    return newValue.copyWith(
      text: trimmedText,
      selection: TextSelection.collapsed(offset: trimmedText.length),
    );
  }
}

class ModernTextFormField extends StatelessWidget {
  final String label;
  final bool mandatory;
  final IconData? prefixIcons;
  final Widget? suffixIcons;
  final TextEditingController? controller;
  final String? hint;
  final bool? obsureBool;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final int? maxLength;
  final Function(String)? onchange;
  final Function(String)? onSubmited;
  final int? maxlines;
  final bool autoValidate;
  final bool success;
  final bool denySpaces;
  final bool readOnly;
  final int? minLines;
  final bool paddingReduces;
  final double? borderRadius;
  final Color? borderColor;
  final void Function()? onTap;
  final Color? fillColor;
  final Widget? prefixWidget;
  final Widget? checkBox;
  final FocusNode? focusNode;
  final bool textAlignCenter;
  final bool isContentPaddingReduce;
  final Color? labelColor;

  const ModernTextFormField({
    required this.label,
    required this.validator,
    required this.keyboardType,
    required this.maxLength,
    super.key,
    this.denySpaces = false,
    this.prefixIcons,
    this.suffixIcons,
    this.controller,
    this.hint,
    this.onchange,
    this.obsureBool,
    this.onSubmited,
    this.autoValidate = true,
    this.success = false,
    this.readOnly = false,
    this.maxlines = 1,
    this.mandatory = false,
    this.minLines = 1,
    this.paddingReduces = false,
    this.onTap,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.prefixWidget,
    this.checkBox,
    this.focusNode,
    this.textAlignCenter = false,
    this.isContentPaddingReduce = false,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.kColorTextStyle14with600(Colors.black87),
        ),
        8.height,
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLength: maxLength,
          obscureText: obsureBool ?? false,
          onChanged: onchange,
          maxLines: maxlines,
          minLines: minLines,
          style: AppTextStyles.kColorTextStyle15with400(Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.kColorTextStyle14with400(Colors.black38),
            prefixIcon: Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Icon(prefixIcons, color: AppColor.colorOne, size: 22),
            ),
            suffixIcon: suffixIcons,
            filled: true,
            fillColor: Colors.grey.shade50,
            counterText: '',
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColor.colorOne, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.red.shade400, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
