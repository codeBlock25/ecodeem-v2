import 'package:ecodeem/routes/page_route.dart';
import 'package:ecodeem/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class LicenseTerms extends StatelessWidget {
  const LicenseTerms({Key? key, required this.updateAgreement})
      : super(key: key);

  final Future<void> Function() updateAgreement;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: 100.w,
        height: 100.h,
        child: Container(
          color: Colors.black.withOpacity(0.2),
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 90.w,
                height: 80.h,
                margin: EdgeInsets.only(top: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp.clamp(5, 10))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Text(
                        'User Agreement'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.sp.clamp(16, 24),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ecodeem is platform that enables individuals with an unrivaled access to a community of like-minded people, passionate about a better and more sustainable world. This enabling environment also serves as gateway for individuals to raise funds in order to finance their business ideas and initiatives, share posts and event targeting the Sustainable Development Goals (SDGs), buy and sell products, amongst other exciting features and activities.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'We are grateful to all our users, supporters, partners and donors who help us take a step closer to fulfilling the global goals and get things done in driving sustainable change across our continent in a fun and exhilarating way. Ecodeem recognize that your personal details should be protected at all costs. With accountability and transparency being part of our core values, we strive to augment not only the quality of our initiatives, but also secure the trust and level of commitment you have invested in us. Hence, these Terms shall explain the measure we put in place to respect and preserve your personal information and privacy preferences. Additionally, the Terms will also govern your usage of Ecodeem in order to ensure a safe environment for all parties involved.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Ecodeem is committed to protecting your personal data. By downloading our app and/or submitting your personal data to us, you agree that: ',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'You consent to the practice described in this policy',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Ecodeem may use the information provided in accordance with this policy',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'If you reside outside Nigeria, you consent to have your personal data be processed in countries were the laws pertaining to processing of personal information may not be as strict as those laws in your country.',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'This policy dose not apply to information collected through other means such as by telephone, or in person; although, any such information may be protected by other policies.',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                              )),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'YOUR PERSONAL INFORMATION'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Personal data includes all information about an identified or unidentified individual. There are a number of areas on our site you may be required to provide details like your name, phone number, email address, etc. you are under no obligation to provide us with your personal information if you do not wish to; however, that may limit your experience in terms of accessing certain functions and features of site/app, or requests to certain services or information.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'This app collects data either provided by provided by you directly as well as data from a third party, or automatically through your use of our site/app. The reasons we gather these information is to:',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Allow us enhance our work quality',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Keep you informed on our activity',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Respond to your inquiries and provide assistance where necessary',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Let you have a personalize experience on our app',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Respond to an email or particular request from you',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Process any application requested by you',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Run surveys and promotions',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Offer you information that we believe may be useful  to you, such as information about health products or services provided by us or other businesses',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Perform analytics and to improve our app, products, and advertising',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Facilitate compliance with applicable laws, regulations, and legal processes',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Protect our rights, the rights of affiliates or related third parties, or take appropriate legal action, such as to enforce our Terms of Use.',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          ListTile(
                              minLeadingWidth: 15,
                              leading: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              title: Text(
                                'Retain a record of our transactions and communications, etc.',
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  'Use of Cookies: We may also allow third party service providers to use cookies and other technologies on the app for data collection and processing. For instance, the web pages you have viewed and duration of visit, links you click on, web beacons, browser type, IP address, your domain name, operating system, use of our site services, referring URL or web pages that directed you to our site, etc. these third party technologies are autonomous and their use is governed by the privacy policy of their individual organizations. Visit ',
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'www.aboutads.info/consumers',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.sp.clamp(14, 20),
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await launch(
                                            'https://www.aboutads.info/consumers');
                                      }),
                                const TextSpan(
                                    text:
                                        ' for more information about these third party advertising networks and entitles using similar technologies. We also use cookies to collect standard internal log on information and details of visitor behavior patterns (e,.g. monitoring of the number of visitors on  various sections of the app).  This allows us evaluate and improve on app content and overall user experience.'),
                              ],
                              style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Analytics:  we may use analytics companies to gather data from app views such as pages visited, frequency of visit, etc.; to improve our site/app features. We do not attempt to monitor or uncover the identities of our users via their personal information.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'HOW DO WE PROTECT YOUR INFORMATION?'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Personal data includes all information about an identified or unidentified individual. There are a number of areas on our app you may be required to provide details like your name, phone number, email address, etc. you are under no obligation to provide to us with your personal information if you do not wish to; however, that may limit your experience in terms of accessing certain functions and features of the site/app, or requests to certain services or information. We have made it our point of duty to set up appropriate technical and organizational measures to protect your personal details. For instance, our network is protected and examined routinely. We regularly review person(s) with access to information we have aggregated to ensure your personal data is only handled and accessible to appropriately trained personnel, volunteers and contractors. A contract is put in place for external entities employed for either data collection or processing. Nevertheless, we maintain reasonable administrative, technical and physical safeguards designed to protect the information you have provided on the app. However, no system is 100% fail proof and we cannot guarantee that the information supplied will not be illegally intercepted during transmission via internet, and Ecodeem will not be held liable for the illegal actions of such criminal third parties and hackers.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'OBJECTIONABLE CONTENT AND/OR ABUSIVE USERS'
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 12.sp.clamp(14, 20),
                                      color: Colors.black),
                                  children: <TextSpan>[
                                const TextSpan(
                                  text:
                                      'We do not tolerate abusive users and/or objectionable content and as such any of your posted content flagged as inappropriate by a user would be removed immediately and your account suspended. Please contact us at ',
                                ),
                                TextSpan(
                                    text: 'support@ecodeem.com',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final String emailField = Uri(
                                          scheme: 'mailto',
                                          path: 'support@ecodeem.com',
                                        ).toString();
                                        await launch(emailField);
                                      }),
                                const TextSpan(text: 'for resolution.')
                              ])),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'We have made provision for you to block users should you find any users abusive in our chat platform.',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 12.sp.clamp(14, 20),
                                      color: Colors.black),
                                  text:
                                      'Should you notice any issues relating to Obtainable Content and/or Abusive Users that we didn’t cater for. Please contact us at ',
                                  children: <TextSpan>[
                                TextSpan(
                                    text: 'support@ecodeem.com',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final String emailField = Uri(
                                          scheme: 'mailto',
                                          path: 'support@ecodeem.com',
                                        ).toString();
                                        await launch(emailField);
                                      }),
                                const TextSpan(text: ' for resolution.'),
                              ])),
                          Text(
                            'We have made provision for you to edit your interests if you find any posted content under an sdg category objectionable. This service as a method for filtering objectionable content in future.',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'INFORMATION FOR CHILDREN UNDER 13'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                            text: TextSpan(
                                text:
                                    'We will not intentionally collect any personal data from children under the age of 13 through this app without receiving parental consent. If you think that we have collected personal information from a child under the age of 13 through this app, please contact us at ',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'support@ecodeem.com.',
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final String emailField = Uri(
                                            scheme: 'mailto',
                                            path: 'support@ecodeem.com',
                                          ).toString();
                                          await launch(emailField);
                                        })
                                ]),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'DATA STORAGE DETAILS',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'We will only retain data provided to us through the app for as long as required by law or as necessary for whatever purpose it was collected and in accordance with any consent given. However, we may store your personal data for longer than the stipulated storage period when guided by legal jurisdiction; to which we are subject to adhering. In such instances, the data in question will be deleted after the advised time frame elapses. Furthermore, data which may be applicable for statistical analysis will be preserved, in which case we will anonymize it such that the user is unidentifiable.',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'YOUR RIGHT',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Ecodeem is committed to keeping you apprised on the processing technique of your personal data as far as well as informing you of your rights with 100% transparency. If you require further details of which to exercise your rights do not hesitate to contact us at any time to assuage your concerns.',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'YOUR DATA AND SOCIAL MEDIA',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'When using our app, you can link to social media Platforms like Facebook, Twitter and Instagram to share, Like, Retweet and Post Ecodeem content. Depending on your privacy setting, these activities can adjust in marketing to show you more Ecodeem type contents. You are welcome to post content on our social media services including your comment, pictures and any other information you are interested in making available. Please not that any such content may become public and we cannot restrict usage of such material in a manner that violates this policy, the law or your personal privacy. We neither control other social media platforms and services nor their usage or disclosure of any of your personal data they may have collected from you. For more information on altering such settings please refer to their privacy policy and adjust your preferences.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'COMMUNITY PRINCIPLES',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Ecodeem is a platform that allows individuals to freely express themselves, while showcasing their projects and products. We understand that this is an avenue for multiple interactions from people from different social, religious, and cultural background s and we feel passionately about keeping abuse off all our services Owing to this reason, we have formulated a set of guidelines that highlights the types of post which are classified as objectionable content and mechanisms for dealing with users who may otherwise stray from these guidelines.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          ListTile(
                            minLeadingWidth: 15,
                            leading: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            title: RichText(
                                text: TextSpan(
                                    text: 'Violence: ',
                                    style: TextStyle(
                                        fontSize: 12.sp.clamp(14, 20),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Any content that contains extreme languages, pictures or videos that depicts, facilitates or incites violence is unacceptable. These contents will be removed and subsequently, the accounts will be disabled. We will work closely  with law enforcement agencies in instances we believe there are serious risks to the physical health of individuals or direct threats to public safety',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal))
                                ])),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          ListTile(
                            minLeadingWidth: 15,
                            leading: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            title: RichText(
                                text: TextSpan(
                                    text: 'Hazardous Organizations: ',
                                    style: TextStyle(
                                        fontSize: 12.sp.clamp(14, 20),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Individuals or organizations engaged in the following activities are not allowed access to our app: criminal activities, fraud, hate speech/events (attack on individuals based on their religion, sex, ethnicity, serious disease and disability), human trafficking and terrorist activities. These people and organizations pose a threat to society and their activities are greatly frowned upon at Ecodeem. Also, content showing support of the aforementioned activities or their proponents will also be removed and further investigated.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal))
                                ])),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          ListTile(
                            minLeadingWidth: 15,
                            leading: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            title: RichText(
                                text: TextSpan(
                                    text: 'Harmful Products: ',
                                    style: TextStyle(
                                        fontSize: 12.sp.clamp(14, 20),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Ecodeem gives access to buy and sell goods. However, engaging in retailing products categorized as harmful is against our Terms. Products like firearms, non-medical or non-prescription drugs like marijuana and tramadol should not be sold on our app. Any profile with such products will be disabled',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal))
                                ])),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Nudity and Sexual Activity: ',
                                  style: TextStyle(
                                      fontSize: 12.sp.clamp(14, 20),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: const <TextSpan>[
                                TextSpan(
                                    text:
                                        'We restrict the display of nudity or sexual activity because some users may be sensitive to this kind of content. Also, sexual imagery is immediately removed to stop shares among users as these images may have been uploaded without the individual’s consent. Additionally, we constrain the use of sexually explicit languages on our platform.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ])),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Ecodeem users can report and flag objectionable content and block abusive profiles. These reports will be directed to the Ecodeem team. To ensure safety and a conducive environment for users, the team acts on these reports within 24 hours. If found to be in violation of Ecodeem’s Terms, the content is removed and the publisher is warned. Furthermore, users who post inappropriate content will be blocked (for a time frame) or banned (permanently): depending on the severity of lewdness of content uploaded.',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'AMENDMENT OF THESE TERMS',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black,
                                  ),
                                  text:
                                      'We may make changes to this notice from time to time. There will always be a notice to the latest updates of the Terms found at the end of this document which you should check occasionally. Any alteration that affects our earlier practices of handling your personal data, we will notify you in advance by highlighting it on our app. Data controller address and data privacy registration details can be found at ',
                                  children: <TextSpan>[
                                TextSpan(
                                    text: 'www.ecodeem.com.',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        await launch('https://www.ecodeem.com');
                                      })
                              ])),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'CHANGE YOUR PREFERENCES',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Email Opt-Out Procedures: ',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text:
                                        'We may send periodic promotional or informational emails to you. You may opt-out of such communications by following the opt-out instructions contained in the e-mail. Please note that it may take up to 10 business days for us to process opt-out requests. If you opt-out of receiving emails about recommendations or other information we think may interest you, we may still send you e-mails about your account or any services you have requested or received from us.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Update Profile Information: ',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text:
                                        'Ecodeem may offer the chance to modify personal information that you have submitted by logging into your account and updating your profile information. In such case, please note that copies of information that you have updated, modified, or deleted may remain viewable in cached and archived pages of the Site for a period of time. Questions or Complaints: Finally, if you have questions about the privacy aspects of our services or would like to make a complaint, please contact us or email us at ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                      text: 'info@cafsed.org.',
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          final String emailField = Uri(
                                            scheme: 'mailto',
                                            path: 'info@cafsed.com',
                                          ).toString();
                                          await launch(emailField);
                                        })
                                ]),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'CONTACT US',
                            style: TextStyle(
                                fontSize: 12.sp.clamp(14, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          RichText(
                            text: TextSpan(
                                text:
                                    'To contact us regarding these Terms and our related privacy practices, please visit the Contact Us page at ',
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'www.ecodeem.com.',
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          await launch(
                                              'https://www.ecodeem.com');
                                        }),
                                  const TextSpan(
                                    text:
                                        'If you believe we or any company associated with us has misused any of your information, please contact us immediately and report such misuse.',
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            'Terms of Service last revised: January 2020',
                            style: TextStyle(
                              fontSize: 12.sp.clamp(14, 20),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 5.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                Get.offAllNamed(AppPageRoute.activity);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 20.sp, vertical: 6.sp),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.sp),
                                      side: const BorderSide(
                                          color: primaryColor, width: 2)),
                                ),
                              ),
                              child: Text(
                                'I reject'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.sp.clamp(14, 20),
                                ),
                              )),
                          SizedBox(
                            width: 5.sp,
                          ),
                          TextButton(
                              onPressed: () async {
                                updateAgreement();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 20.sp, vertical: 6.sp),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                ),
                              ),
                              child: Text(
                                'I accept'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12.sp.clamp(14, 20),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
