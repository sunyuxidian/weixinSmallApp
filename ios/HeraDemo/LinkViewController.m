//
//  LinkViewController.m
//  HeraDemo
//
//  Created by WangYiqiao on 2017/11/15.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "LinkViewController.h"

@interface LinkViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:_webView];
	
	if (self.url) {
		NSURL *url = [NSURL URLWithString:_url];
		if (url) {
			NSURLRequest *request = [NSURLRequest requestWithURL:url];
			[_webView loadRequest:request];
		}
	}
}

@end
