//
//  ViewController.m
//  AnimateDemo
//
//  Created by CYH on 16/5/4.
//  Copyright © 2016年 Chaiyahang. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Demo";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *responseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    responseButton.frame = CGRectMake((self.view.frame.size.width - 100)/2, 200, 100, 30);
    [responseButton setTitle:@"Animate" forState:UIControlStateNormal];
    responseButton.layer.cornerRadius = 15.0;
    responseButton.layer.borderColor = [UIColor orangeColor].CGColor;
    [responseButton addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:responseButton];
    
}

- (CGFloat)getAnimateCyWithHeight:(CGFloat)tempHeight
{
    CGFloat cY = (self.view.frame.size.height - tempHeight)/2.0;
    return cY;
}

- (void)pushAction:(UIButton *)sender
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.title = @"123";
    
    __block CGFloat tempHeight = 60.0;
    CGFloat cY = (self.view.frame.size.height - tempHeight)/2.0;
    
    __block UIView *aniView = [[UIView alloc] initWithFrame:CGRectMake(0, cY, self.view.frame.size.width, tempHeight)];
    aniView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:aniView];
    
    __weak ViewController *weakSelf = self;
    
    [UIView animateWithDuration:2.5 animations:^{
        tempHeight += (self.view.frame.size.height - 60.0);
        CGRect frame = aniView.frame;
        frame.origin.y = [weakSelf getAnimateCyWithHeight:tempHeight];
        frame.size.height = tempHeight;
        aniView.frame = frame;
    } completion:^(BOOL finished) {
        [aniView removeFromSuperview];
        aniView.hidden = YES;
        aniView = nil;
        [self.navigationController pushViewController:detailVC animated:NO];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
