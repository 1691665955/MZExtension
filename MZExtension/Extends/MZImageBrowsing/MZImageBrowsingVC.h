//
//  MZImageBrowsingVC.h
//  StudyDemo
//
//  Created by 曾龙 on 2018/10/15.
//  Copyright © 2018年 曾龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MZImageBrowsingVC : UIViewController
@property (strong, nonatomic, readonly) UIImageView *showImageView;
@property (strong, nonatomic, readonly) UIImageView *currentImageView;
@property (nonatomic, strong) NSIndexPath *indexPath;//当currentImageView在cell里面的时候必传

- (instancetype)initWithImageViewArray:(NSArray<UIImageView *> *)imageViewArray currentIndex:(NSInteger)currentIndex;
- (instancetype)initWithImageUrlArray:(NSArray<NSString *> *)imageUrlArray currentImageView:(UIImageView *)currentImageView currentIndex:(NSInteger)currentIndex;
@end
