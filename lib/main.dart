import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guido/bookkingProcess/bookingdetails.dart';
import 'package:guido/bookkingProcess/dateselection.dart';
import 'package:guido/bookkingProcess/guestspick.dart';
import 'package:guido/bookkingProcess/paymentpage.dart';
import 'package:guido/bookkingProcess/verifypage.dart';
import 'package:guido/client_product/initial_pages_setup/clientpageone.dart';
import 'package:guido/client_product/initial_pages_setup/insetpageone.dart';
import 'package:guido/client_product/initial_pages_setup/setuppageone.dart';
import 'firebase_options.dart';
import 'package:guido/app/checklogin.dart';
import 'package:guido/app/login.dart';
import 'package:guido/app/opening.dart';
import 'package:guido/app/signin.dart';
import 'package:guido/client_product/beaguido/login.dart';
import 'package:guido/client_product/beaguido/setupaccount.dart';
import 'package:guido/client_product/beaguido/signin.dart';
import 'package:guido/client_product/screens/signuppage.dart';
import 'package:guido/constants/colors.dart';
import 'package:guido/customer_product/SettingsPages/General/Change_Language/ChangeLanguage.dart';
import 'package:guido/customer_product/SettingsPages/General/Accounts&Privacy/accounts_privacy.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/creditsandcoupons.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymentandcards.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymenthistory.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/Payment&cards_options/paymentmethods.dart';
import 'package:guido/customer_product/SettingsPages/General/Payment&cards/payment_and_cards.dart';
import 'package:guido/customer_product/SettingsPages/General/Personal_info_pages/personalinformation.dart';
import 'package:guido/customer_product/SettingsPages/Legal/PrivacyPolicy/privacypolicy.dart';
import 'package:guido/customer_product/SettingsPages/Legal/Terms&Conditions/termsandconditions.dart';
import 'package:guido/customer_product/SettingsPages/ProfilePage/Profilepage.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/call_us.dart';
import 'package:guido/customer_product/SettingsPages/Support/Call_Us/talktous.dart';
import 'package:guido/customer_product/SettingsPages/Support/Emergency/emergency.dart';
import 'package:guido/customer_product/SettingsPages/Support/Give_Us_Feedback/giveusfeedback.dart';
import 'package:guido/customer_product/SettingsPages/Support/How_Guido_Works/howguidoworks.dart';
import 'package:guido/customer_product/screens/afterinfopage.dart';
import 'package:guido/customer_product/screens/firstpage.dart';
import 'package:guido/selectionpage.dart';
import 'package:guido/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DefaultFirebaseOptions.currentPlatform;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: black,
        primarySwatch: primaryBlack,
        colorScheme: const ColorScheme(
          primary: Color(0xFF363636),
          primaryContainer: Color(0xFF002984),
          secondary: Color(0xFF000000),
          secondaryContainer: Color(0xFF9A0007),
          surface: Color(0xFFDEE2E6),
          background: Color(0xFFF8F9FA),
          error: Color(0xFF96031A),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? OpeningAppPage().id
          : '/afterinfopage',
      routes: {
        const CheckLogin().id: (context) => const CheckLogin(),
        OpeningAppPage().id: (context) => OpeningAppPage(),
        '/signup': (context) => const AppSignin(),
        const AppLogin().id: (context) => const AppLogin(),
        '/selection': (context) => SelectionPage(),
        '/firstpage': (context) => FirstPage(),
        '/afterinfopage': (context) => AfterInfoPage(),
        '/clientsignup': (context) => ClientSignup(),
        '/setup': (context) => SetupAccount(),
        '/clientlogin': (context) => ClientLogin(),
        '/clientsignin': (context) => ClientSignin(),
        '/test': (context) => TestPage(),
        const PersonalinformationPage().id: (context) =>
            const PersonalinformationPage(),
        const ProfileinformationPage().id: (context) =>
            const ProfileinformationPage(),
        const ChangeLanguagePage().id: (context) => const ChangeLanguagePage(),
        const AccountsandPrivacyPage().id: (context) =>
            const AccountsandPrivacyPage(),
        const PaymentandCardsPage().id: (context) =>
            const PaymentandCardsPage(),
        const HowGuidoWorksPage().id: (context) => const HowGuidoWorksPage(),
        const GiveUsFeedback().id: (context) => const GiveUsFeedback(),
        const EmergancyPage().id: (context) => const EmergancyPage(),
        const CallUs().id: (context) => const CallUs(),
        const TermsAndConditionsPage().id: (context) =>
            const TermsAndConditionsPage(),
        const PrivacyPolicyPage().id: (context) => const PrivacyPolicyPage(),
        const PaymentMethodsPage().id: (context) => const PaymentMethodsPage(),
        const CreditsandCouponsPage().id: (context) =>
            const CreditsandCouponsPage(),
        const PaymentandRefundsPage().id: (context) =>
            const PaymentandRefundsPage(),
        const PaymentHistoryPage().id: (context) => const PaymentHistoryPage(),
        const TalkToUsePage().id: (context) => TalkToUsePage(),
        const DateSelectionPage().id: (context) => DateSelectionPage(),
        const GuestsPickPage().id: (context) => GuestsPickPage(),
        const BookingDetailsPage().id: (context) => BookingDetailsPage(),
        const PaymentPage().id: (context) => PaymentPage(),
        const VerifyPage().id: (context) => VerifyPage(),
        // const Routing().id:(context) =>  Routing(),
        const ClientPageOne().id: (context) => ClientPageOne(),
        const CreateGuidoDataInitials().id: (context) =>
            CreateGuidoDataInitials(),
        // InitialSetupPageOne().id:(context) => InitialSetupPageOne(),
      },
    );
  }
}
