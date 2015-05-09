//
//  LPMainViewController.m
//  LPTabbarViewController
//
//  Created by 彭利民 on 15/5/9.
//  Copyright (c) 2015年 彭利民. All rights reserved.
//

#import "LPMainViewController.h"
#import "LPItemOneTableViewController.h"
#import "LPItemTwoViewController.h"
#import "LPItemThreeViewController.h"

@interface LPMainViewController ()

/** 记录正在显示的子控制器 */
@property (nonatomic, weak) UIViewController *showingChildVc;
@property (weak, nonatomic) IBOutlet UIView *contenView;

@end

@implementation LPMainViewController
- (IBAction)oneBtnClick:(id)sender {
    
    [self switchVc:0];

}
- (IBAction)twoBtnClick:(id)sender {
    
    [self switchVc:1];

}
- (IBAction)threeBtnClick:(id)sender {
    
    [self switchVc:2];

}


/**
 *  切换控制器
 *
 *  @param index 即将显示的控制器的索引
 */
- (void)switchVc:(int)index{
    

    switch (_animationType) {
        case AnimationTypeNone:
            [self animationTypeNoneMethod:index];
            break;
            
        case AnimationTypeCube:
            [self animationTypeCustomMethod:index caTransitionName:@"cube"];
            break;
            
        case AnimationTypeMoveIn:
            [self animationTypeCustomMethod:index caTransitionName:@"moveIn"];
            break;

        case AnimationTypeReveal:
            [self animationTypeCustomMethod:index caTransitionName:@"reveal"];
            break;

        case AnimationTypeFade:
            [self animationTypeCustomMethod:index caTransitionName:@"fade"];
            break;

        case AnimationTypePageCurl:
            [self animationTypeCustomMethod:index caTransitionName:@"pageCurl"];
            break;
            
        case AnimationTypePageUnCurl:
            [self animationTypeCustomMethod:index caTransitionName:@"pageUnCurl"];
            break;

        case AnimationTypeSuckEffect:
            [self animationTypeCustomMethod:index caTransitionName:@"suckEffect"];
            break;

        case AnimationTypeRippleEffect:
            [self animationTypeCustomMethod:index caTransitionName:@"rippleEffect"];
            break;

        case AnimationTypeOglFlip:
            [self animationTypeCustomMethod:index caTransitionName:@"oglFlip"];
            break;

        case AnimationTypeCustom:
            [self animationTypeCustomMethod:index];
            break;



            
        default:
            break;
    }

}


- (void)animationTypeCustomMethod:(int)index caTransitionName:(NSString *)caTransitionName{

    UIViewController *newVc = self.childViewControllers[index];
    // 如果index对应的子控制器已经正在显示，就直接返回
    if (newVc == self.showingChildVc) return;

    // 0.保存新旧控制器的索引
    NSUInteger newIndex = index;
    NSUInteger oldIndex = [self.childViewControllers indexOfObject:self.showingChildVc];

    // 1.移除当前正在显示的子控制器view
    [self.showingChildVc.view removeFromSuperview];

    // 2.添加index位置对应控制器的view
    newVc.view.frame = self.contenView.bounds;
    [self.contenView addSubview:newVc.view];
    self.showingChildVc = newVc;

    // 3.执行动画
    if (oldIndex == NSNotFound) return;
    CATransition *animation = [CATransition animation];
    animation.type = caTransitionName;
    if (newIndex > oldIndex) {
        animation.subtype = kCATransitionFromRight; // index变大了
    } else {
        animation.subtype = kCATransitionFromLeft; // index变小
    }
    animation.duration = 0.5;
    [self.contenView.layer addAnimation:animation forKey:nil];



}
- (void)animationTypeCustomMethod:(int)index
{

    UIViewController *newVc = self.childViewControllers[index];
    // 如果index对应的子控制器已经正在显示，就直接返回
    if (newVc == self.showingChildVc) return;
    
    // 设置新控制器view的frame
    CGRect newFrame = self.contenView.bounds;
    newFrame.origin.x = self.contenView.frame.size.width;
    newVc.view.frame = newFrame;
    [self.contenView addSubview:newVc.view];
    
    // 动画
    [UIView animateWithDuration:0.5 animations:^{
        CGRect oldFrame = self.showingChildVc.view.frame;
        oldFrame.origin.x = -self.contenView.frame.size.width;
        self.showingChildVc.view.frame = oldFrame;
        
        newVc.view.frame = self.contenView.bounds;
    } completion:^(BOOL finished) {
        [self.showingChildVc.view removeFromSuperview];
        self.showingChildVc = newVc;
    }];



}

- (void)animationTypeNoneMethod:(int)index
{

    // 1.移除当前正在显示的子控制器view
    [self.showingChildVc.view removeFromSuperview];
    
    // 2.添加index位置对应控制器的view
    UIViewController *newVc = self.childViewControllers[index];
    newVc.view.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
    [self.view addSubview:newVc.view];
    self.showingChildVc = newVc;



}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i<_controllers.count; i++) {
        [self addChildViewController:_controllers[i]];

    }
}

- (void)setControllers:(NSArray *)controllers
{

    _controllers = controllers;

}

- (void)setAnimationType:(AnimationType)animationType
{


    _animationType = animationType;


}

@end
