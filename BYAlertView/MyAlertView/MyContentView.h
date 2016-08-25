//
//  MyContentView.h
//  MyAlertView
//
//  Created by bean on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyContentView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UISlider *sliderView;

@property(copy,nonatomic)void (^ contentBlock) ();

+(MyContentView *)contentView;

@end
