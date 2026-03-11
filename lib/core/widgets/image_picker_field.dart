import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruitify_dashboard/core/widgets/app_text_styles.dart';
import 'package:fruitify_dashboard/core/widgets/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImagePickerField extends FormField<File> {
  ImagePickerField({
    super.key,
    required void Function(File?) onImagePicked,
    super.validator,
    super.onSaved,
  }) : super(
          builder: (FormFieldState<File> state) {
            return _ImagePickerFieldContent(
              state: state,
              onImagePicked: onImagePicked,
            );
          },
        );
}

class _ImagePickerFieldContent extends StatefulWidget {
  const _ImagePickerFieldContent({
    required this.state,
    required this.onImagePicked,
  });

  final FormFieldState<File> state;
  final void Function(File?) onImagePicked;

  @override
  State<_ImagePickerFieldContent> createState() =>
      _ImagePickerFieldContentState();
}

class _ImagePickerFieldContentState extends State<_ImagePickerFieldContent> {
  bool isLoading = false;

  Future<void> _pickImage() async {
    setState(() {
      isLoading = true;
    });
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      widget.state.didChange(file);
      widget.onImagePicked(file);
    }
    setState(() {
      isLoading = false;
    });
  }

  void _removeImage() {
    widget.state.didChange(null);
    widget.onImagePicked(null);
  }

  @override
  Widget build(BuildContext context) {
    final pickedImage = widget.state.value;
    final hasError = widget.state.hasError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Product Image', style: AppTextStyles.bold13),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickImage,
          child: pickedImage != null
              ? Skeletonizer(
                  enabled: isLoading,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Image.file(
                          pickedImage,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: _removeImage,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: errorColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: hasError ? errorColor : const Color(0xFFE0E0E0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 48,
                        color: primaryColor.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap to pick an image',
                        style: AppTextStyles.regular13.copyWith(
                          color: const Color(0xFFB0B0B0),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              widget.state.errorText!,
              style: AppTextStyles.regular11.copyWith(color: errorColor),
            ),
          ),
      ],
    );
  }
}

