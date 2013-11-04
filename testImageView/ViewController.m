//
//  ViewController.m
//  testImageView
//
//  Created by kitano on 2013/11/05.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "ViewController.h"
#import "NetworkImageView.h"
@interface ViewController ()
{
    IBOutlet NetworkImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = NSTemporaryDirectory();
    NSString *fileName = @"";
    NSString *fullName = [NSString stringWithFormat:@"%@/%@",path,fileName];
    NSString *url = @"";
    [imageView start:url save_path:fullName];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
