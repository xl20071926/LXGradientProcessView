//
//  ViewController.m
//  LXGradientProcessView
//
//  Created by Leexin on 15/12/20.
//  Copyright © 2015年 Garden.Lee. All rights reserved.
//

#import "ViewController.h"
#import "LXGradientProcessView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()

@property (nonatomic, strong) LXGradientProcessView *processView;
@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.colorLayer = [CALayer layer];
    [self.colorLayer setFrame:self.view.frame];
//    [self.colorLayer setBackgroundColor:[UIColor purpleColor].CGColor];
//    [self.view.layer addSublayer:self.colorLayer];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapClick)];
    [self.view addGestureRecognizer:tap];
    
    // 渐变进度条
    self.processView = [[LXGradientProcessView alloc] initWithFrame:CGRectMake(20.f, 100.f, SCREEN_WIDTH - 40.f, 45.f)];
    self.processView.percent = 0;
    [self.view addSubview:self.processView];
    
    UIButton *stareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [stareButton setFrame:CGRectMake(20.f, 300.f, SCREEN_WIDTH - 40.f, 38.f)];
    [stareButton addTarget:self action:@selector(onStareButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [stareButton setTitle:@"Stare" forState:UIControlStateNormal];
    stareButton.layer.cornerRadius = 4.f;
    stareButton.layer.borderWidth = 0.5;
    stareButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:stareButton];
}

- (void)onStareButtonClick {
    
    self.processView.percent = 80.f;
}

- (void)onTapClick {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:2.0];
//    [self.colorLayer setBackgroundColor:[UIColor purpleColor].CGColor];
    [self.view setBackgroundColor:[UIColor purpleColor]];
    [CATransaction commit];
    
//    [self.view.layer setPosition:CGPointMake(100, 100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
