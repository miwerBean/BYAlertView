//
//  AlertView.h
//  MyAlertView
//
//  Created by miwer on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIView

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *alert;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertHeightContraint;

@property(nonatomic,copy)void (^sureBlock)();
@property(nonatomic,copy)void (^cancelBlock)();

+(AlertView *)viewFromNibWithTitle:(NSString *)title message:(NSString *)message;


- (void)show;

@end
