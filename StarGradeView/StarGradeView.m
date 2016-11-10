//
//  StarGradeView.m
//  EcmCustomer
//
//  Created by 郑鹏 on 2016/11/4.
//  Copyright © 2016年 张进. All rights reserved.
//

#import "StarGradeView.h"

@interface StarGradeView(){

    UIView *_btnView;//放星星的背景view
    UIView *_shouView;//放星星的背景view
    CGFloat _height;//星星的高
    NSInteger _btnNum;//按钮的数量
    
    NSInteger _index;//第几个
}

@end
@implementation StarGradeView


- (instancetype)initWithFrame:(CGRect)frame withtNumberOfPart:(NSInteger)num{
    self = [super initWithFrame:frame];
    
    _height = frame.size.height;
    _btnNum = num;
    
    CGFloat selfW = frame.size.width;
    CGFloat starW = frame.size.height;
    
    _btnView = [[UIView alloc] initWithFrame:CGRectMake((selfW - starW*num)/2 , 0, starW*num, starW)];
    
    for (int i = 0; i< num; i++) {
        UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        starBtn.frame = CGRectMake(starW * i, 0, starW, starW);
        
        [starBtn setImage:[UIImage imageNamed:@"star_off"] forState:UIControlStateNormal];
        [starBtn setImage:[UIImage imageNamed:@"star_on"] forState:UIControlStateSelected];
      
        starBtn.tag = 1991+i;
        
        [starBtn setAdjustsImageWhenHighlighted:NO];

        [_btnView addSubview:starBtn];
    }
    
    
    _shouView = [[UIView alloc] initWithFrame:CGRectMake(0 , 0, starW*num, starW)];
    [_btnView addSubview:_shouView];

    [self addSubview:_btnView];
    
    return self;
}
//滑动需要的。
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [self getTouchPoint:touches];
    
    int j = (int)(point.x/_height);
    _index = j;
    
    for (NSInteger i = 0; i < _btnNum; i++) {
    
        if (i<=j) {
            UIButton *btn = [_btnView viewWithTag:i+1991];
            btn.selected = YES;

        }else{
        
            UIButton *btn = [_btnView viewWithTag:i+1991];
            btn.selected = NO;
        }
    }
   
}
//滑动需要的。
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint point = [self getTouchPoint:touches];
    
    int j = (int)(point.x/_height);
    _index = j;
    
    for (NSInteger i = 0; i < _btnNum; i++) {
        
        if (i<=j) {
            UIButton *btn = [_btnView viewWithTag:i+1991];
            btn.selected = YES;
            
        }else{
            
            UIButton *btn = [_btnView viewWithTag:i+1991];
            btn.selected = NO;
        }
    }
   
   
}
//滑动需要的。
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:[NSString stringWithFormat:@"%ld",_index+1]];
    }
}
//取到 手势 在屏幕上点的 位置point
- (CGPoint)getTouchPoint:(NSSet<UITouch *>*)touches{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:_shouView];
    return point;
    
}
//如果点击的范围在 按钮的区域
- (BOOL)pointInBtn:(UIButton *)btn WithPoint:(CGPoint)point{
    
    if (CGRectContainsPoint(btn.frame, point)) {
        return YES;
    }else{
        return NO;
    }
    
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
