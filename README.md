# DoubleWaves
一个正弦&amp;&amp;余弦波纹图

#创作来源
双十一买东西的时候突然发现淘宝的顶部有一个微小的动画效果，感觉很炫。
实现这个效果的方案就是在一个View上面添加两个View
一个是sin函数图，另一个是cos函数图

#使用方法
```objc
    DoubleWaves *doubleWaves = [[DoubleWaves alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 26)];
    [self.view addSubview:doubleWaves];
```
就是最简单的创建视图的方法就可以了。

