//
//  ZMCache.m
//  Architecture
//
//  Created by ZM on 16/9/1.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ZMCache.h"
#import "SDImageCache.h"

@implementation ZMCache


//============================"  使用测试  "=============================
- (void)test {
    //获取缓存大小
    NSString * cachePath =@"";
    CGFloat fileSize = [ZMCache folderSizeAtPath:cachePath];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *sd_FileSize  = [NSString stringWithFormat:@"%.2fMB",fileSize];
        NSLog(@"sd_FileSize ＝ %@",sd_FileSize );
    });
    //获取缓存文件大小_11
    [ZMCache getCachefileSizeTarget:self select:@selector(getCachefileSize:)];
    
}
//获取缓存文件大小_22
-(void)getCachefileSize:(id)object{
    
    NSString *fileSize  = (NSString*)object;
    NSLog(@"---> getCachefileSize = %@",fileSize);
    //清除缓存
    UIAlertView * aletrtVIew =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"是否清除内存？" delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
    [aletrtVIew show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex is : %li",(long)buttonIndex);
    if (buttonIndex==0){
        //直接调用myClearCacheAction清除缓存
        [ZMCache clearCache:^(NSError *error) {
            NSLog(@"---error= %@",error);
        } success:^{
            NSLog(@"缓存清理成功");
        }]; 
    }
}




#pragma mark - 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path{
    // 1.获得文件夹管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    // 2.检测路径的合理性
    BOOL dir = NO;
    BOOL exits = [manger fileExistsAtPath:path isDirectory:&dir];
    if (!exits) return 0;
    
    // 3.判断是否为文件夹
    if (dir) {
        // 文件夹, 遍历文件夹里面的所有文件
        // 这个方法能获得这个文件夹下面的所有子路径(直接\间接子路径)
        NSArray *subpaths = [manger subpathsAtPath:path];
        int totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
            
            BOOL dir = NO;
            [manger fileExistsAtPath:fullsubpath isDirectory:&dir];
            if (!dir) { // 子路径是个文件
                NSDictionary *attrs = [manger attributesOfItemAtPath:fullsubpath error:nil];
                totalSize += [attrs[NSFileSize] intValue];
            }
        }
        return totalSize;
    } else { // 文件
        NSDictionary *attrs = [manger attributesOfItemAtPath:path error:nil];
        return [attrs[NSFileSize] intValue] / (1024.0 * 1024.0);
    }
}

#pragma mark - 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath{
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
    return files;
}

#pragma mark - 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path{
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:path error:nil];
}

#pragma mark - 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath{
    
    //获得全部文件数组
    NSArray *fileAry =  [self getAllFileNames:dirPath];
    //遍历数组
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
        flag = [self clearCachesWithFilePath:filePath];
        
        if (!flag)
            break;
    }
    return flag;
}



// 获取缓存文件大小：遍历文件夹获得文件夹大小，返回多少M
+ (void)getCachefileSizeTarget:(id)_target select:(SEL)selectName {
    
    __block CGFloat fileSize = 0;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // GCD 获取文件地址，文件里的数据个数
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        for (NSString *pathName in files) {
            NSString *path = [cachPath stringByAppendingPathComponent:pathName];
            //NSLog(@"aFileSize ＝ %f",[ZMCache fileSizeAtPath:path] );
            fileSize = fileSize + [ZMCache fileSizeAtPath:path];
        }
        // NSLog(@"folderSizeAtPath ＝ %f",[ZMCache folderSizeAtPath:cachPath] );
        NSString *getFileSize  = [NSString stringWithFormat:@"%.2fMB",fileSize];
        NSLog(@"getFileSize ＝ %@",getFileSize );
        [_target performSelectorOnMainThread:selectName withObject:getFileSize waitUntilDone:YES];
    });
}



//计算单个文件大小
+ (CGFloat)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize] / (1024.0 * 1024.0);
    }
    return 0;
}

//获取对应文件的：缓存大小
+ (CGFloat)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        return 0;
    }
    // NSEnumerator （枚举） NSEnumerator用来描述这种集合迭代运算的方式， 通过objectEnumerator向数组请求枚举器，
    // 如果想从后向前浏览集合，可使用reverseObjectEnumerator方法。
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString *fileName = nil;
    CGFloat folderSize = 0;
    //在获得枚举器后，可以开始一个while循环，每次循环都向这个枚举器请求它的下一个对象:nextObject。
    //nextObject返回nil值时，循环结束。
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    // 因为得到的数据时bate ，所以转换成mb
    return folderSize;
}



/**
 *  清理缓存文件
 */
//同样也是利用NSFileManager API进行文件操作，SDWebImage框架自己实现了清理缓存操作，我们可以直接调用。
+ (void)clearCache:(void(^)(NSError *error))reuslt success:(void(^)(void))success {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // GCD 获取文件地址，文件里的数据个数
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        NSError *error;
        for (NSString *fileName in files)
        {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *path = [cachPath stringByAppendingPathComponent:fileName];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        if (error) {
            reuslt(error);
        } else {
            success();
        }
    });
}

@end
