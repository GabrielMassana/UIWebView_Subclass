//
//  ViewController.m
//  Subclass_UIWebView
//
//  Created by Gabriel Massana on 09/07/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "ViewController.h"
#import "GMWebView_Subclass.h"

static const int kWebViewWidth = 320;
static const int kWebViewHeight = 480;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *arrayURLs = @[@"http://www.google.com",@"http://www.gabrielmassana.com",@"http://www.gencat.cat"];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    [scrollView setContentSize:CGSizeMake(960, 480)];
    [scrollView setPagingEnabled:YES];
    [self.view addSubview:scrollView];
    
    int width = 0;
    
    for (NSString *string in arrayURLs)
    {
        GMWebView_Subclass *webView = [[GMWebView_Subclass alloc]initWithFrame:CGRectMake(width, 0, kWebViewWidth, kWebViewHeight)];
        webView.delegate = self;
        NSURL *url = [NSURL URLWithString:string];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [webView setScalesPageToFit:YES];
        [scrollView addSubview:webView];
        
        width += kWebViewWidth;
        
        [[webView GMActivityIndicator] startAnimating];
        [[webView GMActivityIndicator] setHidden:NO];
        [[webView GMActivityIndicator] setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
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
    GMWebView_Subclass *temp = (GMWebView_Subclass *) aWebView;
    [[temp GMActivityIndicator] stopAnimating];
    [[temp GMActivityIndicator] setHidden:YES];
    [[temp GMActivityIndicator] removeFromSuperview];
}

#pragma mark - Supported Interface Orientations

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
