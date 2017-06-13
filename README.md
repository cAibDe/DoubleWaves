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

#参数
    CGFloat waveA;//水纹振幅
    CGFloat waveW ;//水纹周期
    CGFloat offsetX1; //位移
    CGFloat currentK; //当前波浪高度Y
    CGFloat offsetX2; //位移
    CGFloat wavesSpeed;//水纹速度
    CGFloat WavesWidth; //水纹宽度
可以根据自己项目的需求，去调整相应的参数，实现相应的效果。

#更新
对于懒加载的cosView 有一点小小的bug 但是已经更新
