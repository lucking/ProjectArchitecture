//
//  FileManager.m
//  HuiFang
//
//  Created by ZM on 15/11/27.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "FileManager.h"
#import "UIImage+ZMAdd.h"

@implementation FileManager


-(void)baseUse {

	UIImage  *image = [UIImage imageNamed:@"1.jpg"];
	//管理文件：路径
	NSString *imagePath = ImagePath(@"520.png");
	NSLog(@"ImagePath = %@",imagePath);
	//保存图片
	[image storageImage:image withImagePath:imagePath];
	//读取图片
	UIImage* readImage = [image getImageWithPath:imagePath];

	UIImageView *imageview= [[UIImageView alloc]initWithFrame:CGRectMake(10, 70, 150, 200)];
	imageview.image= readImage;


	// UIImage转成base64字符串
	NSString* encodedImage = [image encodedImageToBase64WithImage:image];
	//NSLog(@"EncodedImage= %@ \n ", encodedImage);

	// Base64字符串转UIImage
	UIImage* decodedImage = [image decodingBase64ToImageWithString:encodedImage];
	NSLog(@"DecodedImage.size= %@", NSStringFromCGSize(decodedImage.size)); //显示图片大小尺寸 600 x 400


	//判断文件是否存在
	[self isExistFilePath:imagePath];
	//删除文件
	[self removeFilePath:imagePath];


	// 创建文件夹
	[self createImageFile];	//[self removeFilePath:_imageFilesPath]; //移动文件夹
	// 创建文件夹的 文件路径
	_imageFilePath1= [_imageFilesPath stringByAppendingPathComponent:@"imageFilePath1"];
	_imageFilePath2= [_imageFilesPath stringByAppendingPathComponent:@"imageFilePath2"];

}

NSString *applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

-(NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}



//- 获取沙盒Document的文件目录
+ (NSString *)getDocumentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// 获取沙盒Library的文件目录
+ (NSString *)getLibraryDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

// 获取沙盒Library/Caches的文件目录
+ (NSString *)getCachesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

// 获取沙盒Preference的文件目录
+ (NSString *)getPreferencePanesDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

// 获取沙盒tmp的文件目录
+ (NSString *)getTmpDirectory{
    return NSTemporaryDirectory();
}





#pragma mark  创建文件夹
- (void)createImageFile{

	_imageFilesPath = [NSString stringWithFormat:@"%@/ImageCaches/%@", NSHomeDirectory(), @"imageFile"];
	//以上3种路径皆可使用
	NSFileManager *fileManager = [NSFileManager defaultManager];
	BOOL isDirect = NO;
	BOOL existed = [fileManager fileExistsAtPath:_imageFilesPath isDirectory:&isDirect];

	if ( !(isDirect == YES && existed == YES) ){

		[fileManager createDirectoryAtPath:_imageFilesPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
}

#pragma mark  判断文件是否存在
- (BOOL)isExistFilePath:(NSString *)Path{
	//管理文件
	NSFileManager *fileManager= [NSFileManager defaultManager];
	BOOL isExist= [fileManager fileExistsAtPath:Path];
	if (isExist){	NSLog(@"文件存在");
		return YES;
	}else{			NSLog(@"文件不存在");
		return NO;
	}
}
#pragma mark  读取文件
- (NSData *)getFileWithPath:(NSString *)path{
	NSData*  readData=	[NSData dataWithContentsOfFile:path];
	return readData;
}
#pragma mark  移动文件
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath{
	NSFileManager *fileManager = [[NSFileManager alloc] init]; //最好不要用defaultManager。
	NSError *error;
	BOOL isSuccess = [fileManager moveItemAtPath:atPath toPath:toPath error:&error];
	if (isSuccess) {
		NSLog(@"移动文件成功 \n");
		return YES;
	}else{
		NSLog(@"移动文件失败 \n");
		return NO;
	}
}
#pragma mark  复制文件
- (BOOL)copyFileAtPath:(NSString *)atPath toPath:(NSString *)toPath{

	NSFileManager *fileManager = [[NSFileManager alloc]init]; //最好不要用defaultManager。
	NSError *error;
	BOOL isSuccess = [fileManager copyItemAtPath:atPath toPath:toPath error:&error];
	if (isSuccess) {
		NSLog(@"复制文件 成功 \n");
		return YES;
	}else{
		NSLog(@"复制文件 失败 \n");
		return NO;
	}
}
#pragma mark  删除文件
- (void)removeFilePath:(NSString *)Path{

	NSFileManager *fileManager= [NSFileManager defaultManager];

	if ([fileManager fileExistsAtPath:Path]) {//如果文件存在，则删除文件
		[fileManager removeItemAtPath:Path error:nil];
	}
	if (![fileManager fileExistsAtPath:Path]){
		NSLog(@"Path：文件已删除");
	}
}
/**
 *  将文件写入指定路径
 *
 *  @param file     文件
 *  @param filePath     路径(默认是沙盒的document下)
 *  @param fileName 文件名
 */
+ (void)writeNewFileToPath:(id)file WithPath:(NSString *)filePath WithFileName:(NSString *)fileName
{
	NSData *data = [[NSData alloc] init];
	if ([file isKindOfClass:[UIImage class]]) {
		data = UIImagePNGRepresentation((UIImage *)file);
	}
	// 如果filepath不为空,就按指定路径
	NSString *path = filePath==nil ? [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName] : [filePath stringByAppendingPathComponent:fileName];

	[data writeToFile:path atomically:YES];
}

@end
