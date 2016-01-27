//
//  ViewController.m
//  1-post
//
//  Created by qianfeng on 16/1/19.
//  Copyright © 2016年 姜晓延. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //post请求，带参数的请求 在请求体里边加参数
    NSURL *url = [NSURL URLWithString:@"http://10.0.8.8/sns/my/user_list.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //一般默认是get请求，可以设置
    request.HTTPMethod = @"post";
    
    //参数 第一页十条数据，这参数是跟服务端人员商定的
    NSString *paramStr = @"number=10&page=1";
    //将参数放到请求体中，用 dataUsingEncoding编码方式NSUTF8StringEncoding
    request.HTTPBody = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //发送一个异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       //拿到二进制数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
