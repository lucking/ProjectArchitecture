//
//  UIImage+ZMAdd.m
//  ZMArchitecture
//
//  Created by ZM on 16/5/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "UIImage+ZMAdd.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (ZMAdd)


#pragma mark -----------------------"  压缩_本地图片，不及时释放内存，加载的比较快  "---------------------------------
// 图片压缩：PNG
+ (UIImage *)compressPngImageName:(NSString*)imageName
{
	UIImage *image = [UIImage imageNamed:imageName];
	NSData *imageData = UIImagePNGRepresentation(image);
	return [UIImage imageWithData:imageData];
}
// 图片压缩：JPEG		1.0
+ (UIImage *)compressJPEGImageName:(NSString*)imageName {

	UIImage *image = [UIImage imageNamed:imageName];
	NSData *imageData = UIImageJPEGRepresentation(image, (CGFloat) 1.0);
	return [UIImage imageWithData:imageData];
}
// 图片压缩：JPEG  kCompressionQuality
+ (UIImage *)compressImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality {

	UIImage *image = [UIImage imageNamed:imageName];

	NSData *imageData = UIImageJPEGRepresentation(image, kCompressionQuality);
	return [UIImage imageWithData:imageData];
}


#pragma mark -----------------------"  压缩_本地图片，及时释放内存，加载的比较慢  "---------------------------------
// PNG
+ (UIImage *)compressBundlePathPngImageName:(NSString*)imageName
{
	NSData *imageData = [self bundlePathImageName:imageName ofType:@"png" JPEGCompression:0];

	return [UIImage imageWithData:imageData];
}
// JPEG	 1.0
+ (UIImage *)compressBundlePathJPEGImageName:(NSString*)imageName {

	NSData *imageData = [self bundlePathImageName:imageName ofType:@"jpg" JPEGCompression:1.0f];
	return [UIImage imageWithData:imageData];
}
// JPEG  kCompressionQuality
+ (UIImage *)compressBundlePathImageName:(NSString*)imageName JPEGCompression:(CGFloat)kCompressionQuality {

	NSData *imageData = [self bundlePathImageName:imageName ofType:@"jpg" JPEGCompression:kCompressionQuality];
	return [UIImage imageWithData:imageData];
}
// 加载本地图片 选择压缩
+ (NSData *)bundlePathImageName:(NSString*)imageName ofType:(nullable NSString *)type JPEGCompression:(CGFloat)kCompress {

	NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:type];
	UIImage *image = [UIImage imageWithContentsOfFile:path];

	NSData *imageData = nil;

	if ([type isEqualToString:@"png"]) {
		imageData = UIImagePNGRepresentation(image);

	}else if ([type isEqualToString:@"jpg"]){
		imageData = UIImageJPEGRepresentation(image, kCompress);
	}
	return imageData;
}


- (void)test {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"imageName" ofType:@"png"];
	UIImage *image = [UIImage imageWithContentsOfFile:path];
	// 压缩
	NSData *imageData = UIImagePNGRepresentation(image);
	image = [UIImage imageWithData:imageData];

}


- (UIImage *)bundlepathForResource:(nullable NSString *)imageName  {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

#pragma mark ------------------"  UIImage 保存\读取_本地沙盒Path"---------------------------------
// 保存图片
- (void)storageImage:(UIImage *)Image withImagePath:(NSString *)ImgPath{

	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSData* imageData= UIImagePNGRepresentation(Image);
	[fileManager createFileAtPath:ImgPath contents:imageData attributes:nil];
}
// 读取图片
- (UIImage *)getImageWithPath:(NSString *)ImgPath{

	NSData*  readData=	[NSData dataWithContentsOfFile:ImgPath];
	UIImage* readImage= [UIImage imageWithData:readData];
	return readImage;
}



#pragma mark ------------------"  UIImage、Base64 互转 "---------------------------------
// UIImage ----> Base64字符
- (NSString *)encodedImageToBase64WithImage:(UIImage *)_image{

	NSData *myData = UIImageJPEGRepresentation(_image, 1.0f);
	NSString *encodedImage = [myData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];

	return encodedImage;
}
// Base64字符---> UIImage
- (UIImage *)decodingBase64ToImageWithString:(NSString *)_imageString{

	NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:_imageString options:NSDataBase64DecodingIgnoreUnknownCharacters];
	UIImage* image = [UIImage imageWithData:decodedImageData];

	return image;
}



