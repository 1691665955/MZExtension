//
//  MZPresentAnimationTransitioning.m
//  StudyDemo
//
//  Created by 曾龙 on 2018/10/15.
//  Copyright © 2018年 曾龙. All rights reserved.
//

#import "MZPresentAnimationTransitioning.h"
#import "MZImageBrowsingVC.h"

#define SCREEN_WIDTH_2     [UIScreen mainScreen].bounds.size.width

@interface MZPresentAnimationTransitioning()
@property (nonatomic, assign) MZPresentAnimationTransitioningType type;
@end

@implementation MZPresentAnimationTransitioning
- (instancetype)initWithTransitionType:(MZPresentAnimationTransitioningType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

+ (instancetype)transitionWithTransitionType:(MZPresentAnimationTransitioningType)type {
    return [[MZPresentAnimationTransitioning alloc] initWithTransitionType:type];
}

//转场时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

//转场动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case MZPresentAnimationTransitioningTypePresent:
            [self presentAnimation:transitionContext];
            break;
        case MZPresentAnimationTransitioningTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
        default:
            break;
    }
}

//实现present动画过渡
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    MZImageBrowsingVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if ([fromVC isKindOfClass:[UINavigationController class]]) {
        fromVC = [[(UINavigationController *)fromVC viewControllers] lastObject];
    }
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor blackColor];
    UIImageView *tempImageView = [UIImageView new];
    tempImageView.image = toVC.currentImageView.image;
    tempImageView.contentMode = UIViewContentModeScaleAspectFill;
    tempImageView.backgroundColor = [UIColor clearColor];
    tempImageView.clipsToBounds = YES;
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempImageView];
    tempImageView.frame = [self getViewFrameInScrren:toVC.currentImageView toVC:toVC];
    fromVC.view.hidden = YES;
    toVC.view.hidden = YES;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH_2, SCREEN_WIDTH_2*toVC.currentImageView.image.size.height/toVC.currentImageView.image.size.width);
        tempImageView.center = toVC.view.center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        tempImageView.hidden = YES;
        toVC.view.hidden = NO;
        fromVC.view.hidden = NO;
        [tempImageView removeFromSuperview];
        if ([transitionContext transitionWasCancelled]) {
            fromVC.view.hidden = NO;
        }
    }];
}

//实现dismiss动画过渡
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    MZImageBrowsingVC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor clearColor];
    UIImageView *tempImageView = [UIImageView new];
    tempImageView.image = fromVC.showImageView.image;
    tempImageView.frame = fromVC.showImageView.frame;
    tempImageView.contentMode = UIViewContentModeScaleAspectFill;
    tempImageView.backgroundColor = [UIColor clearColor];
    tempImageView.clipsToBounds = YES;
    [containerView addSubview:tempImageView];
    fromVC.view.alpha = 1;
    fromVC.currentImageView.hidden = YES;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempImageView.frame = [self getViewFrameInScrren:fromVC.currentImageView toVC:fromVC];
        fromVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if (![transitionContext transitionWasCancelled]) {
            [tempImageView removeFromSuperview];
            fromVC.currentImageView.hidden = NO;
        }
    }];
}

- (CGRect)getViewFrameInScrren:(UIView *)view toVC:(MZImageBrowsingVC *)toVC {
    CGPoint position = [self getViewPositionInScreen:view toVC:toVC];
    return CGRectMake(position.x, position.y, view.frame.size.width, view.frame.size.height);
}

- (CGPoint)getViewPositionInScreen:(UIView *)view toVC:(MZImageBrowsingVC *)toVC {
    UIView *superView = [view superview];
    if (superView) {
        if ([superView isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
            CGPoint position = view.frame.origin;
            CGPoint superPosition = [self getViewPositionInScreen:superView.superview toVC:(MZImageBrowsingVC *)toVC];
            return CGPointMake(position.x+superPosition.x, position.y+superPosition.y);
        } else if ([superView isKindOfClass:[UITableView class]]) {
            UITableView *tableView = (UITableView *)superView;
            if ([view isMemberOfClass:[UIView class]]) {
                CGPoint position = view.frame.origin;
                CGPoint superPosition = [self getViewPositionInScreen:superView toVC:(MZImageBrowsingVC *)toVC];
                return CGPointMake(position.x+superPosition.x-tableView.contentOffset.x, position.y+superPosition.y-tableView.contentOffset.y);
            } else {
                CGPoint position = [tableView rectForRowAtIndexPath:toVC.indexPath].origin;
                CGPoint superPosition = [self getViewPositionInScreen:superView toVC:(MZImageBrowsingVC *)toVC];
                return CGPointMake(position.x+superPosition.x, position.y+superPosition.y-tableView.contentOffset.y);
            }
        } else if ([superView isKindOfClass:[UICollectionView class]]) {
            UICollectionView *collectionView = (UICollectionView *)superView;
            UICollectionViewLayoutAttributes *att = [collectionView layoutAttributesForItemAtIndexPath:toVC.indexPath];
            CGRect cellRect = att.frame;
            CGPoint position = [collectionView convertRect:cellRect toView:collectionView].origin;
            CGPoint superPosition = [self getViewPositionInScreen:superView toVC:(MZImageBrowsingVC *)toVC];
            return CGPointMake(position.x+superPosition.x, position.y+superPosition.y-collectionView.contentOffset.y);
        } else if ([superView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)superView;
            CGPoint position = view.frame.origin;
            CGPoint superPosition = [self getViewPositionInScreen:superView toVC:(MZImageBrowsingVC *)toVC];
            return CGPointMake(position.x+superPosition.x-scrollView.contentOffset.x, position.y+superPosition.y-scrollView.contentOffset.y);
        } else {
            CGPoint position = view.frame.origin;
            CGPoint superPosition = [self getViewPositionInScreen:superView toVC:(MZImageBrowsingVC *)toVC];
            return CGPointMake(position.x+superPosition.x, position.y+superPosition.y);
        }
    } else {
        return view.frame.origin;
    }
}

@end
