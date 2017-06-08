//
//  UIImage+Utils.h
//  CoreMLDemo
//
//  Created by chenyi on 08/06/2017.
//  Copyright © 2017 chenyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

- (UIImage *)scaleToSize:(CGSize)size;
- (CVPixelBufferRef)pixelBufferFromCGImage:(UIImage *)image;

@end
