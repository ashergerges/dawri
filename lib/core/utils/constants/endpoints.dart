class Endpoints {
  const Endpoints();

  String get refreshTokenUrl => r'api/auth/refresh-token';

  String get updateUserDataUrl => r'api/updateUserData';

  String get getNotificationsUrl => r'api/getNotifications';

  String get loginUrl => r'api/app/auth/login';
  String get signUpUrl => r'api/app/auth/signup';
  String get reSendOTPUrl => r'api/app/auth/resend-otp';
  String get validateOTPUrl => r'api/app/auth/verify-otp';
  //home
  String get homeUrl => r'api/app/home';
  //categories
  String get categoriesUrl => r'api/app/categories';
  //venues
  String get productsUrl => r'api/app/products/all';
  //vendor details
  String get vendorDetailsUrl => r'api/app/products/details';
  String get wishlistTypeUrl => r'api/app/user/wishlist';
  String get packageDetailsUrl => r'api/app/package/details';

  String get timeSlotsUrl => r'api/app/booking/available-slots';
  String get paymentMethodUrl => r'api/app/payment_types/all';
  String get makeBookUrl => r'api/app/booking/make';

  //my booking
  String get myBookingUrl => r'api/app/booking/my-bookings';
  String get bookingDetailsUrl => r'api/app/booking/details';
  String get reviewAddUrl => r'api/app/review/add';
  String get cancelBookUrl => r'api/app/booking/cancel';
  String get editDateBookUrl => r'api/app/booking/edit-date';

  //profile
  String get updateProfileImageUrl => r'api/app/update-profile-image';
  String get updateProfileUrl => r'api/app/update-profile';

  //notification
  String get notificationUrl => r'api/app/notifications/all';

  // create invitation
  String get createInvitationUrl => r'api/app/invitation/create';
  String get getInvitationByBookingUrl => r'api/app/invitation/get';
  String get addGuestsUrl => r'api/app/invitation/add_guests';

  // support
  String get supportUrl => r'api/app/support-data';

  //cart
  String get addedToCartUrl => r'api/app/cart/add';
  String get cartUrl => r'api/app/cart';
  String get cartDeleteUrl => r'api/app/cart/delete';
  String get cartUpdateUrl => r'api/app/cart/update';
  String get couponsApplyUrl => r'api/app/coupons/apply';

  //product details
  String get productDetailsUrl  => r'api/app/products/details';
  String get wishlistToggleUrl => r'api/app/user/wishlist/toggle';

  // create championship
  String get sportsUrl => r'api/app/sports';
  String get championshipTypesUrl => r'api/app/championship-types';
  String get registrationModesUrl => r'api/app/registration-modes';
  String get citiesUrl => r'api/app/cities';
  String get createChampionshipUrl => r'api/app/championships';

  //championships
  String get championshipsUrl => r'api/app/championships';
  String get participantTypesUrl => r'api/app/participant-types';
  String get championshipRegisterOneUrl => r'api/app/championships/register-one';

  String get teamsUrl => r'api/app/teams';
  String get championshipRegisterTeamUrl => r'api/app/championships/register-team';

}
