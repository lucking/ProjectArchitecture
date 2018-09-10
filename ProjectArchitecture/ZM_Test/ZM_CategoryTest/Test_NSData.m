//
//  Test_NSData.m
//  ProjectArchitecture
//
//  Created by ZM on 2018/7/3.
//  Copyright © 2018年 ZM. All rights reserved.
//

#import "Test_NSData.h"
#import "NSData+ZMAdd.h"
#import "UIImage+ZMAdd.h"

@implementation Test_NSData

- (NSString *)dataFilePath{
    NSString *imagePath= [NSHomeDirectory() stringByAppendingPathComponent:@"Default-568h@2x.png"];
    return imagePath;
}

// 测试使用方法
-(void)baseUse {
    
    UIImage  *image = [UIImage imageNamed:@"Default-568h@2x.png"];
    //保存图片
    [image zm_storageImage:image withImagePath:[self dataFilePath]];
    //读取图片
    //    UIImage* readImage = [self getImageWithPath:[self dataFilePath]];
    
    
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
                           @"balance", @"key1",
                           @"remaining balance", @"label",
                           @"45", @"key3",
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
    
    //    float  length1= (float)[data length]/1024.0f;
    //    float  length2= (float)[dataDeflate length]/1024.0f;
    //    float  length3= (float)[dataInflate length]/1024.0f;
    //    NSLog(@"length1 = %f ",length1);
    //    NSLog(@"length2 = %f ",length2);
    //    NSLog(@"length3 = %f \n ",length3);
    
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


@end
