//
//  GMWebView_Subclass.m
//  iRiSSpa
//
//  Created by Gabriel Massana on 09/07/2013.
//  Copyright (c) 2013 Jose A. Gabriel Massana. All rights reserved.
//

#import "GMWebView_Subclass.h"

@implementation GMWebView_Subclass

@synthesize GMActivityIndicator = _GMActivityIndicator;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _GMActivityIndicator = [[UIActivityIndicatorView alloc]init];
        [_GMActivityIndicator setFrame:CGRectMake((self.frame.size.width-37)/2, (self.frame.size.height-37)/2, 37, 37)];
        [self addSubview:_GMActivityIndicator];
    }
    return self;
}

-(UIActivityIndicatorView *) getGMActivityIndicator
{
    return _GMActivityIndicator;
}
@end
