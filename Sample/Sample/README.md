# Sample Project

`xib 작업 방식 소개`

<br />

### 결과 화면

![xib-based](https://user-images.githubusercontent.com/61109660/148108973-7af33df3-a546-4ad4-9f11-1b6a95e9c29b.gif)

<br />

### 화면 단위를 Xib로 생성하는 방법

> 우리가 흔히 사용하던 storyboard 파일을 단순히 xib 파일로 만들어서 작업한다고 보면 된다.

> 하나의 화면(Scene or Screen)에 하나의 ViewController를 대응시킨다고 생각하자.

`ex`

1. ViewController와 Xib파일이 1:1 대응이 되도록 파일을 만들어 준다.  
(✅ Also Create XIB files에 반드시 체크할 것)

![스크린샷 2022-01-05 오전 3 55 09](https://user-images.githubusercontent.com/61109660/148109479-77837755-3858-4a1f-a7d2-0e90f8c6ccdf.png)![스크린샷 2022-01-05 오전 3 55 01](https://user-images.githubusercontent.com/61109660/148109487-a3a11855-a6be-4608-a318-7c0320b827d0.png)


2. 파일이 잘 생성되었는지 확인한다.  
(1번의 방법으로 화면을 만들었다면 생략해도 괜찮음)

```
File's Owner 클릭 후 - ViewController Class 연결 확인
File's Owner 클릭 후 - IBOutlets의 View 연결 확인
```

> 빨간색 박스를 잘 보자.

<img src = "https://user-images.githubusercontent.com/61109660/148110109-7654d455-a199-4c7a-8c02-cb2d50ea3772.png" width = "800" />
<img src = "https://user-images.githubusercontent.com/61109660/148110088-2e7a8b58-b5a5-447b-94dd-4cf302704cca.png" width = "800" />

<br />

### Xib 인스턴스를 생성하는 방법 (+ ✨ 화면 전환 시키는 방법)

> - ViewController 클래스 뒤에 .을 찍고 instanceFromNib()메서드를 호출한다.  
> - instanceFromNib()메서드는 원래 존재하는 메서드가 아니고 사용자 정의 메서드이다.  
> - 위의 메서드를 사용하기 위해서는 `import EasyKit`를 해준다.

```swift
// instanceFromNib()메서드 사용하기 위해서는 EasyKit을 import해준다.
import EasyKit

// ...

// MARK: - 인스턴스 생성

let firstViewController = FirstViewController.instanceFromNib()
let secondViewController = SecondViewController.instanceFromNib()

// ...

// MARK: - 화면 전환

@IBAction func transitionToSecondViewControllerDidTap(_ sender: Any) {
    let secondViewController = SecondViewController.instanceFromNib()
    navigationController?.pushViewController(secondViewController, animated: true)
}

@IBAction func transitionToThirdViewControllerDidTap(_ sender: Any) {
    let thirdViewController = ThirdViewController.instanceFromNib()
    self.present(thirdViewController, animated: true)
}
```

