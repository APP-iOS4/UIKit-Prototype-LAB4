# SwiftView 소개
**※ ProtoType 디렉토리 안 프로젝트로 데모를 진행합니다.**<br><br>

안녕하세요! LAB 4조 입니다. 🙌 <br><br>

### 저희 조는요.
* 태훈님, 성민님, 선준님, 우석님, 윤호님으로 구성되어 있습니다.
* OTT 앱으로 Prototype을 만들기로 했어요.
* 각자 ViewController를 1개씩 맡아서 작업 후 병합하는 방식으로 진행했습니다.<br>

### SwiftView 는요.
* 드라마나 영화 시리즈를 쉽게 찾아볼 수 있는 OTT 서비스 앱 이에요!
* 어느 날, 해리포터가 보고 싶어서 OTT에 검색을 했어요. 쭉 시리즈가 나오는데 스토리 순서를 모르겠더라구요!!
그래서 따로 인터넷에 들어가 해리포터 시리즈 검색을 해야했죠...😿
<br><br>

* **특징 1️⃣ 사용자 검색 기록, 시청 기록을 참고한 맞춤형 컨텐츠 추천 시스템!**<br>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/fc832989-c506-4864-b004-e0027adad4d3" width="30%"></img>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/1984cec7-017a-45b1-9b1c-66c28542b785" width="30%"></img>
<br><br>

* **특징 2️⃣ '카테고리' 탭을 만들어 여러분의 취향에 맞는 드라마나 영화를 쉽게 찾을 수 있습니다!**<br>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/be3a99fe-35d9-44df-8001-2f3dbbc5a355" width="30%"></img>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/215b7715-60a9-4f19-b712-49df9b36a129" width="30%"></img><br><br>

<br>

* **특징 3️⃣ '내 기록' 탭을 만들어 여러분이 보다 말았던 작품에 바로 접근할 수 있도록 하였습니다!**<br>
  - O플릭스의 경우 '나의 O플릭스'의 접근성이 예고편 보기 위주로 되어있는 점을 참고하여,<br>
  - 유O브를 벤치마킹 하여 사용자가 이전에 본 컨텐츠에 손쉽게 접근할 수 있습니다!!<br>
 
|O플릭스|SwiftView|
|:---:|:---:|
|<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/4879090d-18b0-4348-8a3a-7f00f8b8f06a" width="70%"></img>|<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/37f7812e-2330-47b2-8a0b-802d8d7dc41c" width="65%"></img>|

<br>

* **특징 4️⃣ '검색' 탭을 통해 여러분이 찾고자 하는 컨텐츠를 검색할 수 있습니다!**<br>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/d84c5ebd-3fc5-4a93-9465-1d7d8354312f" width="30%"></img>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/939dabc9-005f-44dc-a39a-902da33a6677" width="30%"></img><br><br>

* **특징 5️⃣ 현재 시청 중인 컨텐츠를 볼 수 있습니다.**<br>
  - 아래 '정주행 순서'를 통해 컨텐츠를 손쉽게 정주행 하실 수 있습니다!<br>
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB4/assets/101854288/e5db3eaa-135b-407f-9473-f7ff88c5f6b5" width="30%" ></img>


<br><br>


# App Define Statements
OTT를 시청하는 이용자가<br>
작품의 시리즈를 따로 검색할 필요 없이 앱 내의 검색 기능을 통해 시리즈 정보를 바로 제공해주고,<br>
보다만 작품에 빠르게 접근할 수 있는 OTT 앱<br><br><br>

# SwiftView 데모 시나리오
**※ ProtoType 디렉토리 안 프로젝트로 데모를 진행합니다.**
1. 홈 탭에서 *해리포터 마법사의 돌* 컨텐츠 선택 → 바로 컨텐츠 시청 가능
2. Back 버튼을 눌러 다시 홈으로 이동
3. '검색' 탭 선택 → 검색창에 *Harry Potter* 검색(상단 검색 버튼이나 return 키를 누르세요)
4. 해리포터 스토리 정주행 확인 후 *해리포터 마법사의 돌* 컨텐츠 선택 → 컨텐츠 시청 가능
5. '내 기록' 탭 선택 → 보다만 컨텐츠 확인 가능<br><br><br>

# 미구현된 목표
* 드라마나 영화 컨텐츠만이 아닌 다양한 미디어 컨텐츠 확보
* 드라마나 영화 컨텐츠 정보(시리즈 순서 등)를 담고 있는 Model을 구현하기<br><br><br>

# 테스트 환경
* **iOS Version: 17.2**<br>
* **테스트 기종: iPhone 15 Pro Simulator**<br>

<br><br>


긴 글 읽어주셔서 감사합니다.<br>
SwiftView 많이 이용해주세요.(ㅡㅡ)
