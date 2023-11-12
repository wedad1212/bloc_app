import 'package:bloc_app/cupit_locale/local_cubit.dart';
import 'package:bloc_app/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr(context)),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 100,
            color: Colors.purpleAccent.shade100,
            child: BlocConsumer<LocalCubit, ChangeLocalState>(
              listener: (BuildContext context, ChangeLocalState state) {
                Navigator.pop(context);
              },
              builder: (context, state) => DropdownButton(
                value: state.locale,
                onChanged: (newValue) {
                  context.read<LocalCubit>().changeAndSetLaguage(newValue!);
                },
                style: const TextStyle(color: Colors.white),
                underline: const SizedBox(),
                dropdownColor: Colors.purpleAccent.shade100,
                icon: const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
                items: ["en", "ar"].map((String items) {
                  return DropdownMenuItem<String>(
                      value: items, child: Text(items));
                }).toList(),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
