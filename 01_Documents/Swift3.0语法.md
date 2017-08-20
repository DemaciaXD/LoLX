#Swift 3.0 语法
---
**开发中遇到的语法笔记：**

1. [fileprivate][] 与 [private][] 
	- `fileprivate` 显式的表明，这个元素的访问权限为文件内私有。
	- `private` 真正的私有，离开了这个类或者结构体的作用域外面就无法访问。

[fileprivate]: http://macdown.uranusjr.com 
[private]: http://macdown.uranusjr.com 

2. [open][] 与 [public][]
	- `open `
		- 这个元素可以在其他作用域被访问。
		- 这个元素可以在其他作用域被继承或者override。
	- `public`
		- 这个元素在其他作用域不能被继承的，只能被访问。

[open]: http://macdown.uranusjr.com 
[public]: http://macdown.uranusjr.com 