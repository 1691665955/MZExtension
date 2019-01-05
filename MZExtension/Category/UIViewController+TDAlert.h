//
//  UIViewController+TDAlert.h
//  bodyGuards
//
//  Created by 曾龙 on 2018/11/29.
//  Copyright © 2018年 trudian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TDAlert)
- (void)showAlertWithMessage:(NSAttributedString *)message confirm:(void(^)(void))confirm;
@end
