//
//  AVCaptureComm.m
//  WJQRCode
//
//  Created by 徐庆标 on 2018/5/20.
//  Copyright © 2018年 徐庆标. All rights reserved.
//

#import "AVCaptureComm.h"

@implementation AVCaptureComm
+ (CGFloat)changeVideoScale:(AVMetadataMachineReadableCodeObject *)avobjc {
    NSArray *array = avobjc.corners;
    CGPoint point = CGPointZero;
    int index = 0;
    CFDictionaryRef dict = (__bridge CFDictionaryRef)(array[index++]);
    CGPointMakeWithDictionaryRepresentation(dict, &point);
    CGPoint point2 = CGPointZero;
    CGPointMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)array[2], &point2);
    CGFloat scace =40/(point2.x-point.x);
    return scace;
}
@end
