//
//  WWEmployee.m
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWEmployee.h"

@implementation WWEmployee


-(UIImage*)bluredPicture{
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianBlurFilter setDefaults];
    [gaussianBlurFilter setValue:[CIImage imageWithCGImage:[self.picture CGImage]] forKey:kCIInputImageKey];
    [gaussianBlurFilter setValue:@10 forKey:kCIInputRadiusKey];
    
    CIImage *outputImage = [gaussianBlurFilter outputImage];
    CIContext *context   = [CIContext contextWithOptions:nil];
    CGRect rect          = [outputImage extent];

    rect.origin.x        += (rect.size.width  - self.picture.size.width ) / 2;
    rect.origin.y        += (rect.size.height - self.picture.size.height) / 2;
    rect.size            = self.picture.size;
    
    CGImageRef cgimg     = [context createCGImage:outputImage fromRect:rect];
    UIImage *image       = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);
    return image;
}

@end
