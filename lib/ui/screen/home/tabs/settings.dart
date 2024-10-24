import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/cubit_states.dart';
import 'package:shop_app/widgets/show_log_out.dart';

import '../../../../cubit/cubit.dart';
import '../../../../widgets/custom_material_button.dart';
import '../../../../widgets/custom_text_form_field.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        if (state is ShopSuccessUserDataState) {
          // Optionally handle success state
        }
      },
      builder: (BuildContext context, state) {
        var model = ShopCubit.get(context).userModel;

        // Check if model is not null before accessing its properties
        if (model != null) {
          nameController.text = model.data?.name ?? '';
          emailController.text = model.data?.email ?? '';
          phoneController.text = model.data?.phone ?? '';
        }

        return ConditionalBuilder(
          condition: model != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/logout.jpg"),
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    labelText: "Name",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    },
                    labelText: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone cannot be empty";
                      }
                      return null;
                    },
                    labelText: "Phone",
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20.0),
                  CustomMaterialButton(
                    text: "Logout",
                    onPressed: () {
                      showLogout(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}