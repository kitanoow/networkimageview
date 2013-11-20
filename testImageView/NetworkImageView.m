//
//  NetworkImageView.m
//  testImageView
//
//  Created by kitano on 2013/11/05.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "NetworkImageView.h"

@implementation NetworkImageView
{
    NSMutableData *asyncData;
    NSString *path;
    UIActivityIndicatorView *ai;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithURL:(CGRect)frame url:(NSString*)url save_path:(NSString*)save_path
{
    self = [super initWithFrame:frame];
    if (self) {
        [self start:url save_path:save_path];
    }
    return self;
}

-(void)start:(NSString*)url save_path:(NSString*)save_path
{
    UIImage* image = [UIImage imageWithContentsOfFile:save_path];
    if(image == nil) {
        path = [save_path copy];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (conn != nil) {
            ai = [[UIActivityIndicatorView alloc]
                  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            ai.center = self.center;
            ai.hidesWhenStopped = YES;
            [ai startAnimating];
            [self addSubview:ai];
        }
    } else {
        self.image = image;
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    asyncData = [[NSMutableData alloc] initWithData:0];
    //[response expectedContentLength];
}

- (void) connection:(NSURLConnection*)connection didReceiveData:(NSData *)data
{
    [asyncData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [asyncData release];
    asyncData = nil;
}

- (void) connectionDidFinishLoading:(NSURLConnection*)connection
{
    [ai stopAnimating];
    [ai removeFromSuperview];
    [ai release];
    ai = nil;
    self.image = [[UIImage alloc] initWithData:asyncData];
    [asyncData writeToFile:path atomically:YES];
    [asyncData release];
    asyncData = nil;
    [path release];
}

@end
