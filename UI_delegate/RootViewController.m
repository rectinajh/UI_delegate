//
//  ViewController.m
//  UI_delegate
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "RootViewController.h"
#import "CallView.h"

@interface RootViewController () <CallViewDelegate>
//不声明默认私有方法
- (void)initializeUserInterface;
@property(nonatomic , strong) UILabel       *numberLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    //1,创建自定义视图
    CallView *callView = [[CallView alloc]initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), 380)];
    //2,设置代理 成为代理人
#warning 第四步设置具体代理人并且让代理人遵守协议
    callView.delegate = self;

    //3,添加视图
    [self.view addSubview:callView];
    
    //4,创建label
    self.numberLabel = [[UILabel alloc]init];
   
    //5,设置大小
    self.numberLabel.frame = CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), 30);
    //6,设置文本
    self.numberLabel.text =@""; //默认为nil，向nil放松消息不存在
    //7,设置对齐方式
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    //8,设置字体
    self.numberLabel.font = [UIFont systemFontOfSize:20];
    //9,添加视图
    [self.view addSubview:self.numberLabel];
}

#warning 第五步实现协议的方法
- (void)buttonPressWithTitle:(NSString *)title
{
    //控制器逻辑
    self.numberLabel.text =[self.numberLabel.text stringByAppendingString:title];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
