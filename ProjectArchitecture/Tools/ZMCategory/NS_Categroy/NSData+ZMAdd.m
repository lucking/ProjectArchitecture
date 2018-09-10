//
//  NSData+ZMAdd.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/2/8.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "NSData+ZMAdd.h"
#import "UIImage+ZMAdd.h"
#import <zlib.h>

@implementation NSData (ZMAdd)

// 测试使用方法
-(void)baseUse {
    
    UIImage  *image = [UIImage imageNamed:@"Default-568h@2x.png"];
    //保存图片
    [image zm_storageImage:image withImagePath:[self dataFilePath]];
    //读取图片
    //	UIImage* readImage = [self getImageWithPath:[self dataFilePath]];
    
    // NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
    // NSLog(@"data = %@ \n \n ",data);
    
    //1. NSData 与 NSString  字符串与数据
    NSString *aString = @"123456789_abcdefg";
    NSData *data11 = [NSData zm_stringToData:aString];
    NSString* str11= [NSData zm_dataToString:data11];
    NSLog(@"str11 = %@ \n ",str11);
    
    
    //2. NSData 与 UIImage  图片与数据
    UIImage *readImage = [UIImage imageWithContentsOfFile:[self dataFilePath]];
    NSData* data22 = [NSData zm_imageToData:readImage];
    UIImage *image22=[NSData zm_dataToImage:data22];
    NSLog(@"image22 = %@ \n ",image22);
    
    
    //3.NSData 与 NSDictionary 字典与数据
    NSDictionary *myDic = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"balance", @"key",
                           @"remaining balance", @"label",
                           @"45", @"value",
                           @"USD", @"currencyCode",nil];
    NSData *data33 = [NSData zm_dictionaryToData:myDic];
    NSDictionary* dic33 = [NSData zm_dataToDictionary:data33];
    NSLog(@"dic33 = %@ \n ",dic33);
    
    
    //5.数据：压缩、解压
    NSData *myData = [[NSData alloc] init];
    //对数据进行压缩： ZipAndUnzip
    NSString *strAA = @"六六六六了还是德国大使馆和低俗化工及第三方换个撒点恢复健康的十分好的设计哈佛的号发的撒开了凤凰健康的十分健康的沙发";
    NSData *data = [strAA dataUsingEncoding:NSUTF8StringEncoding];
    NSData *dataDeflate = [myData zm_gzipDeflate:data];
    
    // 对数据进行解压：
    NSData *dataInflate =  [myData zm_gzipInflate:dataDeflate];
    NSString *strBB = [[NSString alloc] initWithData:dataInflate encoding:NSUTF8StringEncoding];
    
    NSLog(@"data = %@ \n ",data);
    NSLog(@"dataDeflate = %@ \n ",dataDeflate);
    NSLog(@"dataInflate = %@ \n ",dataInflate);
    NSLog(@"strBB = %@ \n ",strBB);
    
    float  length1= (float)[data length]/1024.0f;
    float  length2= (float)[dataDeflate length]/1024.0f;
    float  length3= (float)[dataInflate length]/1024.0f;
    
    NSLog(@"length1 = %f ",length1);
    NSLog(@"length2 = %f ",length2);
    NSLog(@"length3 = %f \n ",length3);
}

+ (void)nowTest {
    //Byte 转化为 NSData
    Byte byte[] = {0x55, 0x07, 0x02, 0x01, 0x1A, 0x01, 0xAA};
    NSData *data1 = [NSData dataWithBytes:byte length:7];

    //NSData 转化为 Byte
    NSString *testString = @"1234567890";
    NSData *testData1 = [testString dataUsingEncoding: NSUTF8StringEncoding];
    Byte *testByte = (Byte *)[testData1 bytes];
    
    for(int i=0;i<[testData1 length];i++)
    printf("testByte_%d = %s",i,testByte);
    
    NSLog(@"---data1= %@",data1);
    NSLog(@"---testByte= %s \n ",testByte);

    //int 转化为 NSData
    int i = 150;
    NSData *data2 = [NSData dataWithBytes:&i length: sizeof(i)];
    
    //NSData 转化为 int
    int age;
    [data2 getBytes: &age length: sizeof(age)];
    NSLog(@"---age= %d \n \n ",age);
    //作者：跑调的安眠曲 链接：http://www.jianshu.com/p/596ca5567edd
}

- (NSString *)dataFilePath{
    NSString *imagePath= [NSHomeDirectory() stringByAppendingPathComponent:@"Default-568h@2x.png"];
    return imagePath;
}

