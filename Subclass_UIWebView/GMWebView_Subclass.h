//
//  GMWebView_Subclass.h
//  iRiSSpa
//
//  Created by Gabriel Massana on 09/07/2013.
//  Copyright (c) 2013 Jose A. Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMWebView_Subclass : UIWebView

@property (nonatomic, strong) UIActivityIndicatorView *GMActivityIndicator;

-(UIActivityIndicatorView *) getGMActivityIndicator;

@end
