import 'package:amor/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class RizzScreen extends StatefulWidget {
  const RizzScreen({super.key});

  @override
  State<RizzScreen> createState() => _RizzScreenState();
}

class _RizzScreenState extends State<RizzScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              child: Text(
                "My love for you is like diarrhea, I just can't hold it in.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              )),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.refresh),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "generate",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.darkBlueColor, fontSize: 20),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
