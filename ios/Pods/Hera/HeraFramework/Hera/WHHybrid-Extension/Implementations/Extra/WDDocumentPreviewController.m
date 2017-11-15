//
//  DocumentPreviewController.m
//  WDHodoerDemo
//
//  Created by WangYiqiao on 2017/8/2.
//  Copyright © 2017年 weidian. All rights reserved.
//

#import "WDDocumentPreviewController.h"
#import <WebKit/WebKit.h>

@interface WDDocumentPreviewController () <WKNavigationDelegate>

// 资源url
@property (nonatomic, copy) NSURL *url;

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, weak) UIActivityIndicatorView *activityView;

@end

@implementation WDDocumentPreviewController

- (instancetype)initWithUrl:(NSURL *)url {
    
    if (self = [super init]) {
        _url = url;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect webFrame = {0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height};
    _webView = [[WKWebView alloc] initWithFrame:webFrame];
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    [_webView loadFileURL:self.url allowingReadAccessToURL:self.url];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.center = _webView.center;
    [self.view addSubview:activityView];
    self.activityView = activityView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnWebView)];
    [self.webView addGestureRecognizer:tap];
    [self.webView setUserInteractionEnabled:YES];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(tappedOnDoneBarItem)];
    self.navigationItem.leftBarButtonItem = doneItem;
    
    self.title = @"文件预览";
    
    [activityView startAnimating];
}

#pragma mark - User Interaction

- (void)tappedOnDoneBarItem {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)tappedOnWebView {
    BOOL isHidden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHidden animated:YES];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [_activityView stopAnimating];
    [_activityView removeFromSuperview];
    _activityView = nil;
}

@end
