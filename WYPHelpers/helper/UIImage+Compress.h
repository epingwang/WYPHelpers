//
//  compress.h
//  WPWProject
//
//  Created by 王易平 on 13-7-16.
//  Copyright (c) 2013年 王易平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

-(UIImage *)compressedImage;

-(UIImage *)compressedImageWithMaxSize:(CGSize) maxSize;

-(CGFloat)compressionQuality;

-(NSData *)compressedData;

-(NSData *)compressedDataWithRate;

-(NSData *)compressedData:(CGFloat)compressionQuality;

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

-(UIImage *)compressWithScale:(float)scale;

@end



