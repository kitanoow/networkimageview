//
//  NetworkImageView.h
//  testImageView
//
//  Created by kitano on 2013/11/05.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkImageView : UIImageView
- (id)initWithURL:(CGRect)frame url:(NSString*)url save_path:(NSString*)save_path;
- (void)start:(NSString*)url save_path:(NSString*)save_path;
@end
