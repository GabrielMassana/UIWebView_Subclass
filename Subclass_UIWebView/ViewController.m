//
//  ViewController.m
//  Subclass_UIWebView
//
//  Created by Gabriel Massana on 09/07/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"
#import "GMWebView.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

static const int kInitialWebViewWidthPosition = 0;
static const int kXPositionZero = 0;
static const int kYPositionZero = 0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *arrayURLs = @[@"http://www.google.com",@"http://www.gabrielmassana.com",@"http://www.gencat.cat"];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(kXPositionZero, kYPositionZero, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * [arrayURLs count], SCREEN_HEIGHT)];
    [scrollView setPagingEnabled:YES];
    [scrollView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:scrollView];
    
    int width = kInitialWebViewWidthPosition;
    
    for (NSString *string in arrayURLs)
    {
        GMWebView *webView = [[GMWebView alloc]initWithFrame:CGRectMake(width, kYPositionZero, SCREEN_WIDTH, SCREEN_HEIGHT)];
        webView.delegate = self;
        [webView setOpaque:NO];
        NSURL *url = [NSURL URLWithString:string];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [webView setScalesPageToFit:YES];
        [scrollView addSubview:webView];
        
        width += SCREEN_WIDTH;
        
        [[webView activityIndicator] startAnimating];
        [[webView activityIndicator] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Web View Delegate

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{
    GMWebView *webView = (GMWebView *) aWebView;
    [[webView activityIndicator] stopAnimating];
    [[webView activityIndicator] removeFromSuperview];
}

#pragma mark - Supported Interface Orientations

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
