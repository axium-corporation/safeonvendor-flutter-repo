import "package:get/get.dart";

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
    selectedIndex.value = index;
  }
}

// class ImagePickerService {
//   final ImagePicker _picker = ImagePicker();

//   /// Picks image from gallery or camera with permission check
//   /// Returns a map with 'file' (XFile?) and 'bytes' (Uint8List?)
//   Future<Map<String, dynamic>?> pickImage({
//     required ImageSource source,
//     double maxWidth = 600,
//     double maxHeight = 600,
//     int imageQuality = 80,
//   }) async {
//     // Handle permission request
//     final hasPermission = await _handlePermission(source);
//     if (!hasPermission) {
//       return null;
//     }

//     try {
//       final XFile? imageFile = await _picker.pickImage(
//         source: source,
//         maxWidth: maxWidth,
//         maxHeight: maxHeight,
//         imageQuality: imageQuality,
//       );

//       if (imageFile != null) {
//         final Uint8List imageBytes = await imageFile.readAsBytes();
//         return {"file": imageFile, "bytes": imageBytes};
//       } else {
//         // User cancelled image selection
//         return null;
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "imagePicker.error".tr);
//       return null;
//     }
//   }

//   /// Handles permission request for camera and gallery access
//   /// Returns true if permission is granted, false otherwise
//   Future<bool> _handlePermission(ImageSource source) async {
//     Permission permission;

//     // Determine required permission based on source and platform
//     if (source == ImageSource.camera) {
//       permission = Permission.camera;
//     } else {
//       // For gallery access
//       if (Platform.isIOS) {
//         permission = Permission.photos;
//       } else {
//         // Android 13+ uses different permissions
//         if (Platform.isAndroid) {
//           permission = Permission.photos;
//         } else {
//           permission = Permission.storage;
//         }
//       }
//     }

//     final status = await permission.status;

//     switch (status) {
//       case PermissionStatus.granted:
//         return true;

//       case PermissionStatus.denied:
//         // First time asking or user previously denied
//         final result = await permission.request();
//         return _handlePermissionResult(result, source);

//       case PermissionStatus.permanentlyDenied:
//         // User permanently denied permission
//         return _showPermissionDialog(source);

//       case PermissionStatus.restricted:
//         // iOS only - permission restricted by parental controls etc.
//         _showPermissionRestrictedMessage(source);
//         return false;

//       case PermissionStatus.limited:
//         // iOS 14+ limited photo access
//         if (source == ImageSource.gallery) {
//           return true; // Limited access is still usable for gallery
//         }
//         return false;

//       case PermissionStatus.provisional:
//         // iOS only - provisional permission
//         return true;
//     }
//   }

//   /// Handles the result after requesting permission
//   Future<bool> _handlePermissionResult(
//     PermissionStatus result,
//     ImageSource source,
//   ) async {
//     switch (result) {
//       case PermissionStatus.granted:
//         return true;

//       case PermissionStatus.denied:
//         _showPermissionDeniedMessage(source);
//         return false;

//       case PermissionStatus.permanentlyDenied:
//         return _showPermissionDialog(source);

//       case PermissionStatus.limited:
//         // iOS 14+ limited photo access
//         if (source == ImageSource.gallery) {
//           return true;
//         }
//         return false;

//       default:
//         return false;
//     }
//   }

//   /// Shows dialog asking user to open settings for permanently denied permissions
//   Future<bool> _showPermissionDialog(ImageSource source) async {
//     final isCamera = source == ImageSource.camera;
//     final title = isCamera
//         ? "permission.camera.title".tr
//         : "permission.gallery.title".tr;
//     final message = isCamera
//         ? "permission.camera.permanentlyDenied".tr
//         : "permission.gallery.permanentlyDenied".tr;

//     final result = await showDialog(
//       context: Get.context!,
//       builder: (_) => AppConfirmationDialog(
//         title: title,
//         message: message,
//         confirmText: "permission.openSettings".tr,
//         cancelText: "alertDialog.cancel".tr,
//         isLoading: false.obs,
//         onConfirm: () async {
//           Get.back(result: true);
//         },
//         onCancel: () {
//           Get.back(result: false);
//         },
//       ),
//       barrierDismissible: false,
//     );

//     if (result == true) {
//       await openAppSettings();
//       // After returning from settings, check permission again
//       final permission = _getPermissionForSource(source);
//       final newStatus = await permission.status;
//       return newStatus.isGranted;
//     }

//     return false;
//   }

//   /// Gets the appropriate permission for the image source
//   Permission _getPermissionForSource(ImageSource source) {
//     if (source == ImageSource.camera) {
//       return Permission.camera;
//     } else {
//       if (Platform.isIOS) {
//         return Permission.photos;
//       } else {
//         return Permission.photos; // Android 13+
//       }
//     }
//   }

