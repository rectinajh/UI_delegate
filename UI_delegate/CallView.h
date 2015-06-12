//
//  CallView.h
//  UI_delegate
//
//  Created by rimi on 15/6/12.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//
//自定义拨号键盘
#import <UIKit/UIKit.h>

#warning 第一步拟定协议
@protocol CallViewDelegate <NSObject>

//协议方法中包含你所需要传递的值
- (void)buttonPressWithTitle:(NSString *)title;


@end
@interface CallView : UIView

#warning 第二部设置属性代理人
@property(nonatomic,assign) id<CallViewDelegate>        delegate;

@end
