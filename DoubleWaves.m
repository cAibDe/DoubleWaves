//
//  DoubleWaves.m
//  DoubleWaves
//
//  Created by cAibDe on 2016/12/21.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "DoubleWaves.h"

@interface DoubleWaves ()
@property (nonatomic,strong)CADisplayLink *firstWaveDisplayLink;

@property (nonatomic,strong)CAShapeLayer *firstWavesLayer;

@property (nonatomic,strong)UIColor *firstWavesColor;

@property (nonatomic,strong)CADisplayLink *secondWaveDisplayLink;

@property (nonatomic,strong)CAShapeLayer *secondWavesLayer;

@property (nonatomic,strong)UIColor *secondWavesColor;

@property (nonatomic,strong)UIView *sinView;

@property (nonatomic,strong)UIView *cosView;


@end

@implementation DoubleWaves
{
    CGFloat waveA;//水纹振幅
    CGFloat waveW ;//水纹周期
    CGFloat offsetX1; //位移
    CGFloat currentK; //当前波浪高度Y
    CGFloat offsetX2; //位移
    CGFloat wavesSpeed;//水纹速度
    CGFloat WavesWidth; //水纹宽度
}
- (UIView *)sinView{
    if (!_sinView) {
        _sinView = [[UIView alloc]initWithFrame:self.bounds];
        _sinView.alpha = 0.6;
    }
    return _sinView;
}
- (UIView *)cosView{
    if (!_cosView) {
        _cosView = [[UIView alloc]initWithFrame:self.frame];
        _cosView.alpha = 0.6;
    }
    return _cosView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.sinView];
        [self addSubview:self.cosView];
        [self setUpFirstWave];
        [self setUpSecondWave];

    }
    return self;
}
- (void)setUpSecondWave{
    
    //设置波浪的宽度
    WavesWidth = self.frame.size.width;
    
    //第二个波浪颜色
    self.secondWavesColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    
    //设置波浪的速度
    wavesSpeed = 1/M_PI;
    
    //初始化layer
    if (self.secondWavesLayer == nil) {
        
        //初始化
        self.secondWavesLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.secondWavesLayer.fillColor = self.secondWavesColor.CGColor;
        //设置边缘线的颜色
        //_firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        //self.firstWavesLayer.lineWidth = 1.0;
        //        self.firstWavesLayer.strokeStart = 0.0;
        //        self.firstWavesLayer.strokeEnd = 0.8;
        
        [self.cosView.layer addSublayer:self.secondWavesLayer];
    }
    
    
    //同正弦函数相同,无交错效果
    wavesSpeed = 0.02;
    //设置振幅
    waveA = 12;
    //设置周期
    waveW = 0.5/30.0;
    
    //同正弦函数不同,会有交错效果
    //设置波浪流动速度
    //    wavesSpeed = 0.04;
    //    //设置振幅
    //    waveA = 13;
    //    //设置周期
    //    waveW = 0.5/30.0;
    
    
    //设置波浪纵向位置
    currentK = self.frame.size.height/2;//屏幕居中
    
    //启动定时器
    self.secondWaveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getSecondWave:)];
    
    [self.secondWaveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
-(void)getSecondWave:(CADisplayLink *)displayLink{
    
    //实时的位移
    //实时的位移
    offsetX2 += wavesSpeed;
    
    [self setSecondWaveLayerPath];
}
-(void)setSecondWaveLayerPath{
    
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (NSInteger i =0.0f; i<=WavesWidth; i++) {
        //余弦函数波浪公式
        y = waveA * cos(waveW*i + offsetX2)+currentK;
        
        //如果需要正弦函数的峰顶和余弦函数的峰底对应,可以替换成下方公式均可
        //y = waveA * cos(waveW*i + offsetX+M_PI_2)+currentK;
        
        //y = waveA * sin(-(waveW*i + offsetX))+currentK;
        
        //将点连成线
        CGPathAddLineToPoint(path, nil, i, y);
    }
    
    CGPathAddLineToPoint(path, nil, WavesWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    self.secondWavesLayer.path = path;
    
    //使用layer 而没用CurrentContext
    CGPathRelease(path);
    
}



- (void)setUpFirstWave{
    
    //设置波浪的宽度
    WavesWidth = self.frame.size.width;
    
    //第一个波浪颜色
    self.firstWavesColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
    
    //设置波浪的速度
    wavesSpeed = 1/M_PI;
    
    //初始化layer
    if (self.firstWavesLayer == nil) {
        
        //初始化
        self.firstWavesLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.firstWavesLayer.fillColor = self.firstWavesColor.CGColor;
        //设置边缘线的颜色
        //_firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        //self.firstWavesLayer.lineWidth = 1.0;
        //        self.firstWavesLayer.strokeStart = 0.0;
        //        self.firstWavesLayer.strokeEnd = 0.8;
        
        [self.sinView.layer addSublayer:self.firstWavesLayer];
    }
    
    
    //设置波浪流动速度
    wavesSpeed = 0.02;
    //设置振幅
    waveA = 12;
    //设置周期
    waveW = 0.5/30.0;
    
    //设置波浪纵向位置
    currentK = self.frame.size.height/2;//屏幕居中
    
    //启动定时器
    self.firstWaveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getFirstWave:)];
    
    [self.firstWaveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)getFirstWave:(CADisplayLink *)displayLink{
    
    //实时的位移
    //实时的位移
    offsetX1 += wavesSpeed;
    
    [self setFirstWaveLayerPath];
}

-(void)setFirstWaveLayerPath{
    
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (NSInteger i =0.0f; i<=WavesWidth; i++) {
        //正弦函数波浪公式
        y = waveA * sin(waveW * i+ offsetX1)+currentK;
        
        //将点连成线
        CGPathAddLineToPoint(path, nil, i, y);
    }
    
    CGPathAddLineToPoint(path, nil, WavesWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    self.firstWavesLayer.path = path;
    
    //使用layer 而没用CurrentContext
    CGPathRelease(path);
    
}


-(void)dealloc
{
    [self.firstWaveDisplayLink invalidate];
    [self.secondWaveDisplayLink invalidate];
}

@end
