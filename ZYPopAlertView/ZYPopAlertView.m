//
//  ZYPopAlertView.m
//  zy_test1
//
//  Created by ZY on 15/8/21.
//  Copyright (c) 2015年 ZY. All rights reserved.
//
#define UISCREEN_BOUNDS_SIZE      [UIScreen mainScreen].bounds.size // 屏幕的物理尺寸

#import "ZYPopAlertView.h"

@interface ZYPopAlertView()
{
    CGFloat cornerRadius;           //圆弧角度
    CGFloat alertOringeX;           //空间X轴坐标
    CGFloat alertWidth;             //alertView宽度
    CGFloat alertHigh;              //alertView高度
    
    CGFloat trigonWidth;            //三角形的宽度
    CGFloat trigonHigh;             //三角形的高度
    CGFloat trigonCenterx;          //三角形的顶部x坐标
    CGFloat trigonCentery;          //三角形的顶部y坐标
    
    NSString * myMessage;           //文字内容
    ZYPopAlertUpOrDown myUpOrDown;    //弹出框的方向 （向上还是向下）
}
@end

@implementation ZYPopAlertView

@synthesize outTigonWidth = _outTigonWidth;
@synthesize outTigonHigh = _outTigonHigh;

-(id)init
{
    self = [super init];
    if(self)
    {
        UIApplication * application = [UIApplication sharedApplication];
        if([[application keyWindow] viewWithTag:70000])
        {
            return nil;
        }
        self.tag = 70000;
        
        self.frame = CGRectMake(0, 0, UISCREEN_BOUNDS_SIZE.width, UISCREEN_BOUNDS_SIZE.height);
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(id)initWithWidthOringeX:(CGFloat)oringeX width:(CGFloat)width trianglePoint:(CGPoint)point message:(NSString *)message upOrDown:(ZYPopAlertUpOrDown)upOrDown
{
    self = [self init];
    if(self)
    {
        //初始化控件位置所需的参数
        cornerRadius = 6.0;                     //圆弧角度
        trigonWidth = 10;                       //三角形的宽度
        trigonHigh = 8;                         //三角形的高度
        trigonCenterx = point.x;                //三角形的顶部x坐标
        trigonCentery = point.y;                //三角形的顶部的y坐标
        
        alertOringeX = oringeX;
        alertWidth = width;                     //控件宽度
        
        CGSize high = [self getSize:message font:[UIFont systemFontOfSize:12] width:width-6];
        alertHigh = high.height+6;
        myMessage = message;
        myUpOrDown = upOrDown;
        
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismessClick)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}


-(void)setOutTigonWidth:(CGFloat)outTigonWidth
{
    _outTigonWidth = outTigonWidth;
    if(outTigonWidth == 0)
    {
        trigonWidth = 10;
    }
    else
    {
        trigonWidth = _outTigonWidth;
    }
}

-(void)setOutTigonHigh:(CGFloat)outTigonHigh
{
    _outTigonHigh = outTigonHigh;
    if(outTigonHigh == 0)
    {
        trigonHigh = 10;
    }
    else
    {
        trigonHigh = _outTigonHigh;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bubbleRect;
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 0.0, 1.0);	//黑色
    CGContextSetLineWidth(c, 1);
    
    CGMutablePathRef bubblePath = CGPathCreateMutable();
    
    if(myUpOrDown == ZYPopAlertViewUp)
    {
        bubbleRect = CGRectMake(alertOringeX, trigonCentery+trigonHigh, alertWidth, alertHigh);

        //起始点
        CGPathMoveToPoint(bubblePath, NULL, trigonCenterx, trigonCentery);
        //起始点到三角形右下角
        CGPathAddLineToPoint(bubblePath, NULL, trigonCenterx+trigonWidth/2, trigonCentery+trigonHigh);
        //三角形右下角 向右延伸至圆弧
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+cornerRadius,
                            cornerRadius);
        
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+bubbleRect.size.height,
                            bubbleRect.origin.x+bubbleRect.size.width-cornerRadius, bubbleRect.origin.y+bubbleRect.size.height,
                            cornerRadius);
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height,
                            bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height-cornerRadius,
                            cornerRadius);
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x, bubbleRect.origin.y,
                            bubbleRect.origin.x+cornerRadius, bubbleRect.origin.y,
                            cornerRadius);
        //最后圆弧到三角形左下角，准备进行闭合操作
        CGPathAddLineToPoint(bubblePath, NULL, trigonCenterx-trigonWidth/2, trigonCentery+trigonHigh);
    }
    else
    {
        bubbleRect = CGRectMake(alertOringeX, trigonCentery-trigonHigh-alertHigh, alertWidth, alertHigh);

        //起始点
        CGPathMoveToPoint(bubblePath, NULL, trigonCenterx, trigonCentery);
        //起始点到三角形左上角
        CGPathAddLineToPoint(bubblePath, NULL, trigonCenterx+trigonWidth/2, trigonCentery-trigonHigh);
        //三角形右上角 向右延伸至圆弧
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+bubbleRect.size.height,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+bubbleRect.size.height-cornerRadius,
                            cornerRadius);
        
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y,
                            bubbleRect.origin.x+bubbleRect.size.width-cornerRadius, bubbleRect.origin.y,
                            cornerRadius);
        
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x, bubbleRect.origin.y,
                            bubbleRect.origin.x, bubbleRect.origin.y+cornerRadius,
                            cornerRadius);
        
        CGPathAddArcToPoint(bubblePath, NULL,
                            bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height,
                            bubbleRect.origin.x+cornerRadius, bubbleRect.origin.y+bubbleRect.size.height,
                            cornerRadius);
        
        //最后圆弧到三角形左下角，准备进行闭合操作
        CGPathAddLineToPoint(bubblePath, NULL, trigonCenterx-trigonWidth/2, trigonCentery-trigonHigh);
    }
    
    CGPathCloseSubpath(bubblePath);
    
    CGContextSaveGState(c);
    CGContextAddPath(c, bubblePath);
    CGContextClip(c);
    CGContextSetFillColorWithColor(c, [UIColor colorWithRed:0.0/255.0 green:178.0/255.0 blue:249.0/255.0 alpha:1.0].CGColor);
    CGContextFillRect(c, self.bounds);
    
    //3D
    CGContextSaveGState(c);
    CGMutablePathRef innerShadowPath = CGPathCreateMutable();
    // add a rect larger than the bounds of bubblePath
    CGPathAddRect(innerShadowPath, NULL, CGRectInset(CGPathGetPathBoundingBox(bubblePath), -30, -30));
    // add bubblePath to innershadow
    CGPathAddPath(innerShadowPath, NULL, bubblePath);
    CGPathCloseSubpath(innerShadowPath);
    // draw top highlight
    UIColor *highlightColor = [UIColor colorWithWhite:1.0 alpha:0.75];
    CGContextSetFillColorWithColor(c, highlightColor.CGColor);
    CGContextSetShadowWithColor(c, CGSizeMake(0.0, 4.0), 4.0, highlightColor.CGColor);
    CGContextAddPath(c, innerShadowPath);
    CGContextEOFillPath(c);
    // draw bottom shadow
    UIColor *shadowColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    CGContextSetFillColorWithColor(c, shadowColor.CGColor);
    CGContextSetShadowWithColor(c, CGSizeMake(0.0, -4.0), 4.0, shadowColor.CGColor);
    CGContextAddPath(c, innerShadowPath);
    CGContextEOFillPath(c);
    
    CGPathRelease(innerShadowPath);
    CGContextRestoreGState(c);
    
    //添加文字
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    [myMessage drawInRect:CGRectMake(bubbleRect.origin.x+3, bubbleRect.origin.y+3, bubbleRect.size.width-6, bubbleRect.size.height-6) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:[UIColor whiteColor], NSParagraphStyleAttributeName:paragraphStyle}];
    
    //pop动画
    self.alpha = 0.2;
    
    // start a little smaller
    self.transform = CGAffineTransformMakeScale(0.75f, 0.9f);
    // animate to a bigger size
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(popAnimationDidStop)];
    [UIView setAnimationDuration:0.15f];
    self.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
    self.alpha = 1.0;
    [UIView commitAnimations];
}

- (void)popAnimationDidStop
{
    // at the end set to normal size
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    self.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

-(void)dismessClick
{
    [UIView beginAnimations:nil context:nil];
    self.alpha = 0.0;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissAnimationDidStop)];
    [UIView commitAnimations];
}

- (void)dismissAnimationDidStop
{
    [self removeFromSuperview];
    //self = nil;
}

// 计算label的高度
- (CGSize)getSize:(NSString *)detail font:(UIFont *)font width:(float)width
{
    CGSize constraint = CGSizeMake(width, 20000.0f);
    //    CGSize size = [detail sizeWithFont:font constrainedToSize:constraint lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = [detail boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    return size;
}

@end
