//
//  CallView.m
//  UI_delegate
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "CallView.h"
#pragma mark - 代理传值用在从界面向主界面传值

@implementation CallView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //自定义布局
        [self initializeUserInterface];
    }
    return self;
}

- (void)initializeUserInterface
{
    //1,创建数据源
    NSArray *numberArray = @[@"1",@"2",@"3",
                       @"4",@"5",@"6",
                       @"7",@"8",@"9",
                       @"*",@"0",@"#"];
    //2,循环布局
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 80;
    CGFloat spaceWidth = (width - buttonWidth * 3) / 4;
    CGFloat spaceHeight = 20;
    for (int i = 0; i < numberArray.count; i ++) {
        //3,获取当前视图的宽度
        //4,创建button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //5,设置标题
        [button setTitle:numberArray[i] forState:UIControlStateNormal];
        //6,设置frame
        CGFloat x = (i % 3) * buttonWidth + (i % 3 + 1) * spaceWidth ;
        CGFloat y = (i / 3) * buttonHeight + (i / 3) * spaceHeight;
        button.frame = CGRectMake(x, y, buttonWidth, buttonHeight);
        //7,添加点击事件
        [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        //9,设置标题颜色
        [button setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
        //8.添加
        [self addSubview:button];
}
    
}

#warning 第三部合适地方进行代理人调用方法
- (void)handleButtonEvent:(UIButton *)sender
{
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(CallViewDelegate)]) {
        [self.delegate buttonPressWithTitle:sender.currentTitle];
    }

}

@end
