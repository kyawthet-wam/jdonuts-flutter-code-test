// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'J\'Donuts';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get demoOnlyMessage => 'This isn\'t available in the demo.';

  @override
  String get offlineBanner => 'You\'re offline. Showing saved data.';

  @override
  String get tierBronze => 'Bronze';

  @override
  String get tierSilver => 'Silver';

  @override
  String get tierGold => 'Gold';

  @override
  String get tierPlatinum => 'Platinum';

  @override
  String tierMember(String tier) {
    return '$tier member';
  }

  @override
  String pointsLeft(String points, String tier) {
    return '$points points left to become $tier Member';
  }

  @override
  String notificationsLabel(int count) {
    return 'Notifications, $count unread';
  }

  @override
  String seeAll(String section) {
    return 'See all $section';
  }

  @override
  String get newBadge => 'New';

  @override
  String discountOff(int percent) {
    return '$percent% off';
  }

  @override
  String shopsNearYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'are $count J\'Donut shops',
      one: 'is 1 J\'Donut shop',
    );
    return 'There $_temp0 near you.';
  }

  @override
  String get exploreNow => 'EXPLORE NOW';

  @override
  String get orderOnline => 'Order Online';

  @override
  String get sectionError => 'Couldn\'t load this section.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get sectionEmpty => 'Nothing here yet.';

  @override
  String priceMmk(String amount) {
    return '$amount MMK';
  }

  @override
  String get whatsThis => 'What\'s this?';

  @override
  String get addToCart => 'ADD TO CART';

  @override
  String get addedToCart => 'ADDED TO CART';

  @override
  String get productUnavailable => 'This product isn\'t available.';

  @override
  String get quantityLabel => 'Quantity';

  @override
  String get decreaseQuantity => 'Decrease quantity';

  @override
  String get increaseQuantity => 'Increase quantity';

  @override
  String get refreshFailed =>
      'Couldn\'t refresh right now. Showing saved data.';

  @override
  String get rewardsTitle => 'J\' Donuts Rewards';

  @override
  String get rewardsBadge => 'Rewards';

  @override
  String rewardsBadgeLabel(int count) {
    return '$count rewards';
  }

  @override
  String get totalPoints => 'Total points';

  @override
  String get tabEarn => 'Eat more earn more';

  @override
  String get tabGift => 'Gift';

  @override
  String get tierHere => 'You\'re here now';

  @override
  String get tierAchieved => 'Achieved';

  @override
  String get tierSoon => 'You\'ll be here soon';

  @override
  String tierRemaining(String points, String tier) {
    return '$points pts Remaining to become $tier';
  }

  @override
  String get earn => 'EARN';

  @override
  String earnLabel(int points) {
    return 'Earn $points points';
  }

  @override
  String rewardPoints(String points) {
    return '$points pts';
  }

  @override
  String challengeProgress(int current, int target) {
    return '$current/$target';
  }

  @override
  String get giftsComingSoon => 'Gifts are on their way.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get logOut => 'Log out';

  @override
  String get navHome => 'Home';

  @override
  String get navRewards => 'Reward';

  @override
  String get navExplore => 'Explore';

  @override
  String get navWallet => 'Wallet';

  @override
  String get navSettings => 'Settings';

  @override
  String get continueLabel => 'CONTINUE';

  @override
  String get legalPrefix =>
      'By continuing, you acknowledge that you have read and agree to our ';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get legalAnd => ' and ';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get onboardingTitle => 'Round food for every mood';

  @override
  String get letsGetStarted => 'LET\'S GET STARTED';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get logIn => 'Log in';

  @override
  String get continueWithGoogle => 'Google';

  @override
  String get continueWithApple => 'Apple';

  @override
  String get continueWithFacebook => 'Facebook';

  @override
  String get phoneTitle => 'Enter your phone number';

  @override
  String get phoneHint => '09 xxx xxx xxx';

  @override
  String get errorPhoneEmpty => 'Enter your phone number.';

  @override
  String get errorPhoneInvalid =>
      'Enter a valid Myanmar number, e.g. 09 254 135 592.';

  @override
  String get notRegistered => 'This number isn\'t registered yet. ';

  @override
  String get registerLink => 'Register';

  @override
  String get verifyTitle => 'Verify your number';

  @override
  String otpSentTo(String phone) {
    return 'We\'ve sent 6 digit OTP to $phone';
  }

  @override
  String get didntReceiveCode => 'Didn\'t receive the code?';

  @override
  String get resendIn => 'resend in ';

  @override
  String resendTime(String time) {
    return '$time min';
  }

  @override
  String get resendCode => 'Resend code';

  @override
  String otpWrong(int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining attempts',
      one: '1 attempt',
    );
    return 'Incorrect code. $_temp0 left.';
  }

  @override
  String get otpLocked => 'Too many wrong codes. Tap Resend to try again.';

  @override
  String get nameTitle => 'What\'s your name?';

  @override
  String get firstNameHint => 'First Name';

  @override
  String get lastNameHint => 'Last Name';

  @override
  String get errorNameRequired => 'Enter your first name.';

  @override
  String get errorNameInvalid => 'Use letters and spaces only.';

  @override
  String get errorNameTooLong => 'Use 50 characters or fewer.';

  @override
  String get dobTitle => 'What\'s your date of birth?';

  @override
  String get monthHint => 'Month';

  @override
  String get dayHint => 'Day';

  @override
  String get yearHint => 'Year';

  @override
  String get errorDobIncomplete => 'Enter your full date of birth.';

  @override
  String get errorDobInvalid => 'That date doesn\'t exist.';

  @override
  String get errorDobFuture => 'Date of birth can\'t be in the future.';

  @override
  String errorDobTooYoung(int age) {
    return 'You must be at least $age years old.';
  }

  @override
  String get welcomeTitle => 'Welcome to the world of J\'donuts';

  @override
  String get letsExplore => 'LET\'S EXPLORE';
}
