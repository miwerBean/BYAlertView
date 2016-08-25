//
//  PrefixHeader.h
//  MyAlertView
//
//  Created by bean on 16/8/1.
//  Copyright © 2016年 miwer. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#define BYSCREEN_W [UIScreen mainScreen].bounds.size.width
#define BYSCREEN_H [UIScreen mainScreen].bounds.size.height

#define BYiPhone4_OR_4s  (BYSCREEN_H == 480)
#define BYiPhone5_OR_5c_OR_5s  (BYSCREEN_H == 568)
#define BYiPhone6_OR_6s  (BYSCREEN_H == 667)
#define BYiPhone6Plus_OR_6sPlus  (BYSCREEN_H == 736)

#define BYScale BYSCREEN_H/667

#define BYScaleWidth(n) BYScale*(n)
#define BYScaleTextFont(n) [UIFont systemFontOfSize:BYScale*(n)]

//#define 

#endif /* PrefixHeader_h */
