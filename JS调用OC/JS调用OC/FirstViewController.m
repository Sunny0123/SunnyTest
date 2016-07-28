//
//  FirstViewController.m
//  Test
//
//  Created by Sunny Zhang on 16/7/27.
//  Copyright © 2016年 Sunny Zhang. All rights reserved.
//

#import "FirstViewController.h"

#import <JavaScriptCore/JavaScriptCore.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
    
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:@"js" ofType:@"html"];
    NSString *js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:js baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    NSString *urlString = [[request URL] absoluteString];
//    
//    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
//    
//    if([urlComps count] && [[urlComps objectAtIndex:0] isEqualToString:@"objc"])
//    {
//        
//        NSArray *arrFucnameAndParameter = [(NSString*)[urlComps objectAtIndex:1] componentsSeparatedByString:@":/"];
//        NSString *funcStr = [arrFucnameAndParameter objectAtIndex:0];
//        
//        if (1 == [arrFucnameAndParameter count])
//        {
//            // 没有参数
//            if([funcStr isEqualToString:@"doFunc1"])
//            {
//                
//                /*调用本地函数1*/
//                NSLog(@"doFunc1");
//                
//            }
//        }
//        else
//        {
//            //有参数的
//            if([funcStr isEqualToString:@"printLog1:Log2:"])
//            {
//            
//                id object1 =[arrFucnameAndParameter objectAtIndex:1];
//                id object2 =[arrFucnameAndParameter objectAtIndex:2];
//                //[self printLog1:[arrFucnameAndParameter objectAtIndex:1] Log2:[arrFucnameAndParameter objectAtIndex:2]];
//            }
//        }
//        return NO;
//    }
//    return  YES;
//}



- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 获取webView上的js
    JSContext *contest = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    contest[@"test"] = ^(){
        NSLog(@"test按钮被点击了!!");
        
        UIAlertView *alerr=[[UIAlertView alloc] initWithTitle:@"test按钮被点击了!!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerr show];
        
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"test按钮被点击了!!"
//                                                                       message:@"This is an alert."
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                              handler:^(UIAlertAction * action) {}];
//        
//        [alert addAction:defaultAction];
//        [self presentViewController:alert animated:YES completion:nil];
        
        
        // 这里网页上的按钮被点击了, 客户端可以在这里拦截到,并进行操作
    };
}


@end
