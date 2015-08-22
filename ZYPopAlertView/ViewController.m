//
//  ViewController.m
//  ZYPopAlertView
//
//  Created by ZY on 15/8/22.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYPopAlertView.h"
#define UISCREEN_BOUNDS_SIZE      [UIScreen mainScreen].bounds.size // 屏幕的物理尺寸

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //弹出按钮
    UIButton * text1Btn = [[UIButton alloc]initWithFrame:CGRectMake(UISCREEN_BOUNDS_SIZE.width/2-50, 40, 100, 44)];
    [text1Btn setBackgroundColor:[UIColor orangeColor]];
    [text1Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [text1Btn setTitle:@"测试按钮1" forState:UIControlStateNormal];
    [text1Btn addTarget:self action:@selector(clickPopViewButton1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:text1Btn];
    
    UIButton * text2Btn = [[UIButton alloc]initWithFrame:CGRectMake(UISCREEN_BOUNDS_SIZE.width/2-50, UISCREEN_BOUNDS_SIZE.height-160, 100, 44)];
    [text2Btn setBackgroundColor:[UIColor orangeColor]];
    [text2Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [text2Btn setTitle:@"测试按钮2" forState:UIControlStateNormal];
    [text2Btn addTarget:self action:@selector(clickPopViewButton2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:text2Btn];
}

-(void)clickPopViewButton1:(id)sender
{
    UIButton * senderButton = (UIButton *)sender;
    //弹出view
    ZYPopAlertView * temp = [[ZYPopAlertView alloc]initWithWidthOringeX:60 width:150 trianglePoint:CGPointMake(senderButton.center.x, senderButton.frame.origin.y+senderButton.frame.size.height+3) message:@"我弹出来了哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" upOrDown:ZYPopAlertViewUp] ;
    
    [self.view addSubview:temp];
}

-(void)clickPopViewButton2:(id)sender
{
    UIButton * senderButton = (UIButton *)sender;
    //弹出view
    ZYPopAlertView * temp = [[ZYPopAlertView alloc]initWithWidthOringeX:60 width:220 trianglePoint:CGPointMake(senderButton.center.x, senderButton.frame.origin.y-3) message:@"我弹出来了哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" upOrDown:ZYPopAlertViewDown] ;
    
    temp.outTigonWidth = 20;
    temp.outTigonHigh = 15;
    
    [self.view addSubview:temp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
