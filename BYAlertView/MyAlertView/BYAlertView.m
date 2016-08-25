//
//  BYAlertView.m
//  MyAlertView
//
//  Created by miwer on 16/8/22.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import "BYAlertView.h"

#define BYSCREEN_W [UIScreen mainScreen].bounds.size.width

@interface BYAlertView ()
@property (weak, nonatomic) IBOutlet UIView *alert;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertWidthContraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *alertHeightContraints;

@end

@implementation BYAlertView
- (IBAction)cancelAction:(id)sender {
    [self hideView];
}

- (IBAction)sureAction:(id)sender {
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self hideView];
}

+(BYAlertView *)viewFromNibWithTitle:(NSString *)title{
    
    BYAlertView * alert = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    alert.titleLabel.text = title;
    
    [alert show];
    
    return alert;
}
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = [UIScreen mainScreen].bounds;
    [self shakeToShow:self.alert];
}
-(void)hideView{
    [UIView animateWithDuration:0.2 animations:^{
        self.alert.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    
    self.alertWidthContraints.constant = BYSCREEN_W / 375 * (240);
    self.alertHeightContraints.constant = BYSCREEN_W / 375 * (100);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    if (!CGRectContainsPoint(self.alert.frame,touchPoint)) {
        [self hideView];
    }
}
- (void) shakeToShow:(UIView*)aView{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
    
}


@end
