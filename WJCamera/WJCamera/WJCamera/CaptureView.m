//
//  CaptureView.m
//  WJCamera
//
//  Created by wangwenj on 2019/8/14.
//  Copyright © 2019 wangwenj. All rights reserved.
//

#import "CaptureView.h"
#import "WJUtilDefine.h"

@implementation CaptureView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    _progerssView = [[WJProgressView alloc] initWithFrame:self.bounds];
    [self addSubview:_progerssView];
    _captureButton = [[WJShootButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60 )];
    _captureButton.center = CGPointMake(VIEW_W(self)/2, VIEW_H(self)/2);
    _captureButton.fillLayer.fillColor = UIColor.redColor.CGColor;
    [self addSubview:_captureButton];
    
    [_captureButton addTarget:self action:@selector(takeShoot:) forControlEvents:UIControlEventTouchDown];
     UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressForShoot:)];
    longPress.minimumPressDuration = 0.5; //定义按的时间
    [_captureButton addGestureRecognizer:longPress];
}

-(void)takeShoot:(id)sender{
    if (_block) {
        _block(CAPTURE_SHOOT);
    }
}

-(void)pressForShoot:(UILongPressGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"%@",@"press_begin");
        [self.progerssView startAnimation];
        if (_block) {
            _block(CAPTURE_RECORD_START);
        }
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
         NSLog(@"%@",@"press_end");
        recognizer.cancelsTouchesInView = NO;
        [self.progerssView endAnimation];
        if (_block) {
            _block(CAPTURE_RECORD_END);
        }
    }
}

@end
