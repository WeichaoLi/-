//
//  SideViewController.h
//  SideBar
//
//  Created by 李伟超 on 14-9-12.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideViewDelegate;

@interface SideViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIViewController *leftViewController;

@property (nonatomic, assign) id<SideViewDelegate>delegate;

@end

@protocol SideViewDelegate <NSObject>
@optional
- (void)HiddenTheSideView;

@end