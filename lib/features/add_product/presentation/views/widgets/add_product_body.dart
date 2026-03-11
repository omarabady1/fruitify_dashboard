import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruitify_dashboard/widgets/constants.dart';
import 'package:fruitify_dashboard/widgets/custom_button.dart';
import 'package:fruitify_dashboard/widgets/custom_text_form_field.dart';
import 'package:fruitify_dashboard/widgets/image_picker_field.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, price, code, description;
  File? productImage;
  bool isFeatured = false;

  final _nameFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _codeFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _priceFocus.dispose();
    _codeFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Product Name',
              hintText: 'Enter product name',
              focusNode: _nameFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _priceFocus.requestFocus(),
              onSaved: (value) => productName = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Price',
              hintText: 'Enter price',
              focusNode: _priceFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _codeFocus.requestFocus(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (value) => price = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter price';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Code',
              hintText: 'Enter code',
              focusNode: _codeFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _descriptionFocus.requestFocus(),
              onSaved: (value) => code = value!.toLowerCase(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter code';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Description',
              hintText: 'Enter description',
              focusNode: _descriptionFocus,
              textInputAction: TextInputAction.done,
              maxLines: 5,
              onSaved: (value) => description = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ImagePickerField(
              onImagePicked: (file) => productImage = file,
              validator: (file) {
                if (file == null) {
                  return 'Please pick a product image';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value ?? false;
                });
              },
              title: const Text('Is Featured'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: primaryColor,
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Add Product',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  AddProductInputEntity addProductInputEntity =
                      AddProductInputEntity(
                        productName: productName,
                        price: price,
                        code: code,
                        description: description,
                        image: productImage!,
                        isFeatured: isFeatured,
                      );
                      context.read<AddProductCubit>().addProduct(addProductInputEntity);  
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
