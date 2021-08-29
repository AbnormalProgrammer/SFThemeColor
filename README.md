# SFThemeColor
这是一个可以根据主题类型不同动态切换颜色的库
## 示例
![示例](https://github.com/AbnormalProgrammer/SFThemeColor/raw/main/resources/demo.gif)
## 它是什么？
能够动态切换颜色的一个库，可以实现颜色的变化与UI控件无关，一次编写动态变换颜色。
## 它有什么用？
我们常常遇到在某个APP中需要动态转换主题，需要切换另一套颜色，这个库就是用来实现这个功能的。
## 它的需求背景是什么？
APP需要动态转换主题。
## 行为表现
动态颜色通过闭包回调对UI控件的颜色属性进行设置。目前它回调的是颜色字符串，它并不针对UI控件特定颜色属性，所以只能传颜色。本来相传UIColor的，但是我觉得传个hex更好，因为用法灵活多样。
## 缺点
它会形成循环引用，因此，你必须要使用weak引用来解决这一问题。<\br>
目前我还没想到一个比较好的方法来解决此问题。
1. 语法糖解决此问题，免去每次写weak的烦恼，但是没找到语法糖。
2. 想用持久化对象来控制主题颜色对象的生命周期，但是UI控件的强引用循环无法解决。
## 如何使用？
请看下面的代码：<br>
```
override func viewDidLoad() {
    super.viewDidLoad()
    let testView:TestView = TestView.init()
    testView.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
    self.view.addSubview(testView)
    weak var weakTestView = testView
    testView.tc.color1.makeColor {weakTestView?.backgroundColor = UIColor.colorFromHex($0)}
    // Do any additional setup after loading the view.
}
```
源代码在Sources文件夹里面，请自行取用。
## 注意事项
一定要用弱引用，不然就内存泄漏了。
## 适用环境
iOS 14.5及以上
<br>swift 5.0
<br>XCode 12
## 联系方式
我的profile里面有联系方式
## 许可证
本控件遵循MIT许可，详情请见[LICENSE](https://github.com/AbnormalProgrammer/SFThemeColor/blob/main/LICENSE)。