//等比例压缩
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size {

	UIImage *newImage = nil;
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	CGFloat targetWidth = size.width;
	CGFloat targetHeight = size.height;
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
	if(CGSizeEqualToSize(imageSize, size) == NO){
		CGFloat widthFactor = targetWidth / width;
		CGFloat heightFactor = targetHeight / height;
		if(widthFactor > heightFactor){
			scaleFactor = widthFactor;
		}
		else{
			scaleFactor = heightFactor;
		}
		scaledWidth = width * scaleFactor;
		scaledHeight = height * scaleFactor;
		if(widthFactor > heightFactor){
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
		}else if(widthFactor < heightFactor){
			thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
		}
	}

	UIGraphicsBeginImageContext(size);

	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	[sourceImage drawInRect:thumbnailRect];
	newImage = UIGraphicsGetImageFromCurrentImageContext();

	if(newImage == nil){
		NSLog(@"scale image fail");
	}

	UIGraphicsEndImageContext();

	return newImage;

}




/**
 *   采用平铺方式放大图片
 *
 *  @param imgName 图片名
 *
 *  @return 放大后的图片
 */
+ (instancetype) resizeImage:(NSString *) imgName
{
	UIImage *img = [UIImage imageNamed:imgName];
	return  [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height * 0.5 , img.size.width * 0.5 , img.size.height * 0.5 , img.size.width * 0.5)];

}

#pragma mark 返回拉伸好的图片
+ (UIImage *)stretchableImage:(NSString *)imgName {
    return [[UIImage imageNamed:imgName] stretchableImage];
}

- (UIImage *)stretchableImage
{
    CGFloat leftCap = self.size.width * 0.5f;
    CGFloat topCap = self.size.height * 0.5f;
    return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}



/**
 */
+ (instancetype) circleImageWithName:(NSString *) name borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor
{
	// 1.加载原图
	UIImage *oldImage = [UIImage imageNamed:name];

	// 2.开启上下文
	CGFloat borderW = borderWidth;  // 圆环的宽度
	CGFloat imageW = oldImage.size.width + 2 *borderW;
	CGFloat imageH = oldImage.size.height + 2 * borderW;
	CGSize imageSize = CGSizeMake(imageW, imageH);
	UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);

	// 3.取得当前上下文
	CGContextRef ctx  = UIGraphicsGetCurrentContext();
	// 画边框(大圆)
	[borderColor set];
	CGFloat bigRadius = imageW * 0.5;
	CGFloat centerX = bigRadius;
	CGFloat centerY = bigRadius;
	// 4.绘制圆形
	CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
	CGContextFillPath(ctx);

	CGFloat smallRadius = bigRadius - borderW;
	CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);

	// 裁剪
	CGContextClip(ctx);

	[oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
	// 5.按照当前的路径形状(圆形)裁剪,超出这个形状以外的内容都不显示

	// CGContextClip(ctx);
	// 6. 画图
	// [oldImage drawInRect:circleRect];

	// 7. 取图
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

	// 8.结束
	UIGraphicsEndImageContext();

	return newImage;
}

+ (instancetype) captureWithView:(UIView *)view
{
	// 1.开启上下文
	UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
	// 2.将控制器的view的layer渲染到上下文
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
	// 3.取出图片
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	// 4.结束上下文
	UIGraphicsEndImageContext();

	return newImage;
}


//重新绘制图片的尺寸
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
	UIGraphicsBeginImageContext(newSize);
	[image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	NSData *imageData = UIImageJPEGRepresentation(newImage, 0.05);
	UIImage *needImage = [[UIImage alloc] initWithData:imageData];
	
	return needImage;
}


// 视频根据url获取第一帧图片,获取任一帧图片
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {

    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
        UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    
    return thumbnailImage;
    
}



@end
