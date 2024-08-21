import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchableForNumOfMotamer extends StatelessWidget {
  const SwitchableForNumOfMotamer({
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
      minWidth: 160,
      curve: Curves.bounceInOut,
      cornerRadius: 50,
      centerText: true,
      inactiveBgColor: Colors.grey.shade400,
      inactiveFgColor: Colors.black,
      textDirectionRTL: true,
      initialLabelIndex: 0,
      totalSwitches: BlocProvider.of<AuthCubit>(context).labels.length,
      labels: BlocProvider.of<AuthCubit>(context).labels,
      onToggle: (index) {
        if (index == null) {
          if (index == 0) {
            BlocProvider.of<AuthCubit>(context).mNum = "first";
          } else {
            BlocProvider.of<AuthCubit>(context).mNum = "second";
          }
        }
      },
    );
  }
}
