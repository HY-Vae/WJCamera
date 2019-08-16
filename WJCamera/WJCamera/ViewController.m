//
//  ViewController.m
//  WJCamera
//
//  Created by wangwenj on 2019/8/14.
//  Copyright © 2019 wangwenj. All rights reserved.
//

#import "ViewController.h"
#import "WJCamera/WJCameraController.h"
#import "WJCamera/CaptureView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet CaptureView *cView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _cView.block = ^(CAPTUREACTION action) {
        NSLog(@"%lu",(unsigned long)action);
    };
}

- (IBAction)start:(id)sender {
    WJCameraController *wjCc = [[WJCameraController alloc]init];
    [self presentViewController:wjCc animated:YES completion:nil];
    
}

@end
