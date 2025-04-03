# SolidityConcepts2: Vault & Bank Contracts

이 프로젝트는 Solidity 스마트 컨트랙트 실습을 위한 예제로, `Vault`와 `Bank`라는 두 개의 계약을 통해 Solidity의 주요 개념을 종합적으로 다룹니다.

---

## 🔐 Vault Contract

`Vault`는 이더 입금, 블록 정보 확인, 호출자 정보 조회, 가스 사용량 측정, 문자열 해시 생성 등의 기능을 제공합니다.

### ✅ 주요 기능

| 기능 | 설명 |
|------|------|
| `owner` | 배포자 주소를 저장하는 상태 변수 |
| `sentValue` | `deposit()` 함수 호출 시 전송된 이더 양 저장 |
| `timestamp` | `deposit()` 호출 시점의 블록 생성 시간 |
| `gasUsed` | `trackGasUsage()` 호출 시 계산된 가스 소비량 |
| `deposit()` | 이더를 전송하며 관련 정보 저장, 0이하 전송 시 예외 발생 |
| `getCaller()` | `msg.sender` 반환 |
| `getOrigin()` | `tx.origin` 반환 |
| `getBlockDetails()` | 현재 블록 번호, 난수, 가스한도, 채굴자 주소 반환 |
| `trackGasUsage()` | `gasleft()` 사용해 가스 사용량 측정 |
| `generateHash(string)` | 입력 문자열에 대한 keccak256 해시값 반환 |

---

## 🏦 Bank Contract

`Bank`는 `Vault`를 상속하여 입금된 금액에 대해 소유자만 출금할 수 있도록 제어 기능을 확장합니다.

### ✅ 주요 기능

| 기능 | 설명 |
|------|------|
| `withdraw(uint256)` | 소유자만 호출 가능, `sentValue`에서 차감 후 이더 전송 |
| `onlyOwner` | `owner`만 함수 호출 가능하도록 제한하는 modifier |
| `Withdrawn` | 출금 시 발생하는 이벤트 (`user`, `amount`) 포함 |

---

## 🧪 테스트 실행 방법

```bash
npm install
npx hardhat test
npx hardhat test test/Vault.test.ts
npx hardhat test test/Bank.test.ts
```

---

## 📁 디렉토리 구조

```
contracts/
├── Vault.sol
└── Bank.sol
test/
├── Vault.test.ts
└── Bank.test.ts
README.md
```

---

이 프로젝트는 Solidity에서 실무에 필요한 스마트 컨트랙트 작성 능력을 기르기 위한 실습 프로젝트입니다. 상속, 접근 제어, 예외 처리, 이벤트, 블록 정보 등 고급 개념을 포함하고 있습니다.
