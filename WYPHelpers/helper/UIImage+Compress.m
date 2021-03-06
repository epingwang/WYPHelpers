//
//  compress.m
//  WPWProject
//
//  Created by 王易平 on 13-7-16.
//  Copyright (c) 2013年 王易平. All rights reserved.
//

#import "UIImage+Compress.h"
#define MAX_IMAGEPIX 160.0 // max pix 200.0px
#define MAX_IMAGEDATA_LEN 100000.0 // max data length 300k

@implementation UIImage (Compress)
//图像尺寸压缩
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    UIGraphicsEndImageContext();
    return newImage;
}
//图像尺寸压缩
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

-(UIImage *)compressedImageWithMaxSize:(CGSize)maxSize
{
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    if (width <= maxSize.width && height <= maxSize.height) {
        // no need to compress.
        return self;
    }
    
    if (width == 0 || height == 0) {
        // void zero exception
        return self;
    }
    
    UIImage *newImage = nil;
    CGFloat widthFactor = maxSize.width / width;
    CGFloat heightFactor = maxSize.height / height;
    CGFloat scaleFactor = 0.5;
    
    if (widthFactor > heightFactor)
        scaleFactor = heightFactor; // scale to fit height
    else
        scaleFactor = widthFactor; // scale to fit width
    
    CGFloat scaledWidth = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    CGSize targetSize = CGSizeMake(scaledWidth, scaledHeight);
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [self drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(UIImage *)compressedImage {
    return [self compressedImageWithMaxSize:CGSizeMake(MAX_IMAGEPIX, MAX_IMAGEPIX)];
}

-(UIImage *)compressWithScale:(float)scale
{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width*scale,self.size.height*scale));
    [self drawInRect:CGRectMake(0, 0, self.size.width*scale, self.size.height *scale)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


-(NSData *)compressedData:(CGFloat)compressionQuality {
    assert(compressionQuality <= 1.0 && compressionQuality >= 0);
    
    return UIImageJPEGRepresentation(self, compressionQuality);
}

-(CGFloat)compressionQuality {
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    NSUInteger dataLength = [data length];
    if(dataLength > MAX_IMAGEDATA_LEN) {
        return 1.0 - MAX_IMAGEDATA_LEN / dataLength;
    } else {
        return 1.0;
    }
}

-(NSData *)compressedData {
    CGFloat quality = [self compressionQuality];
    
    return [self compressedData:quality];
}


-(NSData *)compressedDataWithRate
{
    UIImage *img=nil;

    if (self.size.width > 480 ) {
        
        float rate = 480 * 1.0 / self.size.width < 720 * 1.0 / self.size.height ? 480 * 1.0 / self.size.width : 720 * 1.0 / self.size.height;
        
        int toheight = self.size.height * rate;
        int towidth = self.size.width * rate;
        
        img = [self imageByScalingAndCroppingForSize:CGSizeMake(towidth, toheight)];
    }else{
        int toheight = self.size.height;
        int towidth = self.size.width;
        
        img = [self imageByScalingAndCroppingForSize:CGSizeMake(towidth, toheight)];
    }
  
    NSData * data = [img compressedData];
    return data;
}

@end

