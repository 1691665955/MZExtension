//
//  NSString+TDAPI.m
//  TDEntranceGuard
//
//  Created by 曾龙 on 2018/6/8.
//  Copyright © 2018年 farbell. All rights reserved.
//

#import "NSString+TDAPI.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (TDAPI)
+ (NSString *)apiWithURL:(NSString *)url {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    if ([appVersion containsString:@"T"]){
        // 测试机
        return [NSString stringWithFormat:@"%@%@",@"http://dev.bodyguard.trudian.com",url] ;
    }else{
        // 正式机
        return [NSString stringWithFormat:@"%@%@",@"http://bodyguard.trudian.com",url] ; ;
    }
}

- (NSString *)md5Encrypt {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", result[i]];
    
    return  output;
}

- (NSString *)decimalToHex {
    long long int tmpid = [self intValue];
    NSString *nLetterValue;
    NSString *str = @"";
    long long int ttmpig;
    for (int i = 0; i < 9; i++) {
        ttmpig = tmpid % 16;
        tmpid = tmpid / 16;
        switch (ttmpig) {
            case 10:
                nLetterValue = @"A";
                break;
            case 11:
                nLetterValue = @"B";
                break;
            case 12:
                nLetterValue = @"C";
                break;
            case 13:
                nLetterValue = @"D";
                break;
            case 14:
                nLetterValue = @"E";
                break;
            case 15:
                nLetterValue = @"F";
                break;
            default:
                nLetterValue = [[NSString alloc]initWithFormat:@"%lli", ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    return str;
}

- (NSData *)stringToData {
    if ([self length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([self length] %2 == 0) {
        range = NSMakeRange(0,2);
    } else {
        range = NSMakeRange(0,1);
    }
    for (NSInteger i = range.location; i < [self length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [self substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}

- (NSString *)hexToDecimal {
    return [NSString stringWithFormat:@"%lu",strtoul([self UTF8String],0,16)];
}

- (BOOL)isEmail {
    if ([self isEmpty]) {
        return NO;
    }
    return [self regularExpression:@"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?"];
}

- (BOOL)regularExpression:(NSString *)pattern {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    if (result) {
        return YES;
    }
    return NO;
}

- (BOOL)isEmpty {
    if (self) {
        NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string isEqualToString:@""]) {
            return YES;
        }
        if (string.length == 0) {
            return YES;
        }
        return NO;
    }
    return YES;
}
@end
