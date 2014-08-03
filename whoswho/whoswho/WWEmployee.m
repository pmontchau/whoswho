//
//  WWEmployee.m
//  whoswho
//
//  Created by Pauline on 27/07/2014.
//  Copyright (c) 2014 Pauline. All rights reserved.
//

#import "WWEmployee.h"

@implementation WWEmployee


-(UIImage*)blurPicture:(UIImage*)pic{
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianBlurFilter setDefaults];
    [gaussianBlurFilter setValue:[CIImage imageWithCGImage:[pic CGImage]] forKey:kCIInputImageKey];
    [gaussianBlurFilter setValue:@10 forKey:kCIInputRadiusKey];
    
    CIImage *outputImage = [gaussianBlurFilter outputImage];
    CIContext *context   = [CIContext contextWithOptions:nil];
    CGRect rect          = [outputImage extent];

    rect.origin.x        += (rect.size.width  - pic.size.width ) / 2;
    rect.origin.y        += (rect.size.height - pic.size.height) / 2;
    rect.size            = pic.size;
    
    CGImageRef cgimg     = [context createCGImage:outputImage fromRect:rect];
    UIImage *image       = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);
    return image;
}

-(UIImage*)roundPicture:(UIImage *)pic{
    UIImageView *employeeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIGraphicsBeginImageContextWithOptions(employeeImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:employeeImageView.bounds cornerRadius:(employeeImageView.frame.size.height /2)] addClip];
    [pic drawInRect:employeeImageView.bounds];
    UIImage *roundedPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return roundedPic;
}

-(void)setPicture:(UIImage *)pic blur:(BOOL)blur round:(BOOL)round{
    if (pic){
        if (round == YES)
            _picture = [self roundPicture:pic];
        else
            _picture = pic;
        if (blur == YES)
            _bluredPicture = [self blurPicture:pic];
    }
}

@end
