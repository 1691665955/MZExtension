//
//  MZLongTapButton.m
//  MVVMDemo
//
//  Created by 曾龙 on 2021/3/2.
//

#import "MZLongTapButton.h"

@interface MZLongTapButton ()
@property (nonatomic, assign) BOOL hasLongTap;
@end

@implementation MZLongTapButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    MZLongTapButton *button = [super buttonWithType:buttonType];
    if (button) {
        [button initialize];
    }
    return button;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.timeStart = 0.5;
    self.timeGap = 0.2;
    [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchUpCancel) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside|UIControlEventTouchDragOutside];
}

- (void)touchDown {
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:self.timeStart];
}

- (void)delayMethod {
    if (self.tapCallback) {
        self.tapCallback(self);
    }
    self.hasLongTap = YES;
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:self.timeGap];
}

- (void)touchUpInside {
    if (!self.hasLongTap) {
        if (self.tapCallback) {
            self.tapCallback(self);
        }
    }
    [self touchUpCancel];
}

- (void)touchUpCancel {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    self.hasLongTap = NO;
}

@end
