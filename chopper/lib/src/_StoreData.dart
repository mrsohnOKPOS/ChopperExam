

import 'dart:ffi';

import 'package:chopper/src/Define.dart';
/**
 * baeminStatus": "배민 매장 연동 상태",
 * coupangeatsStatus": "쿠팡잇츠 매장 연동 상태",
 * crefiaStatus": "여신 매장 연동 상태",
 * hometaxStatus": "홈택스 매장 연동 상태",
 * isNewMsg": false,
 * isNewReport": false,
 * okposStoreYn": "OKPOS 사용 매장 여부(n, y)",
 * posConnectionYn": "포스 연동 여부(n, y)",
 * prepayYn": "선불 매장 여부(n, y)",
 * storeId": "가맹점 ID",
 * storeName": "가맹점 명",
 * yogiyoStatus": "요기요 매장 연동 상태"
 */
class StoreData {


  int storeId = -1;                   // 가맹점 ID
  var okposStoreId = '';           // Okpos 가맹점 ID
  var storeName = '';              // 가맹점 명

  var okgoYn = "" ;                        // 배달매니저 사용 여부(Y, N)

  var posConnectionYn = "N";       // POS 연동 여부
  var businessNumber = '';         // 사업자 등록 번호
  var companyNumber  = '';   // 법인 사업자 번호
  var storeOwnerName = '';
  var compareRate = 0.0;
  var onlineYn = null;//?: "N"    // 매장선택 팝업 에서 나오는 값
  var linkState = "연동중";
  int linkStateColor = 0;
  var ownerPhone = '';             // 대표자 핸드폰 번호
  var businessName = '';           // 대표자 이름
  var businessContact = '';        // 매장 연락처
  var connectionMethod = '';   // 연동 방법(aspId 로그인 : ASP, 간편연동 : EASY, QR : QR) DISCONNECT
  var address = '';                // 가맹점 주소

  var connectedAccountCnt = 0;             // 연동 완료 계정 수

  var posConnectionStatus = '';            // POS 연동 상태",(CONNECTED : 연동 중, PENDING : 재연동 필요, NONE : 미연동)

  // /api/v3/main/info 데이터
  bool isNewMsg = false;           // boolean, true면 미수신 리포트 존재(우측 상단 종모양에 빨간 뱃지는 isNewMsg)
  bool isNewReport = false;        // 미확인 리포트 존재 여부(메인화면 리포트알림 카드뷰 )

  var crefiaId = '';               // 여신협 ID",
  var hometaxId = '';              // 홈택스 ID",
  var baeminId = '';               // 배민 ID",
  var yogiyoId = '';               // 요기요 ID",
  var coupangeatsId = '';          // 쿠팡이츠 연동 ID",

  var prepayYn = "N";            // 선불 매장 여부(n, y)
  String? okposStoreYn;       // OKPOS 사용 매장 여부(n, y)
  var hometaxStatus = DefLink.NONE;       // 홈택스 매장 연동 상태
  var crefiaStatus =  DefLink.NONE;       // 여신 매장 연동 상태
  var crefiaConnectionType = '';  // 여신협회 연동 타입 (USER_ID - 여신협회 ID 연동, OKPOS_ID - 카드 가맹 계좌정보 연동)
  var baeminStatus =  DefLink.NONE;       // 배민 매장 연동 상태
  var yogiyoStatus =  DefLink.NONE;       // 요기요 매장 연동 상태
  var coupangeatsStatus = DefLink.NONE;   // 쿠팡잇츠 매장 연동 상태
  var tboardId;           // 티보드 merchant id",
  var tboardYn = '';                      // 티보드 연동 여부",

  var managerRating = ''; // 관리자 등급(최고관리자: TOP, 일반관리자: GENERAL)
  var blockedStoreYn = ''; // 매장 차단 기능 사용 여부" (최고 관리자만 앱 노출 및 설정 가능 옵션으로 일반 관리자는 무조건 N)

