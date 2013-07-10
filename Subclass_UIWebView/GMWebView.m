//
//  GMWebView.m
//  iRiSSpa
//
//  Created by Gabriel Massana on 09/07/2013.
//  Copyright (c) 2013 Gabriel Massana. All rights reserved.
//

#import "GMWebView.h"

@implementation GMWebView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _activityIndicator = [[UIActivityIndicatorView alloc]init];
        [_activityIndicator setFrame:CGRectMake((self.frame.size.width-_activityIndicator.frame.size.width)/2, (self.frame.size.height-_activityIndicator.frame.size.height)/2, _activityIndicator.frame.size.width, _activityIndicator.frame.size.height)];
        [self addSubview:_activityIndicator];
    }
    return self;
}

@end