#pragma mark ------------------"  1. NSData 与 NSString  字符串与数据 "---------------------------------
//  NSString－>NSData
+ (NSData *)zm_stringToData:(NSString *)myString {
    NSData *data = [myString dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}
//  NSData－> NSString
+ (NSString *)zm_dataToString:(NSData *)myData {
    NSString *string = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    return string;
}

#pragma mark ------------------"  2. Base64_Str 与 NSString  Base64字符串与字符串 "---------------------
// 将字符串转换成 base64编码
- (NSString*)zm_base64EncodedString: (NSString*)string {
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];	// 将字符串转换成二进制数据
    return [data base64EncodedStringWithOptions:0];	// 返回base64编码后的结果
}
// 将base64编码转换成 字符串
- (NSString *)zm_base64DecodeToString:(NSString *)string {
    // 将 base64 编码后的字符串"解码"成二进制数据
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    // 返回字符串解码后的结果
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark -----------------"  3. NSData 与 UIImage  图片与数据 "---------------------------------
//  UIImage－> NSData
+ (NSData *)zm_imageToData:(UIImage *)myImage {
    
    NSData *data= UIImagePNGRepresentation(myImage);// PNG 格式的图片
    return data;
}
//  NSData－>UIImage
+ (UIImage *)zm_dataToImage:(NSData *)myData {
    
    UIImage*  image= [UIImage imageWithData:myData];
    return image;
}


#pragma mark-----------------"  4.NSData 与 NSDictionary 字典与数据 "---------------------------------

// 利用KeyedArchiver：NSDictionary -> NSData
+ (NSData *)zm_dictionaryToData:(NSDictionary *)myDic
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:myDic forKey:@"Some Key Value"];
    [archiver finishEncoding];
    return data;
}
// 利用KeyedUnarchiver：NSData -> NSDictionary
+ (NSDictionary *)zm_dataToDictionary:(NSData *)myData {
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
    NSDictionary *myDictionary = [unarchiver decodeObjectForKey:@"Some Key Value"] ;
    [unarchiver finishDecoding];
    return myDictionary;
}

// 利用JSON：data -> NSDictionary
+ (NSDictionary *)zm_dictionaryWithContentsOfData:(NSData *)myData {
    //获得的json先转换成字符串
    NSString *receiveStr = [[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
    //字符串再生成NSData
    NSData * data = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
    //再解析
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return jsonDict;
}


#pragma mark-----------------"  5.数据：压缩、解压 "---------------------------------
//数据压缩
- (NSData *)zm_gzipDeflate:(NSData*)data
{
    if ([data length] == 0) return data;
    
    z_stream strm;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.total_out = 0;
    strm.next_in=(Bytef *)[data bytes];
    strm.avail_in = (uInt)[data length];
    
    // Compresssion Levels:
    //   Z_NO_COMPRESSION
    //   Z_BEST_SPEED
    //   Z_BEST_COMPRESSION
    //   Z_DEFAULT_COMPRESSION
    
    if (deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED, (15+16), 8, Z_DEFAULT_STRATEGY) != Z_OK) return nil;
    
    NSMutableData *compressed = [NSMutableData dataWithLength:16384];  // 16K chunks for expansion
    do {
        if (strm.total_out >= [compressed length])
            [compressed increaseLengthBy: 16384];
        
        strm.next_out = [compressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([compressed length] - strm.total_out);
        
        deflate(&strm, Z_FINISH);
        
    } while (strm.avail_out == 0);
    deflateEnd(&strm);
    
    [compressed setLength: strm.total_out];
    return [NSData dataWithData:compressed];
}

//数据解压
- (NSData *)zm_gzipInflate:(NSData*)data
{
    if ([data length] == 0) return data;
    
    unsigned long full_length = [data length];
    unsigned long  half_length = [data length] / 2;
    
    NSMutableData *decompressed = [NSMutableData dataWithLength: full_length + half_length];
    BOOL done = NO;
    int status;
    
    z_stream strm;
    strm.next_in = (Bytef *)[data bytes];
    strm.avail_in = (uInt)[data length];
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    
    if (inflateInit2(&strm, (15+32)) != Z_OK)
        return nil;
    while (!done)
    {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length])
            [decompressed increaseLengthBy: half_length];
        strm.next_out = [decompressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([decompressed length] - strm.total_out);
        
        // Inflate another chunk.
        status = inflate (&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END)
            done = YES;
        else if (status != Z_OK)
            break;
    }
    if (inflateEnd (&strm) != Z_OK)
        return nil;
    // Set real length.
    if (done){
        [decompressed setLength: strm.total_out];
        return [NSData dataWithData: decompressed];
    }
    else return nil;
}

@end
