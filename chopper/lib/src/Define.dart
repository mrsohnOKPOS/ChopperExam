class DefLink {

/**
 * 연동상태
 */
// crefiaStatus, hometaxStatus, baeminStatus, yogiyoStatus, coupangeatsStatus
static var NONE = 'NONE';                   // 미연동(한번도 연동한적 없는 상태) DISCONNECTED 와 동일한 상태
static var DISCONNECTED = 'DISCONNECTED';   // 연동 해지(한번이라도 연동했던 상태) NONE 과 동일한 상태
static var CONNECTED = 'CONNECTED';         // 연동 중
static var PENDING = 'PENDING';             // 재연동 필요
static var SCRAPING = 'SCRAPING';           // 수집 중
static var RECONNECTED = 'RECONNECTED';           //
}

/**
 * 포스, 여신협회, 홈택스, 배민, 요기요, 쿠팡이츠 구분을 위한 enum
 */
// enum LINK_TYPE implements Comparable<Vehicle> {
//
//
//   const Vehicle({
//     required this.tires,
//     required this.passengers
// });
// }

enum LINK_TYPE {
  NONE(name: '', code: ''),                               // 없음
  POS(name: "포스", code: ''),                           // 포스
  DELIVERY_MANAGER(name: '배달매니저', code: ''),         // 배달매니저
  CREFIA(name: '여신협회', code: ''),                     // 여신협회
  CARD_ACCOUNT(name: '카드가맹계좌정보', code: ''),        // 카드가맹계좌정보
  CREFIA_CARD_ACCOUNT(name: '카드, 카드가맹정보', code: ''),// 카드가맹계좌정보
  HOMETAX(name: '홈택스', code: ''),                      // 홈택스
  BAEMIN(name: '배달의민족', code: "BAE-MIN"),              // 배달의민족
  YOGIYO(name: '요기요', code: 'YOGIYO'),                 // 요기요
  COUPANG_EATS(name: '쿠팡이츠', code: 'COUPANGEATS'),    // 쿠팡이츠
  DELIVERY(name: '배달앱', code: ''),                    // 배달앱 전부 처리 할때
  BANK_ACCOUNT(name: '계좌연동', code: '');             // 계좌연동

  const LINK_TYPE({
    required this.name,
    required this.code,
  });

  final String name;
  final String code;

}
