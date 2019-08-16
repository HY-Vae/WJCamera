//
//  WJCameraController.m
//  WJCamera
//
//  Created by wangwenj on 2019/8/14.
//  Copyright © 2019 wangwenj. All rights reserved.
//

#import "WJCameraController.h"
#import "CaptureView.h"
#import "WJUtilDefine.h"

@interface WJCameraController ()

@property(strong, nonatomic)CaptureView *captureView;

@end

@implementation WJCameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.clearColor;
    
    [self setupSubView];
}

-(void)setupSubView{
    
    _captureView = [[CaptureView alloc]initWithFrame:CGRectMake(VIEW_W(self.view)/2 - 40, VIEW_H(self.view) - 100, 80, 80)];
    [self.view addSubview:_captureView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
