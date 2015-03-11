//
//  SideViewController.m
//  SideBar
//
//  Created by 李伟超 on 14-9-12.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "SideViewController.h"

@interface SideViewController () {
    CGPoint _startPoint;
    BOOL _isMoved;
    CGFloat _beginX;
}

@end

@implementation SideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGestureRecognizer];
    
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer {
    if ([_delegate respondsToSelector:@selector(HiddenTheSideView)]) {
//        [_delegate HiddenTheSideView];
    }

    CGPoint currentPoint = [panGestureRecognizer locationInView:[[UIApplication sharedApplication] keyWindow]];
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            _beginX = self.view.transform.tx;
            _startPoint = currentPoint;
            if (_leftViewController) {
                _leftViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self.parentViewController.view insertSubview:_leftViewController.view belowSubview:self.view];
            }
            _isMoved = YES;

            break;
            
        case UIGestureRecognizerStateChanged:
            if (self.view.transform.tx >= 0) {
                [self moveTheView:(currentPoint.x - _startPoint.x)];
            }
            break;
            
        case UIGestureRecognizerStateEnded: {
            CGFloat Xdistant = currentPoint.x -_startPoint.x;
            
            if (Xdistant >= 120) { // 向右滑
                
                [UIView animateWithDuration:0.3 animations:^{
                    [self moveTheView:250];
                }completion:^(BOOL finished){
                    [UIView animateWithDuration:0.2 animations:^{
                        [self moveTheView:210];
                    }completion:^(BOOL finished){
                        [UIView animateWithDuration:0.2 animations:^{
                            [self moveTheView:250];
                        }completion:^(BOOL finished){
                            _isMoved = YES;
                        }];
                    }];
                }];
                
            }else if (Xdistant < -70) { // 向左滑
                
                [UIView animateWithDuration:0.3 animations:^{
                    [self moveTheView:-250];
                }completion:^(BOOL finished){
                    _isMoved = YES;
                }];
                
            }else {  //滑动距离太小，恢复原位
                
                [UIView animateWithDuration:0.2 animations:^{
                    [self moveTheView:0];
                }completion:^(BOOL finished){
                    _isMoved = NO;
                }];
                
            }
        }
            break;
            
        case UIGestureRecognizerStateCancelled: {
            [UIView animateWithDuration:0.2 animations:^{
                [self moveTheView:0];
            } completion:^(BOOL finished) {
                
            }];
            return;
        }
            break;
            
        default:
            break;
    }

}

- (void)moveTheView:(CGFloat)XD {
//    self.view.transform = CGAffineTransformMake(0, 1, 0.5, 0, 0, 0);
    self.view.transform = CGAffineTransformMakeTranslation(_beginX + XD, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


