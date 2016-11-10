//
//  ViewController.m
//  StarGradeView
//
//  Created by 郑鹏 on 2016/11/10.
//  Copyright © 2016年 郑鹏. All rights reserved.
//

#import "ViewController.h"
#import "StarGradeView.h"

@interface ViewController ()<StarGradeViewDelegate>{

    UILabel *_label;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //比如 满分100 分
    //显示分数
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0,160 , [UIScreen mainScreen].bounds.size.width, 40)];
    _label.backgroundColor = [UIColor orangeColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    //打分视图的使用
    StarGradeView *view = [[StarGradeView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40) withtNumberOfPart:5];
    view.delegate = self;
    [self.view addSubview:view];
}
- (void)didSelectedIndex:(NSString *)index{
    
    NSString *grade = [NSString stringWithFormat:@"%ld",[index integerValue]*20];
    _label.text = [NSString stringWithFormat:@"%@分",grade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
