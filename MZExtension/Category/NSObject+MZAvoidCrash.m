//
//  NSObject+MZAvoidCrash.m
//  StudyDemo
//
//  Created by 曾龙 on 2021/4/8.
//  Copyright © 2021 曾龙. All rights reserved.
//

#import "NSObject+MZAvoidCrash.h"
#import <objc/runtime.h>

@implementation NSObject (MZAvoidCrash)

//统一处理找不到对应方法崩溃的问题

- (void)forwardInvocation:(NSInvocation *)anInvocation {

}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *method = NSStringFromSelector(aSelector);
    if ([method hasPrefix:@"_"]) {
        return nil;
    }
    NSString *crashMessage = [NSString stringWithFormat:@"MZCrashLog:[%@ %@]: unrecognized selector sent to instance",self,NSStringFromSelector(aSelector)];
    NSMethodSignature *signature = [NSObject instanceMethodSignatureForSelector:@selector(showCrashMessage:)];
    [self showCrashMessage:crashMessage];
    return signature;
}

- (void)showCrashMessage:(NSString *)crashMessage {
    NSLog(@"%@",crashMessage);
}


//统一处理键值对编码找不到对应属性崩溃的问题

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setNilValueForKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
