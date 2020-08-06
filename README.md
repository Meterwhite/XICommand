# XML interface command
##### Let xib execute the command line
+ [Introduction](#Introduction)
+ [CocoaPods](#CocoaPods)
+ [Usage使用](#Usage)
   + [Window command窗口命令](#Window_command)
   + [IBOutlets command连线命令](#IBOutlets_command)
+ [Command rule命令规则](#Command_rule)
+ [Document文档](#Document)
+ [Plug-ins usage使用插件](#Plug-ins_usage)
   + [DKNightVersion](#DKNightVersion)
   + [Default](#Default)
+ [Common problem常见问题](#Common_problem)
   + [Number format?](#Common_problem)
   + [Color format?](#Common_problem)
   + [How to solve duplicate outlet names?](#Common_problem)
   + [How to rename IBOutlet or IBOutletCollection?](#Common_problem)
   + [Impact on program performance?](#Common_problem)
+ [Development of new plugins开发插件](#Development)
+ [Help it](#Help_it)


## <a id="Introduction"></a> Introduction
- Xcode interface command .The unique function is to support the `dark mode` through the `XIB` file. The user will trigger a special function when using the specified format on the XIB file.This format is like the command line.Because of the interface-oriented programming, all developers can easily add `plug-ins` to support more functions.Not only supports `iOS`, most functions support `macOS`.The project uses `objective-c` or `swift` is no problem.This project uses the method of dynamically loading plugins, so it does not depend on any third-party libraries. Please use cocoapods or other methods to import third-party libraries to support the specified plug-in function.

> Xcode interface command 的独特功能是通过`XIB`文件适配`夜间模式`，用户在XIB文件上使用指定格式时将触发特殊功能，这种格式类似于命令行。因为是面向接口的编程 ，所有开发人员都可以轻松添加插件以支持更多功能。支持iOS为主，macOS为辅。项目使用objective-c或者swift皆为无恙。本项目采用动态加载插件，故不依赖其他三方。请使用cocoapods或其他方法导入三方以支持指定插件的功能。

## How to solve the pain points that Xcode's built-in visual programming means are not enough?
- XIC uses IBOutlet as a command line to expand XIC's edit items. Just as the command line is a program corresponding to a command, the command subordinate has multiple options. XIC is a plug-in corresponding to a command, and the command subordinate has multiple options. Therefore, the functional scalability of XIC is unlimited.

> 如何解决Xcode内置可视化编程手段不够多的痛点？
>> XIC天马行空的将IBOutlet作为命令行来扩展XIC的编辑项。正如命令行是一种程序对应一种命令，命令下级有多个option。XIC是一种插件对应一种命令，命令下级有多种option。因此XIC的功能扩展性是无限制的。
---
## <a id="CocoaPods"></a> CocoaPods
```
pod 'XICommand'
```

## <a id="Usage"></a> Usage 用法
### <a id="Window_command"></a> Examples for Window command 窗口命令案例
![](https://github.com/Meterwhite/XICommand/blob/master/XICWinCmd.png)
1. Select control or controller
2. Open : Xcode->Attributes inspector(`Option + Commnd + 0`)
3. Enter the command to CMDWindow

###  <a id="IBOutlets_command"></a>Examples for IBOutlets command 连线命令案例
##### objective-c
```objc
//Support for dark mode(DKNightVersion plug-ins).适配夜间模式。
● @property (weak, nonatomic) IBOutlet UILabel  *dkdo_bg_0XFFFFFF_0X000000;
//Set border color and border width.设置边框颜色和宽度。
● @property (weak, nonatomic) IBOutlet UIButton *sudo_border_0XCCCCCC_1p5;
```
##### swift
```swift
//Support for dark mode(DKNightVersion plug-ins).适配夜间模式。
● @IBOutlet weak var dkdo_bg_0XFFFFFF_0X000000: UILabel!
//Set border color and border width.设置边框颜色和宽度。
● @IBOutlet weak var sudo_border_0XCCCCCC_1p5: UIButton!
```

### <a id="Command_rule"></a> Command rule
- Basic rule : Command + option + args;(基础规则)
- args is optional;(args是可选的)
   - Window command rule: Use space to connect each item;(用空格来连接每一项)
      - sudo corner 5.00
      - dkdo bg 0XF2F2F2 2E2E2E 0xeCeCeC
   - IBOutlets rule: Use `_` to connect each item;(用下划线`_`来连接每一项)
      - sudo_corner_5p00
      - dkdo_bg_0XF2F2F2_2E2E2E_0xeCeCeC
   
### <a id="Document"></a> Document
- `XICDocument.h` file provides all API queries, and developers can even get API tips by xcode.
> `XICDocument.h` 文件提供所有API查询，开发者也可以通过编码提示查询API。 
   
---
<a id="plug-ins_usage"></a>
### <a id="DKNightVersion"></a> DKNightVersion plug-ins usage(使用插件)
- Supporting Dark Mode. Currently this feature is provided by [DKNightVersion](https://github.com/draveness/DKNightVersion).So import first.
> (当前适配夜间模式功能由[DKNightVersion](https://github.com/draveness/DKNightVersion)提供，使用先导入。)

### <a id="Default"></a> Default plug-ins usage(默认插件)
- The project's default plugin provides less functionality.(提供较少功能)
---
## <a id="Common_problem"></a> Common problem(常见问题)
- Enter a line break in CMDWindow?(窗口输入换行): `Option + Return`(Also supports "Ctrl + Return")
- Number format?(数字格式) : The letter 'p' replaces the decimal point '.'(字母'p'代替小数点'.')
   - 3.14 -> 3p14 
- Color format?(颜色格式) : Hexadecimal color value,Hexadecimal color value, ‘0X’ prefix is optional, and both upper and lower case are supported.(十六进制颜色值，‘0X’前缀是可选，大小写都支持)
- How to solve duplicate outlet names?(连线命名重复?)
   - The extra `_` can avoid duplicate naming : sudo_...option;(添加多余的下划线)
   - Use `IBOutletCollection` to connect controls.(用`IBOutletCollection`连线)
- How to rename IBOutlet or IBOutletCollection?(怎么重命名连线?)
   1. Navigate to outlet in the header file. @property (weak, nonatomic) IBOutlet UIButton *btnRequestCode;
   2. Right click on outlet, select "Refactor > Rename...".
   3. Change the outlet name.
   4. Select the "Rename" button or the Enter key.
- Impact on program performance?(对程序性能的影响？)
   - The impact is almost inaudible.(影响不可见)
   - High performance cache determines the time complexity is O (1).(高性能的缓存决定时间复杂度为O(1))
   - The function call stack is optimized.(函数调用栈被优化了)
---
## <a id="Development"></a> Development of new plugins(开发新插件)
1. Implement all protocols in the 'XICProtocols.h' file.(实现XICProtocols.h文件中的协议)
2. Edit the 'XICDocument.h' file to supplement the interface document.(在XICDocument.h补充接口文档)
![](https://github.com/Meterwhite/XICommand/blob/master/XICStructure.png)

## <a id="Help_it"></a>Help this open source project XIC.(请助力开源项目XIC.)
1. Please `fork` and `star` this project. (请fork和star)
2. Output code to this project and provide magical functions to `XIB`.(向这个项目输出开源代码) 
3. Push your code.(推送你的开源代码)
4. Any questions and feedback please push an issue in github.(任何问题和反馈请在github推送issue.)
