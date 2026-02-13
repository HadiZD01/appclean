import 'package:appclean/core/theming/colors.dart';
import 'package:appclean/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi,Hadi!", style: TextStyles.font18DarkBlueBold),
            Text("How Are You Todat?", style: TextStyles.font12GrayRegular),
          ],
          
        ),
        Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsApp.morelightergray,
          child: SvgPicture.asset("assets/svgs/notification.svg"),
          
          
        ),
        
        

      ],
    );
  }
}
