//
//  UIViewController+TDAlert.m
//  bodyGuards
//
//  Created by 曾龙 on 2018/11/29.
//  Copyright © 2018年 trudian. All rights reserved.
//

#import "UIViewController+TDAlert.h"

@implementation UIViewController (TDAlert)
- (void)showAlertWithMessage:(NSAttributedString *)message confirm:(void(^)(void))confirm {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"提示" attributes:@{NSForegroundColorAttributeName:RGB(136, 136, 136)}];
    [alert setValue:title forKey:@"attributedTitle"];
    [alert setValue:message forKey:@"attributedMessage"];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [cancelAction setValue:RGB(136, 136, 136) forKey:@"titleTextColor"];
    [alert addAction:cancelAction];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirm) {
            confirm();
        }
    }];
    [confirmAction setValue:RGB(88, 146, 243) forKey:@"titleTextColor"];
    [alert addAction:confirmAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
