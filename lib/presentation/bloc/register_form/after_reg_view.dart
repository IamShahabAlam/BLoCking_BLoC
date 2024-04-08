import 'package:bloc_app/bloc/register_form/register_bloc.dart';
import 'package:bloc_app/presentation/bloc/register_form/register_screen.dart';
import 'package:bloc_app/utils/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AfterRegisterScreen extends StatelessWidget {
  const AfterRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('After Register Screen'),
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
        } else if (state is RegisterInitial) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
        }
      }, builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        // else if (state is RegisterSuccess) {
        state as RegisterSuccess;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(title: Text(state.token), subtitle: const Text('Token')),
            ListTile(title: Text(state.registerModel.name), subtitle: const Text('Name')),
            ListTile(title: Text(state.registerModel.city), subtitle: const Text('City')),
            ListTile(title: Text(state.registerModel.age.toString()), subtitle: const Text('Age')),
            ListTile(title: Text(state.registerModel.email), subtitle: const Text('Email')),
            CustomButton(text: 'Logout', onPressed: () => context.read<RegisterBloc>().add(OnLogout()))
          ],
        );
        // }
        //  else {
        //   return const Text('Nothing Found!');
        // }
      }),
    );
  }
}
