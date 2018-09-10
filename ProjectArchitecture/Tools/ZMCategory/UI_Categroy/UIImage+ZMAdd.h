//
//  UIImage+ZMAdd.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZMAdd)

// kCompressionQuality不要调太低，会出现有时显示出黑图的异常情况 一般 0.3～0.7差不多了
#pragma mark -----------------------"  压缩_本地图片，不及时释放内存  "--------------------------------
// 图片压缩：PNG
+ (UIImage *)zm_compressPngImageName:(NSString*)imageName;
// 图片压缩：JPEG		1.0
+ (UIImage *)zm_compressJPEGImageName:(NSString*)imageName;
// 图片压缩：JPEG		kCompressionQuality
+ (UIImage *)zm_compressImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality;


#pragma mark -----------------------"  压缩_本地图片，及时释放内存  "---------------------------------
// PNG
+ (UIImage *)zm_compressBundlePathPngImageName:(NSString*)imageName;
// JPEG	 1.0
+ (UIImage *)zm_compressBundlePathJPEGImageName:(NSString*)imageName;
// JPEG  kCompressionQuality
+ (UIImage *)zm_compressBundlePathImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality;



#pragma mark ------------------"  UIImage 保存\读取_本地沙盒Path  "---------------------------------
// 保存图片
- (void)zm_storageImage:(UIImage *)Image withImagePath:(NSString *)ImgPath;
// 读取图片
- (UIImage *)zm_getImageWithPath:(NSString *)ImgPath;



#pragma mark ------------------"  UIImage、Base64 互转  "---------------------------------
// UIImage ----> Base64字符
- (NSString *)zm_encodedImageToBase64WithImage:(UIImage *)_image;
// Base64字符---> UIImage
- (UIImage *)zm_decodingBase64ToImageWithString:(NSString *)_imageString;


//等比例压缩
+ (UIImage *)zm_imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


/**
 *  调整图片大小
 *
 *  @param imgName 图片名
 */
+ (instancetype)zm_resizeImage:(NSString *) imgName;

/**
 *  返回拉伸好的图片
 */
+ (UIImage *)zm_stretchableImage:(NSString *)imgName;

- (UIImage *)zm_stretchableImage;


/**
 *  图形变圆并加上边框
 *
 *  @param name        图片名
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype)zm_circleImageWithName:(NSString *) name borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor;

+ (instancetype)zm_captureWithView:(UIView *)view;


// 视频根据url获取第一帧图片,获取任一帧图片
+ (UIImage*)zm_thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;


@end
