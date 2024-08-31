import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchableForNumOfType extends StatelessWidget {
  const SwitchableForNumOfType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      animationDuration: Duration.hoursPerDay,
      animate: true,
      activeBgColor: [mainColor, mainColor],
      activeFgColor: Colors.white,
      dividerColor: mainColor,
      fontSize: 22,
      minWidth: 120,
      curve: Curves.bounceInOut,
      cornerRadius: 50,
      centerText: true,
      inactiveBgColor: Colors.grey.shade400,
      inactiveFgColor: Colors.black,
      textDirectionRTL: true,
      initialLabelIndex: 0,
      totalSwitches: BlocProvider.of<AuthCubit>(context).types.length,
      labels: BlocProvider.of<AuthCubit>(context).types,
      onToggle: (index) {
        if (index != null) {
          if (index == 0) {
            BlocProvider.of<AuthCubit>(context).showpassword(false);
          } else {
            BlocProvider.of<AuthCubit>(context).showpassword(true);
          }
        }
      },
    );
  }
}
