# 🍏 세리의 BoostCourseiOS 프로젝트 !

## BoostCourseiOS 소개

크게 5가지의 프로젝트를 통해서 전반적인 iOS 프로그래밍에 대해 배우는 강의이다. 이 강의를 수강하고, 프로젝트들을 실습하면서 얻은 지식들을 readme와 wiki에 기록하려한다. readme는 TIL(Today I Learned)로 활용할 것이며, wiki는 나중에 보기 쉽게 포스팅 하려는 용도로 활용할 것이다. 

## BoostCourseiOS 프로젝트의 conventions

협업을 할 때마다, 컨벤션의 중요성을 느끼고 있다. 따라서 일단 git/github Convention을 정의하고 지키려한다. 또한 SunFlower_CloneCoding 프로젝트를 진행하면서, SunFlower에서 사용된 coding Convention에 대해서도 차차 정리해보려한다. 

### commit convention

> [Add Codes] - 새로운 코드를 추가했을 경우

> [Refactor Codes] - 기존에 작성한 코드를 수정했을 경우

> [Implement Features] - 새로운 기능을 추가하거나 완성했을 경우

> [Fix Bugs] - 오류를 해결했을 경우

> [Docs] - readme, wiki 작성한 경우

> [Create UI] - 새로운 UI 파일을 생성했을 경우

> [Chore] - 동작에 영향을 주는 코드 변경 없는 변경사항 (주석, 정렬 등등)

<br/>

### Branch

> 각 브랜치로 각각의 프로젝들을 관리, 완성되면 master에 merge !!

![IMG_4A355D3E4438-1](https://user-images.githubusercontent.com/59532818/90221418-25697780-de45-11ea-94c3-f9053b90b9e0.jpeg)

### coding convention

> 추후 업데이트 ...

<br/>

### foldering

> 추후 업데이트 ...

<br/>

## MusicPlayer 프로젝트 TIL(Today I Learned)

### 🌿 2020/08/14 월

- XCode에서 각각의 브랜치 및 프로젝트를 생성해서 리모트에 올려두었다. 그 과정에서 불필요한 파일들도 같이 푸쉬되었는데, gitignore로 충돌을 예방할 수 있다고 한다.
- [https://www.toptal.com/developers/gitignore/api/macos,swift,xcode](https://www.toptal.com/developers/gitignore/api/macos,swift,xcode)

### 🌿 2020/08/14 월

- 에셋 카탈로그(Asset Catalog)란 Asstes.xcassets 폴더를 부르는 명칭이다. 이 폴더에서 애플리케이션에 사용될 다양한 에셋을 관리한다. 이는 에셋과 다양한 디바이스의 속성(디바이스의 특징, 사이즈 클래스, 주문형 리소스, 특정 타입 등)에 대한 파일의 연결을(mapping) 통해서 애플리케이션 리소스(이미지, 음악 등)에 쉽게 접근할 수 있도록 도와줍니다.
    - 에셋 카탈로그의 구성 3가지

    > Folders: 폴더 이름에 에셋 타입의 확장자가 들어간다.

    > JSON files: 속성에 대한 정보

    > Content files : 리소스

- 앱 시닝(App Thinning)이란 애플리케이션이 디바이스에 설치될 때 앱 스토어와 운영체제가 그 디바이스의 특성에 맞게 설치하도록 하는 설치 최적화 기술으로, 설치용량을 최소화하고 다운로드의 속도를 향상시킨다는 장점이 있다.
    - 앱 시닝(App Thinning)의 구성 3가지

    > 슬라이싱(slicing)

    > 비트코드(bitcode)

    > 주문형 리소스(on-demand resource)

- 슬라이싱(slicing)이란 애플리케이션이 지원하는 다양한 디바이스에 대한 여러 조각의 애플리케이션 번들(app bundle)을 생성하고 디바이스에 알맞은 조각을 전달하는 기술으로, 개발자가 iTunes Connect에 올린 에플리케이션의 전체 버전을, 앱 스토어가 각 디바이스에 최적화된 버전의 조각으로 생성하는 것이다. 앱 시닝의 기술 중 하나이다.

### 🌿 2020/08/20 목

- 인터페이스 빌더로 화면을 구성해보고, 인터페이스 빌더의 객체를 코드와 연결해보았다. (IBOutlet)

![IMG_0219B9AF2F49-1](https://user-images.githubusercontent.com/59532818/90746300-6f51d200-e30b-11ea-8685-299afba09190.jpeg)

- 인터페이스 빌더란 쉽게 말해서 .storyboard로 끝나는 파일들이다. *이는 마치 안드로이드의 xml 파일들에 해당하는 것 같다.* 이 인터페이스 빌더를 통해 화면을 구성할 수 있다.
    - 작업 영역: Main.storyBoard
    - 오브젝트 라이브러리에서 특정 객체(버튼, 레이블, 슬라이드 바 등등)를 선택하여 하면에 추가할 수 있다.
    - 또한 해당 객체들의 속성을 변경하여 이름, 색상, 글꼴 등등을 설정할 수 있고, 에셋을 이미지로 설정할 수 있다.
- @IBOutlet 모디파이어를 통해 인터페이스 빌더로 만들 화면, 그 화면 속의 객체들을 코드와 연결시킬 수 있다. 방법은 크게 3가지이다. *이 과정은 마치 안드로이드의 inflate하는 과정에 해당하는 것 같다*.
    - 작업 영역: ViewController.swift
    - 코드로 먼저 IBOutlet을 생성한 후 인터페이스 빌더의 Outlet Inspector를 통해 연결
    - 코드로 먼저 IBOutlet을 생성한 후 인터페이스 빌더에서 View Controller 우클릭 후 팝업에서 연결
    - 인터페이스 빌더에서 코드로 끌어당겨 연결
- 주의 사항으로는, 이 연결 작업 후 프로퍼티의 이름을 변경하면 연결 정보가 깨진다. 따라서 아래 방법으로 이름을 변경해야한다.
    - refactor > rename

        ![https://user-images.githubusercontent.com/59532818/90746242-6b25b480-e30b-11ea-8a2d-8a8451a22352.png](https://user-images.githubusercontent.com/59532818/90746242-6b25b480-e30b-11ea-8a2d-8a8451a22352.png)

    - 이름 변경 후, 다시 연결 작업