//   /// Shows message for denied permission
//   void _showPermissionDeniedMessage(ImageSource source) {
//     final message = source == ImageSource.camera
//         ? "permission.camera.denied".tr
//         : "permission.gallery.denied".tr;
//     Fluttertoast.showToast(msg: message);
//   }

//   /// Shows message for restricted permission (iOS only)
//   void _showPermissionRestrictedMessage(ImageSource source) {
//     final message = source == ImageSource.camera
//         ? "permission.camera.restricted".tr
//         : "permission.gallery.restricted".tr;
//     Fluttertoast.showToast(msg: message);
//   }

//   /// Picks image with optional cropping functionality
//   Future<void> pickAndCropImage({
//     required ImageSource source,
//     required Rxn<XFile?> fileRx,
//     required Rxn<Uint8List> bytesRx,
//     bool crop = false,
//   }) async {
//     final result = await pickImage(source: source);
//     if (result != null) {
//       final XFile imageFile = result["file"];

//       if (crop) {
//         // Navigate to crop screen
//         final croppedFile = await Get.to(
//           () => CropImageScreen(imageFile: imageFile),
//         );

//         if (croppedFile != null) {
//           final Uint8List croppedBytes = await croppedFile.readAsBytes();
//           fileRx.value = croppedFile;
//           bytesRx.value = croppedBytes;
//         }
//         // If user cancels cropping, do nothing (don't set the original image)
//       } else {
//         // Use original image without cropping
//         fileRx.value = result["file"];
//         bytesRx.value = result["bytes"];
//       }
//     }
//   }

//   /// Reusable for any controller with Rx<XFile?> and Rx<Uint8List>
//   Future<void> pickAndSetImage({
//     required ImageSource source,
//     required Rxn<XFile?> fileRx,
//     required Rxn<Uint8List> bytesRx,
//   }) async {
//     final result = await pickImage(source: source);
//     if (result != null) {
//       fileRx.value = result["file"];
//       bytesRx.value = result["bytes"];
//     }
//   }
// }

// /*-------------------------------------  ---------        UI For Cropping-------------------------------------*/

// class CropImageScreen extends StatefulWidget {
//   final XFile imageFile;

//   const CropImageScreen({required this.imageFile, super.key});

//   @override
//   State<CropImageScreen> createState() => _CropImageScreenState();
// }

// class _CropImageScreenState extends State<CropImageScreen> {
//   // Constants to avoid string literal duplication
//   static const String _cropImageTitle = "cropImage.title";

//   @override
//   void initState() {
//     super.initState();
//     // Automatically start cropping when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startCropping();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.pureBlack,
//       appBar: AppBar(
//         backgroundColor: AppColor.pureBlack,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(TablerIcons.x, color: AppColor.pureWhite),
//           onPressed: () => Get.back(),
//         ),
//         title: Text(
//           _cropImageTitle.tr,
//           style: TextStyle(
//             color: AppColor.pureWhite,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(TablerIcons.crop, size: 80, color: AppColor.lightBlue),
//             const SizedBox(height: 24),
//             Text(
//               "cropImage.instruction".tr,
//               style: TextStyle(
//                 color: AppColor.pureWhite,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               "cropImage.loading".tr,
//               style: TextStyle(color: AppColor.textGrey, fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _startCropping() async {
//     try {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: widget.imageFile.path,
//         compressFormat: ImageCompressFormat.png,
//         // compressQuality: 90,
//         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: _cropImageTitle.tr,
//             toolbarColor: AppColor.pureBlack,
//             toolbarWidgetColor: AppColor.pureWhite,
//             backgroundColor: AppColor.pureBlack,
//             activeControlsWidgetColor: AppColor.lightBlue,
//             cropStyle: CropStyle.circle, // This makes it circular!
//             cropGridStrokeWidth: 2,
//             cropFrameStrokeWidth: 3,
//             cropGridColor: AppColor.textGrey,
//             cropFrameColor: AppColor.lightBlue,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: true,
//             hideBottomControls: false,
//             showCropGrid: true,
//           ),
//           IOSUiSettings(
//             title: _cropImageTitle.tr,
//             doneButtonTitle: "cropImage.done".tr,
//             cancelButtonTitle: "alertDialog.cancel".tr,
//             cropStyle: CropStyle.circle, // This makes it circular!
//             aspectRatioLockEnabled: true,
//             resetAspectRatioEnabled: false,
//             // rotateButtonsHidden: false,
//             aspectRatioPickerButtonHidden: true,
//             // minimumAspectRatio: 1.0,
//           ),
//         ],
//       );

//       if (croppedFile != null) {
//         // Convert CroppedFile to XFile
//         final xFile = XFile(croppedFile.path);
//         Get.back(result: xFile);
//       } else {
//         // User cancelled cropping
//         Get.back();
//       }
//     } catch (e) {
//       Get.snackbar(
//         "cropImage.error".tr,
//         "cropImage.errorMessage".tr,
//         backgroundColor: AppColor.pureWhite,
//         colorText: AppColor.pureBlack,
//       );
//       Get.back();
//     }
//   }
// }
