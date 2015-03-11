//
//  LWCViewController.m
//  SideBar
//
//  Created by 李伟超 on 14-9-12.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCViewController.h"
#import "MainViewController.h"
#import "LWCLeftViewController.h"

@interface LWCViewController ()

@end

@implementation LWCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MainViewController *mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self addChildViewController:mainVC];
    [self.view addSubview:mainVC.view];
    
    LWCLeftViewController *leftVC = [[LWCLeftViewController alloc] initWithNibName:@"LWCLeftViewController" bundle:nil];
    [self addChildViewController:leftVC];
    [self.view insertSubview:leftVC.view atIndex:0];
    
    mainVC.delegate = leftVC;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
