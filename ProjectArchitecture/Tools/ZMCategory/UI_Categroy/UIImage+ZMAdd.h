//
//  UIImage+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZMAdd)
{

}

// kCompressionQuality不要调太低，会出现有时显示出黑图的异常情况 一般 0.3～0.7差不多了
#pragma mark -----------------------"  压缩_本地图片，不及时释放内存  "--------------------------------
// 图片压缩：PNG
+ (UIImage *)compressPngImageName:(NSString*)imageName;
// 图片压缩：JPEG		1.0
+ (UIImage *)compressJPEGImageName:(NSString*)imageName;
// 图片压缩：JPEG		kCompressionQuality
+ (UIImage *)compressImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality;


#pragma mark -----------------------"  压缩_本地图片，及时释放内存  "---------------------------------
// PNG
+ (UIImage *)compressBundlePathPngImageName:(NSString*)imageName;
// JPEG	 1.0
+ (UIImage *)compressBundlePathJPEGImageName:(NSString*)imageName;
// JPEG  kCompressionQuality
+ (UIImage *)compressBundlePathImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality;



#pragma mark ------------------"  UIImage 保存\读取_本地沙盒Path  "---------------------------------
// 保存图片
- (void)storageImage:(UIImage *)Image withImagePath:(NSString *)ImgPath;
// 读取图片
- (UIImage *)getImageWithPath:(NSString *)ImgPath;



#pragma mark ------------------"  UIImage、Base64 互转  "---------------------------------
// UIImage ----> Base64字符
- (NSString *)encodedImageToBase64WithImage:(UIImage *)_image;
// Base64字符---> UIImage
- (UIImage *)decodingBase64ToImageWithString:(NSString *)_imageString;


//等比例压缩
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


/**
 *  调整图片大小
 *
 *  @param imgName 图片名
 */
+ (instancetype) resizeImage:(NSString *) imgName;

/**
 *  返回拉伸好的图片
 */
+ (UIImage *)stretchableImage:(NSString *)imgName;

- (UIImage *)stretchableImage;


/**
 *  图形变圆并加上边框
 *
 *  @param name        图片名
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype) circleImageWithName:(NSString *) name borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor;

+ (instancetype) captureWithView:(UIView *)view;


// 视频根据url获取第一帧图片,获取任一帧图片
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;


@end
