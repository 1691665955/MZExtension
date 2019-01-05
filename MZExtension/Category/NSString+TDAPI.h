//
//  NSString+TDAPI.h
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/8.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TDAPI)
+ (NSString *)apiWithURL:(NSString *)url;
- (NSString *)md5Encrypt;
- (NSString *)decimalToHex;
- (NSData *)stringToData;
- (NSString *)hexToDecimal;
- (BOOL)isEmail;
@end
