//
//  RetrieveViewController.m
//  HeraDemo
//
//  Created by WangYiqiao on 2017/11/15.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "RetrieveViewController.h"
#import <Hera/WDHodoer.h>

@interface RetrieveViewController () 

@property (nonatomic, copy) WDHApiCompletion apiCompletion;

@end

@implementation RetrieveViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = UIColor.whiteColor;
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.frame = CGRectMake(0, 0, 100, 30);
	[button setTitle:@"haha" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(foo) forControlEvents:UIControlEventTouchUpInside];
	button.center = self.view.center;
	[self.view addSubview:button];
}

- (void)foo {
	self.apiCompletion(@{@"result": @"heheh"});
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveApi:(NSString *)api withParam:(id)params completion:(WDHApiCompletion)completion {
	
	NSLog(@"api: %@", api);
	NSLog(@"param: %@", params);
	
	self.apiCompletion = completion;
}

@end
