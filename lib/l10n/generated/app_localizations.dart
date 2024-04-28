import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @login.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get login;

  /// No description provided for @username.
  ///
  /// In vi, this message translates to:
  /// **'Tên đăng nhập'**
  String get username;

  /// No description provided for @password.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In vi, this message translates to:
  /// **'Quên mật khẩu?'**
  String get forgotPassword;

  /// No description provided for @orSigninWith.
  ///
  /// In vi, this message translates to:
  /// **'Hoặc đăng nhập với'**
  String get orSigninWith;

  /// No description provided for @profile.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ'**
  String get profile;

  /// No description provided for @upcoming.
  ///
  /// In vi, this message translates to:
  /// **'Sắp chiếu'**
  String get upcoming;

  /// No description provided for @nowInCinemas.
  ///
  /// In vi, this message translates to:
  /// **'Đang chiếu'**
  String get nowInCinemas;

  /// No description provided for @about.
  ///
  /// In vi, this message translates to:
  /// **'Giới thiệu'**
  String get about;

  /// No description provided for @sessions.
  ///
  /// In vi, this message translates to:
  /// **'Lịch chiếu'**
  String get sessions;

  /// No description provided for @selectSessions.
  ///
  /// In vi, this message translates to:
  /// **'Đặt lịch chiếu'**
  String get selectSessions;

  /// No description provided for @time.
  ///
  /// In vi, this message translates to:
  /// **'Thời gian'**
  String get time;

  /// No description provided for @byCinema.
  ///
  /// In vi, this message translates to:
  /// **'Theo rạp'**
  String get byCinema;

  /// No description provided for @unknown.
  ///
  /// In vi, this message translates to:
  /// **'Không cung cấp'**
  String get unknown;

  /// No description provided for @minutes.
  ///
  /// In vi, this message translates to:
  /// **'phút'**
  String get minutes;

  /// No description provided for @vote.
  ///
  /// In vi, this message translates to:
  /// **'lượt bình chọn'**
  String get vote;

  /// No description provided for @male.
  ///
  /// In vi, this message translates to:
  /// **'Nam'**
  String get male;

  /// No description provided for @female.
  ///
  /// In vi, this message translates to:
  /// **'Nữ'**
  String get female;

  /// No description provided for @other.
  ///
  /// In vi, this message translates to:
  /// **'Khác'**
  String get other;

  /// No description provided for @deleteTicketSuccessfully.
  ///
  /// In vi, this message translates to:
  /// **'Đã xóa vé thành công'**
  String get deleteTicketSuccessfully;

  /// No description provided for @areYouSureYouWantToDeleteThisTicket.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có thực sự muốn xóa vé này không?'**
  String get areYouSureYouWantToDeleteThisTicket;

  /// No description provided for @inform.
  ///
  /// In vi, this message translates to:
  /// **'Thông báo'**
  String get inform;

  /// No description provided for @alert.
  ///
  /// In vi, this message translates to:
  /// **'Cảnh báo'**
  String get alert;

  /// No description provided for @confirm.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In vi, this message translates to:
  /// **'Hủy'**
  String get cancel;

  /// No description provided for @error.
  ///
  /// In vi, this message translates to:
  /// **'Lỗi'**
  String get error;

  /// No description provided for @saveAccountSuccessfully.
  ///
  /// In vi, this message translates to:
  /// **'Đã lưu thông tin tài khoản thành công'**
  String get saveAccountSuccessfully;

  /// No description provided for @save.
  ///
  /// In vi, this message translates to:
  /// **'Lưu'**
  String get save;

  /// No description provided for @information.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin'**
  String get information;

  /// No description provided for @dateOfBirth.
  ///
  /// In vi, this message translates to:
  /// **'Ngày sinh'**
  String get dateOfBirth;

  /// No description provided for @phoneNumber.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @gender.
  ///
  /// In vi, this message translates to:
  /// **'Giới tính'**
  String get gender;

  /// No description provided for @city.
  ///
  /// In vi, this message translates to:
  /// **'Tỉnh thành'**
  String get city;

  /// No description provided for @settings.
  ///
  /// In vi, this message translates to:
  /// **'Cài đặt'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ'**
  String get language;

  /// No description provided for @receiveNotifications.
  ///
  /// In vi, this message translates to:
  /// **'Nhận thông báo'**
  String get receiveNotifications;

  /// No description provided for @savedCard.
  ///
  /// In vi, this message translates to:
  /// **'Thẻ đã lưu'**
  String get savedCard;

  /// No description provided for @addNewCard.
  ///
  /// In vi, this message translates to:
  /// **'Thêm thẻ mới'**
  String get addNewCard;

  /// No description provided for @paymentHistory.
  ///
  /// In vi, this message translates to:
  /// **'Lịch sử mua vé'**
  String get paymentHistory;

  /// No description provided for @changeAvatarSuccessfully.
  ///
  /// In vi, this message translates to:
  /// **'Thay đổi ảnh đại diện thành công'**
  String get changeAvatarSuccessfully;

  /// No description provided for @emailNotFound.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy email'**
  String get emailNotFound;

  /// No description provided for @fullName.
  ///
  /// In vi, this message translates to:
  /// **'Họ và tên'**
  String get fullName;

  /// No description provided for @areYouSureYouWantToChangeLanguage.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có chắc bạn muốn đổi ngôn ngữ không?'**
  String get areYouSureYouWantToChangeLanguage;

  /// No description provided for @areYouSureYouWantToSignOut.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có chắc bạn muốn đăng xuất không?'**
  String get areYouSureYouWantToSignOut;

  /// No description provided for @delete.
  ///
  /// In vi, this message translates to:
  /// **'Xóa'**
  String get delete;

  /// No description provided for @movieDetail.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin về phim'**
  String get movieDetail;

  /// No description provided for @payForTicket.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận mua vé'**
  String get payForTicket;

  /// No description provided for @cinema.
  ///
  /// In vi, this message translates to:
  /// **'Rạp'**
  String get cinema;

  /// No description provided for @date.
  ///
  /// In vi, this message translates to:
  /// **'Thời gian'**
  String get date;

  /// No description provided for @runtime.
  ///
  /// In vi, this message translates to:
  /// **'Thời lượng'**
  String get runtime;

  /// No description provided for @seats.
  ///
  /// In vi, this message translates to:
  /// **'Ghế'**
  String get seats;

  /// No description provided for @adult.
  ///
  /// In vi, this message translates to:
  /// **'Người lớn'**
  String get adult;

  /// No description provided for @total.
  ///
  /// In vi, this message translates to:
  /// **'Tổng'**
  String get total;

  /// No description provided for @areYouSureYouWantToBuyThisTicket.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có chắc chắn muốn mua vé này không?'**
  String get areYouSureYouWantToBuyThisTicket;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
