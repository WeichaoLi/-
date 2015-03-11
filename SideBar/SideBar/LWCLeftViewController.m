//
//  LWCLeftViewController.m
//  SideBar
//
//  Created by 李伟超 on 14-9-12.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCLeftViewController.h"
#import "LWCNextViewController.h"
#import "MainViewController.h"

@interface LWCLeftViewController ()

@end

@implementation LWCLeftViewController

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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TouchButtonEvent:(id)sender {
    LWCNextViewController *next = [[LWCNextViewController alloc] initWithNibName:@"LWCNextViewController" bundle:nil];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)HiddenTheSideView {
    NSLog(@"111111111");
}

@end
