import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruitify_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruitify_dashboard/core/widgets/constants.dart';
import 'package:fruitify_dashboard/core/widgets/custom_button.dart';
import 'package:fruitify_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruitify_dashboard/core/widgets/image_picker_field.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, price, code, description;
  late String expirationMonths, calories, unit;
  File? productImage;
  bool isFeatured = false;
  bool isOrganic = false;

  final _nameFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _codeFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _expirationMonthsFocus = FocusNode();
  final _caloriesFocus = FocusNode();
  final _unitFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _priceFocus.dispose();
    _codeFocus.dispose();
    _descriptionFocus.dispose();
    _expirationMonthsFocus.dispose();
    _caloriesFocus.dispose();
    _unitFocus.dispose();
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
              textInputAction: TextInputAction.next,
              maxLines: 5,
              onFieldSubmitted: (_) => _expirationMonthsFocus.requestFocus(),
              onSaved: (value) => description = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Expiration Months',
              hintText: 'Enter number of expiration months',
              focusNode: _expirationMonthsFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _caloriesFocus.requestFocus(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (value) => expirationMonths = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter expiration months';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Calories',
              hintText: 'Enter calories',
              focusNode: _caloriesFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _unitFocus.requestFocus(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (value) => calories = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter calories';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Unit (grams)',
              hintText: 'Enter unit in grams',
              focusNode: _unitFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (value) => unit = value!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter unit';
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
            CheckboxListTile(
              value: isOrganic,
              onChanged: (value) {
                setState(() {
                  isOrganic = value ?? false;
                });
              },
              title: const Text('Is Organic'),
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
                        expirationMonths: int.parse(expirationMonths),
                        calories: int.parse(calories),
                        unit: int.parse(unit),
                        isOrganic: isOrganic,
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

