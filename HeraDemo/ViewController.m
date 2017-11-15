//
//  ViewController.m
//  WDHodoerDemo
//
//  Created by acorld on 2017/7/20.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "ViewController.h"
#import <Hera/WDHodoer.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation ViewController

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Hera";
	
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [self.view addGestureRecognizer:ges];
	
}

- (void)didTap {

	[self.indicatorView startAnimating];
	self.view.userInteractionEnabled = NO;
	
	WDHAppInfo *appInfo = [[WDHAppInfo alloc] init];
	appInfo.appId = @"demo1";
	appInfo.userId = @"userid111";
	[[WDHInterface sharedInterface] startAppWithAppInfo:appInfo entrance:self.navigationController completion:^(BOOL success, NSString *msg) {
		[self.indicatorView stopAnimating];
		self.view.userInteractionEnabled = YES;
		NSLog(@"%@", msg);
	}];

}

@end
