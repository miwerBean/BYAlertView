//
//  MyContentView.m
//  MyAlertView
//
//  Created by bean on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#import "MyContentView.h"

@implementation MyContentView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.titleLabel.font = BYScaleTextFont(25);
    
    NSLog(@"%@",self.titleLabel.font);

}

+(MyContentView *)contentView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    
}
- (IBAction)buttonClick:(id)sender {
    
    if (self.contentBlock) {
        self.contentBlock();
    }
}


@end
