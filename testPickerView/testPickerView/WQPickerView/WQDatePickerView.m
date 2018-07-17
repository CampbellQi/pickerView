//
//  WQTimePickerView.m
//  tusstar
//
//  Created by fengwanqi on 15/7/13.
//  Copyright (c) 2015年 zxk. All rights reserved.
//

#import "WQDatePickerView.h"

@interface WQDatePickerView()

@property (weak, nonatomic) IBOutlet UIDatePicker *pickerView;

@end
@implementation WQDatePickerView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationCustom;
}
- (void)showFromController:(UIViewController *)controller ConfirmBlock:(ConfirmBlock)block {
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    [controller presentViewController:self animated:false completion:nil];
}

- (void)disappear {
    [self dismissViewControllerAnimated:false completion:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)dispearSelector:(id)sender {
    [self disappear];
}

- (IBAction)completeClicked:(id)sender {
    [self disappear];
    if (self.confirmBlock) {
        self.confirmBlock(self.pickerView.date);
    }
}

- (IBAction)cancelClicked:(id)sender {
    [self disappear];
}


@end
