//
//  BYAlertView.h
//  MyAlertView
//
//  Created by miwer on 16/8/22.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYAlertView : UIView

@property(nonatomic,copy)void (^sureBlock)();

+(BYAlertView *)viewFromNibWithTitle:(NSString *)title;

@end
