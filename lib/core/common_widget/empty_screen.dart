import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovaccer_news_app/core/constants/constants.dart';

class EmptyScreen extends StatelessWidget {
  final String message;
  const EmptyScreen({super.key, this.message = 'No Data Available'});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppConstants.NODATASVG,
            fit: BoxFit.fill,
          ),
          Center(
            child: Text(
              ' $message',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(color: theme.iconTheme.color),
            ),
          ),
        ],
      ),
    );
  }
}
