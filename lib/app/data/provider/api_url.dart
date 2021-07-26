// const String hostImage = 'https://sim-b.xaurius.com';
// const String hostImage = 'https://pro.xaurius.com';
const String hostImage = 'https://dev.dev.xaurius.com';
// const String hostAPI = 'https://sim-b.xaurius.com/api/v1';
// const String hostAPI = 'https://pro.xaurius.com/api/v1';
const String hostAPI = 'https://dev.dev.xaurius.com/api/v1';

const register = '/auth/register';
const registerVerification = '/auth/register_verification';
const registerResendVerification = '/auth/register_otp_resend';
const registerPin = '/auth/register_pin';
const login = '/auth/login';
const profile = '/profile';
const kycPersonalInfo = '/kyc/kyc_1_personal_info';
const kycDocument = '/kyc/kyc_2_identity_document';
const profileBank = '/profile/bank';
const buys = '/buys';
const createBuys = '/buys/create';
const checkOut = '/checkout';
const invoice = '/invoice';
const madePayment = '/invoices/i_have_made_payment';
const getVaMerchant = '/va_merchants';
const getTopUp = '/depoidrs';
const postTopUp = '/depoidrs/new';
const getDetailInvoices = '/invoices/';
const dashboard = '/dashboard';
const getOtp = '/general/send_otp';
const wdXau = '/wdxaus/create';
const getWdXau = '/wdxaus';
const getDepoXau = '/depoxaus';
const resetPinEmail = '/auth/request_reset_pin';
const resetPinVerifCode = '/auth/request_reset_pin/check_otp';
const resetPinRecreate = '/auth/request_reset_pin/change_pass';
