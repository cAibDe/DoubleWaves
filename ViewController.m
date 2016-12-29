//
//  ViewController.m
//  DoubleWaves
//
//  Created by cAibDe on 2016/12/21.
//  Copyright © 2016年 cAibDe. All rights reserved.
//

#import "ViewController.h"
#import "DoubleWaves.h"

@interface ViewController ()
@property (nonatomic, strong) DoubleWaves *wavesView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DoubleWaves *doubleWaves = [[DoubleWaves alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 26)];
    [self.view addSubview:doubleWaves];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
