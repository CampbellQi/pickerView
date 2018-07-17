//
//  WQTimePickerView.h
//  tusstar
//
//  Created by fengwanqi on 15/7/13.
//  Copyright (c) 2015年 zxk. All rights reserved.
//
#define PICKERVIEW_HEIGHT 206



#import <UIKit/UIKit.h>

typedef void (^ConfirmBlock) (NSDate *date);

@interface WQDatePickerView : UIViewController<UIPickerViewDelegate>


@property (nonatomic, copy)ConfirmBlock confirmBlock;

- (void)showFromController:(UIViewController *)controller ConfirmBlock:(ConfirmBlock)block;


@end
