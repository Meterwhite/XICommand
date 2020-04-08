# Xcode interface command
## Introduction
- Xcode interface command .The core function is to support the dark mode through the XIB file.The user will call the specified function when naming the IBOutlet property in the specified format.This format is like the command line.Because of the interface-oriented programming, all developers can easily add plug-ins to support more functions.Not only supports iOS, most functions support macOS.Because it is based on runtime coding, this project uses objective-c.But the Swift project is no problem to use.This project uses the method of dynamically loading plugins, so it does not depend on any third-party libraries. Please use cocoapods or other methods to import third-party libraries to support the specified plug-in function.

- Xcode interface command d的核心功能是通过XIB文件适配夜间模式，用户在以指定格式命名IBOutlet属性时将触发特殊功能，这种格式类似于命令行。因为是面向接口的编程 ，所有开发人员都可以轻松添加插件以支持更多功能。支持iOS为主，支持macOS为辅。因为基于runtime编码所以本项目采用objective-c,但Swift项目使用起来也没问题。本项目采用动态加载插件的方法，所以不依赖任何三方。请使用cocoapods或其他方法导入三方以支持指定插件的功能。
---
## CocoaPods
```
pod 'XICommand'
```

## Usage 用法
### Examples 案例
```objc
//Support for dark mode.适配夜间模式。
● @property (weak, nonatomic) IBOutlet UILabel  *dkdo_bg_0XFFFFFF_0X000000;
//Set border color and border width.设置边框颜色和宽度。
● @property (weak, nonatomic) IBOutlet UIButton *sudo_border_0XCCCCCC_1p5;
```

### Command rule
- Basic rule : Command + option + args;(基础规则)
   - Use '_' to connect each item;(用下划线'_'来连接每一项)
   - args is optional;(args是可选的)
   
### Document
- `XICDocument.h` file provides all API queries, and developers can even get API tips by xcode.
- `XICDocument.h` 文件提供所有API查询，开发者也可以通过编码提示查询API。 
   
---

### DKNightVersion plug-ins usage 使用插件
- Supporting Dark Mode. Currently this feature is provided by [DKNightVersion](https://github.com/draveness/DKNightVersion).So import first.
- 当前适配夜间模式功能由[DKNightVersion](https://github.com/draveness/DKNightVersion)提供，使用先导入。

### Default plug-ins usage(默认插件)
- The project's default plugin provides less functionality.(较少功能)
---
## Common problem(常见问题)
- Number format(数字格式) : The letter 'p' replaces the decimal point '.'(字母'p'代替小数点'.')
   - 3.14 -> 3p14 
- Color format(颜色格式) : Hexadecimal color value,Hexadecimal color value, ‘0X’ prefix is optional, and both upper and lower case are supported.(十六进制颜色值，‘0X’前缀是可选，大小写都支持)
- How to solve duplicate outlet names?(连线命名重复?)
   - The extra '_' can avoid duplicate naming : sudo_...option;(添加多余的下划线)
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
## Plug-in development
1. Implement all protocols in the 'XICProtocols.h' file.(实现XICProtocols.h文件中的协议)
2. Edit the 'XICDocument.h' file to supplement the interface document.(在XICDocument.h补充接口文档)

## Author
- It is hoped that developers will output code to this project and provide magical functions to XIB. Any questions and feedback please push an issue in github.
- 开发者们请向这个项目输出开源代码，并为XIB提供神奇的功能。任何问题和反馈请在github推送issue.