  // 계좌연동 리스트
//   var bankStatusList = Array<BankAccountData>();
//
// //    /**
// //     * 전일대비 소숫점 뒷자리 0보다 큰 경우 소숫점 표시 아닌 경우 Int로만 표시
// //     */
// //    fun getCompareRateStr(): String {
// //        if (compareRate == 0.0)
// //            return "0"
// //        val intRate = Math.floor(compareRate)
// //        val ext = intRate - compareRate
// //        println("ext=${ext}, ${0.0 == ext}")
// //        var formatStr = ""
// //        if (0.0 == ext) {
// //            formatStr = String.format("%,d", compareRate.toInt())
// //        } else {
// //            formatStr = String.format("%,.1f", compareRate)
// //        }
// //        formatStr = if (compareRate > 0) "${formatStr}" else "${formatStr}"
// //        return formatStr
// //    }
//
//   /**
//    * 매니저 레벨이 vararg 안에 포함 되어 있는지 여부
//    * 관리자 등급(최고관리자: TOP, 일반관리자: GENERAL)
//    */
//   bool isExistManagerRating(vararg rating: String) {
//   rating.find {
//   managerRating == it
//   }.apply {
//   return this != null
//   }
//   }
//
//   /**
//    * POS 연동여부
//    */
//   bool isPosConnection() {
//   return ((posConnectionYn == 'Y') || (posConnectionStatus == DefLink.CONNECTED));
//   }
//
//   /**
//    * 배달매니저 연동여부
//    */
//   bool isOKGOConnection() {
//   return (okgoYn == 'Y');
//   }
//
//   /**
//    * OKPOS여부
//    */
//   bool isOKPOS() {
//     return (okposStoreYn == 'Y');
//   }
//
//   /**
//    * 연동상태가 CONNECTED, SCRAPING 인지 여부
//    */
//   bool isStateConnectScrapping(LINK_TYPE type) {
//   if (type == LINK_TYPE.POS) {
//   return isPosConnection()
//   } else if (type == LINK_TYPE.CARD_ACCOUNT) {
//   return (crefiaStatus == DefLink.CONNECTED || crefiaStatus == DefLink.SCRAPING)&& crefiaConnectionType == "USER_ID"
//   } else if (type == LINK_TYPE.CREFIA) {
//   return (crefiaStatus == DefLink.CONNECTED || crefiaStatus == DefLink.SCRAPING)&& crefiaConnectionType == "OKPOS_ID"
//   } else if (type == LINK_TYPE.CREFIA_CARD_ACCOUNT) {
//   return crefiaStatus == DefLink.CONNECTED || crefiaStatus == DefLink.SCRAPING
//   } else if (type == LINK_TYPE.HOMETAX) {
//   return hometaxStatus == DefLink.CONNECTED || hometaxStatus == DefLink.SCRAPING
//   } else if (type == LINK_TYPE.BAEMIN) {
//   return baeminStatus == DefLink.CONNECTED || baeminStatus == DefLink.SCRAPING
//   } else if (type == LINK_TYPE.YOGIYO) {
//   return yogiyoStatus == DefLink.CONNECTED || yogiyoStatus == DefLink.SCRAPING
//   } else if (type == LINK_TYPE.COUPANG_EATS) {
//   return coupangeatsStatus == DefLink.CONNECTED || coupangeatsStatus == DefLink.SCRAPING
//   } else if (type == LINK_TYPE.DELIVERY) {
//   return isStateConnScrappingDeliveryApp()
//   } else if (type == LINK_TYPE.DELIVERY_MANAGER) {
//   return isOKGOConnection()
//   }
//   return false
//   }
//
//   /**
//    * 하나라도 연동 되었는지 여부
//    */
//   fun isConnectedAnyOne(): Boolean {
//   return crefiaStatus == DefLink.CONNECTED ||    // 여신
//   hometaxStatus == DefLink.CONNECTED ||  // 홈택스
//
//   baeminStatus == DefLink.CONNECTED ||   // 배민
//   yogiyoStatus == DefLink.CONNECTED ||   // 요기요
//   coupangeatsStatus == DefLink.CONNECTED // 쿠팡이츠
//   }
//
//   /**
//    * 하나라도 연동 되었는지 여부(SCRAPING)
//    */
//   fun isScrappingAnyOne(): Boolean {
//   return crefiaStatus == DefLink.SCRAPING ||    // 여신
//   hometaxStatus == DefLink.SCRAPING ||  // 홈택스
//
//   baeminStatus == DefLink.SCRAPING ||   // 배민
//   yogiyoStatus == DefLink.SCRAPING ||   // 요기요
//   coupangeatsStatus == DefLink.SCRAPING // 쿠팡이츠
//   }
//
//   /**
//    * 하나라도 연동 되었는지 여부(SCRAPING)
//    */
//   fun isConnectedScrappingAnyOne(): Boolean {
//   return isConnectedAnyOne() || isScrappingAnyOne()
//   }
//
//   /**
//    * POS연동상태
//    */
//   fun getStatusDescText(): Int {
//   if (connectionMethod == null)
//   return 0
//   return when (connectionMethod) {
//   "ASP" -> R.string.aspLinkConnect
//   "EASY", "QUICK" -> R.string.easyLinkConnect
//   "QR" -> R.string.posLinkConnect
//   "PLUS" -> R.string.plusConnect
//   else -> 0
//   }
//   }
//
//   /**
//    * POS연동상태
//    */
//   fun getStatusDescIcon(): Int {
//   if (connectionMethod == null)
//   return 0
//   return when (connectionMethod) {
//   "ASP" -> R.drawable.ico_connect_popup_id
//   "EASY", "QUICK" -> R.drawable.ico_connect_simple_id
//   "QR" -> R.drawable.ico_connect_barcode
//   "PLUS" -> R.drawable.ico_connect_okpos
//   else -> 0
//   }
//   }
//
//   fun getLinkState(type: LINK_TYPE): String {
//   when (type) {
//   LINK_TYPE.POS -> {
//   return if (posConnectionYn == 'Y') DefLink.CONNECTED else DefLink.NONE
//   }
//   LINK_TYPE.CREFIA,
//   LINK_TYPE.CARD_ACCOUNT,
//   LINK_TYPE.CREFIA_CARD_ACCOUNT-> {
//   return crefiaStatus
//   }
//   LINK_TYPE.HOMETAX -> {
//   return hometaxStatus
//   }
//   LINK_TYPE.BAEMIN -> {
//   return baeminStatus
//   }
//   LINK_TYPE.YOGIYO -> {
//   return yogiyoStatus
//   }
//   LINK_TYPE.COUPANG_EATS -> {
//   return coupangeatsStatus
//   }
//   LINK_TYPE.DELIVERY -> {
//   return if (baeminStatus == DefLink.CONNECTED
//   || yogiyoStatus == DefLink.CONNECTED
//   || coupangeatsStatus == DefLink.CONNECTED)
//   DefLink.CONNECTED
//   else
//   DefLink.NONE
//   }
//   else -> return DefLink.NONE
//   }
//   }
//
//   /**
//    * 연동상태가 NONE, DISCONNECTED인지 여부
//    */
//   fun isStateNoneAndDisconnected(state: String): Boolean {
//   return state == DefLink.NONE || state == DefLink.DISCONNECTED
//   }
//
//   /**
//    * 연동상태가 NONE, DISCONNECTED, PENDING 인지 여부
//    */
//   fun isStateNoneDisconnPending(state: String): Boolean {
//   return state == DefLink.NONE || state == DefLink.DISCONNECTED || state == DefLink.PENDING
//   }
//
//   /**
//    * 연동상태가 NONE, DISCONNECTED, PENDING 인지 여부
//    */
//   fun isStateNoneDisconnPending(type: LINK_TYPE): Boolean {
//   when (type) {
//   LINK_TYPE.POS -> {
//   return !isPosConnection()
//   }
//   LINK_TYPE.CREFIA -> {   // 여신협회
//   return (crefiaStatus == DefLink.NONE || crefiaStatus == DefLink.DISCONNECTED || crefiaStatus == DefLink.PENDING) && crefiaConnectionType == "USER_ID"
//   }
//   LINK_TYPE.CARD_ACCOUNT -> { // 카드계좌연동
//   return (crefiaStatus == DefLink.NONE || crefiaStatus == DefLink.DISCONNECTED || crefiaStatus == DefLink.PENDING) && crefiaConnectionType == "OKPOS_ID"
//   }
//   LINK_TYPE.CREFIA_CARD_ACCOUNT -> {  // 여신협회, 카드계좌연동 합쳐서
//   return (crefiaStatus == DefLink.NONE || crefiaStatus == DefLink.DISCONNECTED || crefiaStatus == DefLink.PENDING)
//   }
//   LINK_TYPE.HOMETAX -> {
//   return hometaxStatus == DefLink.NONE || hometaxStatus == DefLink.DISCONNECTED || hometaxStatus == DefLink.PENDING
//   }
//   LINK_TYPE.BAEMIN -> {
//   return baeminStatus == DefLink.NONE || baeminStatus == DefLink.DISCONNECTED || baeminStatus == DefLink.PENDING
//   }
//   LINK_TYPE.YOGIYO -> {
//   return yogiyoStatus == DefLink.NONE || yogiyoStatus == DefLink.DISCONNECTED || yogiyoStatus == DefLink.PENDING
//   }
//   LINK_TYPE.COUPANG_EATS -> {
//   return coupangeatsStatus == DefLink.NONE || coupangeatsStatus == DefLink.DISCONNECTED || coupangeatsStatus == DefLink.PENDING
//   }
//   LINK_TYPE.DELIVERY -> {
//   return isStateNoneDisconnPending(LINK_TYPE.BAEMIN)
//   || isStateNoneDisconnPending(LINK_TYPE.YOGIYO)
//   || isStateNoneDisconnPending(LINK_TYPE.COUPANG_EATS)
//   }
//   LINK_TYPE.BANK_ACCOUNT -> {
//   return bankStatusList.isEmpty()
//   }
//   LINK_TYPE.DELIVERY_MANAGER -> {
//   return !isOKGOConnection()
//   }
//   LINK_TYPE.NONE -> {
//   return false
//   }
//   }
//   }
//
//   /**
//    * 배달앱이 하나라도 연동(CONNECTED) 되었는지 여부
//    */
//   fun isStateConnectDeliveryApp(): Boolean {
// //        if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //            return false
//   return isStateDeliveryAppAnyOne(DefLink.CONNECTED)
//   }
//
//   /**
//    * 배달앱이 하나라도 연동(CONNECTED) 수집중(SCRAPING) 되었는지 여부
//    */
//   fun isStateConnScrappingDeliveryApp(): Boolean {
// //        if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //            return false
//   return isStateDeliveryAppAnyOne(DefLink.CONNECTED) ||
//   isStateDeliveryAppAnyOne(DefLink.SCRAPING)
//   }
//
//   /**
//    * 배달앱이 하나라도 수집중(SCRAPING)인지 여부
//    */
//   fun isStateScrappingDeliveryApp(): Boolean {
// //        if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //            return false
//   return baeminStatus == DefLink.SCRAPING ||
//   yogiyoStatus == DefLink.SCRAPING ||
//   coupangeatsStatus == DefLink.SCRAPING
//   }
//
//   /**
//    * 여신,홈택스 하나라도 인지 해당 상태인지 여부
//    */
//   fun isStateMDIAnyOne(state: String): Boolean {
//   return crefiaStatus == state ||
//   hometaxStatus == state
//   }
//
//   /**
//    * 여신,홈택스 하나라도 인지 해당 상태인지 여부
//    */
//   fun isStateMDIAnySame(state: String): Boolean {
//   return crefiaStatus == state &&
//   hometaxStatus == state
//   }
//
//   /**
//    * 배달앱이 하나라도 해당 상태인지 여부
//    */
//   fun isStateDeliveryAppAnyOne(state: String): Boolean {
// //        if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //            return false
//   return baeminStatus == state ||
//   yogiyoStatus == state ||
//   coupangeatsStatus == state
//   }
//
//   /**
//    * 배달앱이 하나라도 해당 상태인지 여부
//    */
//   fun isStateDeliveryAppSame(state: String): Boolean {
// //        if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //            return false
//   return baeminStatus == state &&
//   yogiyoStatus == state &&
//   coupangeatsStatus == state
//   }
//
//   /**
//    * 부가세 신고 자료 받기 화면
//    *
//    * 배달앱 하위 레이아웃 보여줄지 여부
//    * 1개라도 연동 된 경우 표시
//    */
//   fun isVisibleDeliverySubLayout(): Boolean {
//   return baeminStatus == DefLink.CONNECTED
//   || yogiyoStatus == DefLink.CONNECTED
//   || coupangeatsStatus == DefLink.CONNECTED
//   || baeminStatus == DefLink.PENDING
//   || yogiyoStatus == DefLink.PENDING
//   || coupangeatsStatus == DefLink.PENDING
//   }
//
//   fun getManagerRatingToText(): String {
//   return getManagerRatingToText(managerRating)
//   }
//
//   fun getManagerRatingToText(managerRating: String): String {
//   Log.i(TAG, "getManagerRatingToText: ${managerRating}")
//   return when(managerRating) {
//   ManagerRating.TOP -> {
//   "최고 관리자"
//   }
//   ManagerRating.GENERAL -> {
//   "일반 관리자"
//   }
//   ManagerRating.INVITEE -> {
//   "초대 관리자"
//   } else -> ""
//   }
//   }
//
//   /**
//    * 초대받은 관리자: INVITEE
//    */
//   fun isInviteeManager(): Boolean {
//   return managerRating == ManagerRating.INVITEE
//   }
//
//
//   /**
//    * 타입에 따른 연동 상태 확인
//    * NONE           // 미연동(한번도 연동한적 없는 상태) DISCONNECTED 와 동일한 상태
//    * DISCONNECTED   // 연동 해지(한번이라도 연동했던 상태) NONE 과 동일한 상태
//    * CONNECTED      // 연동 중
//    * PENDING        // 재연동 필요
//    * SCRAPING       // 수집 중
//    * */
//   fun checkState(type: LINK_TYPE, state: String): Boolean {
//   when (type) {
//   LINK_TYPE.POS -> {
//   // POS의 경우 CONNECTED 상태외에 체크외에 모두 false
//   if (state == DefLink.CONNECTED) {
//   return isPosConnection()
//   }
//   return false
//   }
//   LINK_TYPE.DELIVERY_MANAGER -> {
//   // 배달매니저 연동시
//   return if (state == DefLink.CONNECTED) {
//   isOKGOConnection()
//   } else {
//   false
//   }
//   }
//   LINK_TYPE.CARD_ACCOUNT -> { // 카드 가맹계좌 연동
//   return crefiaStatus == state && crefiaConnectionType == "OKPOS_ID"  // 카드 가맹 계좌정보 연동
//   }
//   LINK_TYPE.CREFIA, -> {  // 여신협회 연동
//   return crefiaStatus == state && crefiaConnectionType == "USER_ID"   // 여신협회 ID 연동
//   }
//   LINK_TYPE.CREFIA_CARD_ACCOUNT -> {     // 카드 가맹 계좌, 여신협회 연동 여부
//   return crefiaStatus == state
//   }
//   LINK_TYPE.HOMETAX -> {
//   return hometaxStatus == state
//   }
//   LINK_TYPE.BAEMIN -> {
// //                if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //                    return false
//   return baeminStatus == state
//   }
//   LINK_TYPE.YOGIYO -> {
// //                if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //                    return false
//   return yogiyoStatus == state
//   }
//   LINK_TYPE.COUPANG_EATS -> {
// //                if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //                    return false
//   return coupangeatsStatus == state
//   }
//   LINK_TYPE.DELIVERY -> {
// //                if (Define.IS_DELIVERY_VISIBLE)   // XXX 배달앱 가리기 위한 임시필드
// //                    return false
//   // 배달앱중 하나라도 해당 상태라면 true
//   return isStateDeliveryAppAnyOne(state)
//   }
//   LINK_TYPE.BANK_ACCOUNT -> {
//   // 은행계좌가 연동되었는지 여부
//   return if (state == DefLink.CONNECTED || state == DefLink.SCRAPING) {
//   bankStatusList.isNotEmpty()
//   } else {
//   bankStatusList.isEmpty()
//   }
//   }
//   else -> return false
//   }
//   }
//
//   /**
//    * 여신협회, 카드가맹계좌 연동 여부
//    */
//   fun isConnectScrappingCrefiaAndCardAccount(): Boolean {
//   return crefiaStatus == DefLink.CONNECTED || crefiaStatus == DefLink.SCRAPING
//   }
//
//   /**
//    * 해당 타입의 연동이 하나라도 되어있는지 여부
//    */
//   fun checkStateAnyone(type: LINK_TYPE, vararg states: String): Boolean {
//   states.forEach { state ->
//   if (checkState(type, state)) {
//   return true
//   }
//   }
//   return false
//   }
//
//   fun checkStates(state: String, vararg types: LINK_TYPE): Boolean {
//   types.forEach { type ->
//   if (!checkState(type, state))
//   return false
//   }
//   return true
//   }
//
//   /**
//    * 스토어 정보 출력
//    */
//   fun printInfo(tag: String = TAG) {
//   Log.i(tag, "storeData.storeId=${storeId}\n " +
//   "storeData.storeName=${storeName}\n " +
//   "storeData.storeOwnerName=${storeOwnerName}\n " +
//   "storeData.okposStoreYn=${okposStoreYn}\n " +
//   "storeData.connectionMethod=${connectionMethod}\n " +
//   "storeData.posConnectionYn=${posConnectionYn}\n " +
//   "storeData.baeminStatus=${baeminStatus}\n " +
//   "storeData.yogiyoStatus=${yogiyoStatus}\n " +
//   "storeData.coupangeatsStatus=${coupangeatsStatus}\n "+
//   "storeData.managerRating=${managerRating}\n",
//   )
//   }

//    /**
//     * 팝업 전문 내용으로 포스 연동 상태 구하기
//     * https://stmaapp.okpos.co.kr:8080/api/main/store/change/popup
//     */
//    fun getPosConnectState(): Int {
//        if (onlineYn == 'Y') {
//            return R.string.pos_useing
//        } else if (posConnectionYn == 'Y') {
//            return R.string.pos_offline
//        } else {
//            return R.string.pos_un_link
//        }
//    }

//    /**
//     * 연동상태가 NONE, DISCONNECTED인지 여부
//     */
//    fun isStateNoneAndDisconnected(state: String):Boolean {
//        return state == DefLink.NONE || state == DefLink.DISCONNECTED
//    }
}