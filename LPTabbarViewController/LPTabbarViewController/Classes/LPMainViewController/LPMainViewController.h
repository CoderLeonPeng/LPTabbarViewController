//
//  LPMainViewController.h
//  LPTabbarViewController
//
//  Created by 彭利民 on 15/5/9.
//  Copyright (c) 2015年 彭利民. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, AnimationType) {
    AnimationTypeNone,                  // regular table view
    AnimationTypeCube,
    AnimationTypeMoveIn,
    AnimationTypeReveal,
    AnimationTypeFade,
    AnimationTypePageCurl,
    AnimationTypePageUnCurl,
    AnimationTypeSuckEffect,
    AnimationTypeRippleEffect,
    AnimationTypeOglFlip,
    AnimationTypeCustom                 // preferences style table view
};



@interface LPMainViewController : UIViewController

/**
 *   传入要展示的子控制器数组
 */
@property (nonatomic, strong) NSArray *controllers;

/**
 *   view切换动画类型
 */
@property (nonatomic, assign) AnimationType animationType;


@end
