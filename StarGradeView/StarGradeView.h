//
//  StarGradeView.h
//  EcmCustomer
//
//  Created by 郑鹏 on 2016/11/4.
//  Copyright © 2016年 张进. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StarGradeViewDelegate <NSObject>

- (void)didSelectedIndex:(NSString *)index;

@end

@interface StarGradeView : UIView

@property (nonatomic, assign) id <StarGradeViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame withtNumberOfPart:(NSInteger)num;

@end
