import 'package:bingo/Application/Advertisemnet/ad_bloc.dart';
import 'package:bingo/Core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        context.read<AdBloc>().add(const AdEvent.interstatial()));
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kPrimaryGreen,
        surfaceTintColor: kPrimaryGreen,
        automaticallyImplyLeading: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/img/logo white.png')),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.09,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/bingo strips.png'))),
          ),
          ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: kWhite,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Thank you for using our app, your privacy is important us, and we want to show you how we handle your data',
                  style: TextStyle(color: kWhite),
                ),
              ),
              PPWidget(
                title: '1. No personal data collection',
                description:
                    'We do not collect, styore,or share any personal data from the user. the app dows not required any information of the user to run.',
              ),
              PPWidget(
                title: '2. Advertising',
                description:
                    'Our app may display third-party ads (such as Google Admob) to support development. These ads may collect data such ad device type and intraction with the ads to show relevent ads. We do not have any access to this information.',
              ),
              PPWidget(
                title: '3. Children\'s Privacy',
                description:
                    'The app does not have any age limit. However , we recommand to use the app under a limited screen time',
              ),
              PPWidget(
                  title: '4. Changes to This Policy',
                  description:
                      'We may update our Privacy policy from time to time. We will notify you of any changes by posting on update description.'),
            ],
          )
        ],
      ),
    );
  }
}

class PPWidget extends StatelessWidget {
  final String title;
  final String description;
  const PPWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: kWhite, fontSize: 22),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(description, style: const TextStyle(color: kWhite)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
