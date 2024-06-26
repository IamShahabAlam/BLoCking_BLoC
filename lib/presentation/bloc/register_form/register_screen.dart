import 'package:bloc_app/bloc/register_form/register_bloc.dart';
import 'package:bloc_app/model/register_model.dart';
import 'package:bloc_app/presentation/bloc/register_form/after_reg_view.dart';
import 'package:bloc_app/utils/configs/app_colors.dart';
import 'package:bloc_app/utils/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/widgets/custom_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final cityController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('BloC Register Screen'),
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
              action: SnackBarAction(
                onPressed: () {
                  //if action button is pressed
                },
                label: 'Close',
              ),
            ),
          );
        } else if (state is RegisterSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AfterRegisterScreen()));
        }
      }, builder: (context, state) {
        if (state is RegisterLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        // else if (state is RegisterInitial) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Register Form',
                style: TextStyle(fontSize: 35.0, color: AppColors.gradient3, fontWeight: FontWeight.bold),
              ),
              // name ------------
              CustomField(
                controller: nameController,
                hintText: 'Name',
              ),
              // AGe ------------
              CustomField(
                controller: ageController,
                hintText: "Age",
              ),
              // City ------------
              CustomField(
                controller: cityController,
                hintText: 'City',
              ),
              // EMail ------------
              CustomField(
                controller: emailController,
                hintText: 'Email',
              ),
              // Password ------------
              CustomField(
                controller: passwordController,
                hintText: 'Password',
              ),

              CustomButton(
                  text: 'Register',
                  onPressed: () {
                    var regModel = RegisterModel(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        city: cityController.text.trim(),
                        age: ageController.text.isNotEmpty ? int.parse(ageController.text) : 0);

                    // Not working ------
                    // regModel.copyWith(
                    //     name: nameController.text.trim(),
                    //     email: emailController.text.trim(),
                    //     password: passwordController.text.trim(),
                    //     city: cityController.text.trim(),
                    //     age: ageController.text.isNotEmpty ? int.parse(ageController.text) : 0);

                    context.read<RegisterBloc>().add(OnRegister(regModel: regModel));
                  }),
            ],
          ),
        );
        // }

        // return Center(
        //     child: const Text(
        //   'Nothing Found!',
        //   style: TextStyle(color: Colors.white),
        // ));
      }),
    );
  }
}
