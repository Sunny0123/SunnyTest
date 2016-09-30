//
//  FirstViewController.m
//  Autolayout
//
//  Created by RainSets on 16/7/28.
//  Copyright © 2016年 RainSets. All rights reserved.
//

#import "FirstViewController.h"
#import "UIImageView+MyImageView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.imgView loadIamgeWithURL:@"http://image72.360doc.com/DownloadImg/2014/05/2605/42035151_4.jpg"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
