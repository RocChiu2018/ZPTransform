//
//  ViewController.m
//  transform
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *tempView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tempView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tempView];
    
    //为了测试emptyTransforms方法而先调用此方法
//    [self superposedAnimations];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //平移
    [self translation];
    
    //缩放
//    [self scale];
    
    //旋转
//    [self rotation];
    
    //叠加动画
//    [self superposedAnimations];
    
    //累计旋转（点击一次屏幕旋转45度）
//    [self accumulatedRotate];
    
    //一次性清空所有的transform
//    [self emptyTransforms];
    
}

#pragma mark ————— 平移 —————
/**
 view在x方向上向左平移是负数，向右平移是正数；
 view在y方向上向上平移是负数，向下平移是正数。
 */
- (void)translation
{
    [UIView animateWithDuration:2.0 animations:^{
        self.tempView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];
}

#pragma mark ————— 缩放 —————
- (void)scale
{
    [UIView animateWithDuration:2.0 animations:^{
        self.tempView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }];
}

#pragma mark ————— 旋转 —————
- (void)rotation
{
    [UIView animateWithDuration:2.0 animations:^{
        //参数是弧度值
        self.tempView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

#pragma mark ————— 叠加动画 —————
- (void)superposedAnimations
{
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform translation = CGAffineTransformMakeTranslation(100, 100);  //平移
        CGAffineTransform scaleTranslation = CGAffineTransformScale(translation, 0.5, 0.5);  //边平移边缩放
        CGAffineTransform rotateScaleTranslation = CGAffineTransformRotate(scaleTranslation, M_PI_2);  //边平移边缩放边旋转
        self.tempView.transform = rotateScaleTranslation;
    }];
}

#pragma mark ————— 累计旋转 —————
/**
 点击一次屏幕，视图旋转45度
 */
- (void)accumulatedRotate
{
    [UIView animateWithDuration:1.0 animations:^{
        self.tempView.transform = CGAffineTransformRotate(self.tempView.transform, M_PI_4);
    }];
}

#pragma mark ————— 一次性清空所有的transform —————
- (void)emptyTransforms
{
    [UIView animateWithDuration:2.0 animations:^{
        self.tempView.transform = CGAffineTransformIdentity;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
