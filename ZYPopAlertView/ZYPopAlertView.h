//
//  ZYPopAlertView.h
//  zy_test1
//
//  Created by ZY on 15/8/21.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ZYPopAlertUpOrDown
{
    ZYPopAlertViewUp,
    ZYPopAlertViewDown
    
}ZYPopAlertUpOrDown;

@interface ZYPopAlertView : UIView

/**
 *  ZYPopAlertView init function
 *
 *  @param oringeX          弹出框的x坐标
 *  @param width            弹出框的宽度（宽度给定，高度自适应---高度可以赋任意值）
 *  @param point            弹出框三角形的中点坐标，一般为控件的中点
 *  @param message          弹出信息
 *  @param upOrDown         弹出框的方向（向上还是向下）
 *
 *  @return self
 */

-(id)initWithWidthOringeX:(CGFloat)oringeX
                    width:(CGFloat)width
            trianglePoint:(CGPoint)point
                  message:(NSString *)message
                 upOrDown:(ZYPopAlertUpOrDown)upOrDown;

/*
    三角形的宽  （非必填---默认是10）
 */
@property (nonatomic, assign) CGFloat outTigonWidth;

/*
    三角形的高  （非必填---默认是8）
 */
@property (nonatomic, assign) CGFloat outTigonHigh;         //三角形的高

@end
