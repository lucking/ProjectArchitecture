//
//  APPInfoManager.h
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "Singleton.h"

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>



@interface APPInfoManager : Singleton
{
    
}
//创建实例
Singleton_Instance_method_Interface(APPInfoManager);

/**
 *  方便在基类中处理公共逻辑，例如猿题库的：数据版本号信息就统一在基类中处理。
 */
@property (nonatomic, readonly) NSString *appVersion;		//版本号：获取当前系统的版本号
@property (nonatomic, readonly) NSString *appName;			//app名称
@property (nonatomic, readonly) NSString *appId;			//appId



@property (nonatomic, readonly) NSString *BuildMachineOSBuild;
@property (nonatomic, readonly) NSString *CFBundleDevelopmentRegion;
@property (nonatomic, readonly) NSString *CFBundleExecutable;
@property (nonatomic, readonly) NSString *CFBundleIdentifier;				//AppId
@property (nonatomic, readonly) NSString *CFBundleInfoDictionaryVersion;

@property (nonatomic, readonly) NSString *CFBundleInfoPlistURL;
@property (nonatomic, readonly) NSString *CFBundleName;						//App名称
@property (nonatomic, readonly) NSString *CFBundleNumericVersion;
@property (nonatomic, readonly) NSString *CFBundlePackageType;

@property (nonatomic, readonly) NSString *CFBundleShortVersionString;		//
@property (nonatomic, readonly) NSString *CFBundleSignature;
@property (nonatomic, readonly) NSArray *CFBundleSupportedPlatforms;		//数组
@property (nonatomic, readonly) NSString *CFBundleVersion;					//版本号
@property (nonatomic, readonly) NSString *DTCompiler;

@property (nonatomic, readonly) NSString *DTPlatformBuild;
@property (nonatomic, readonly) NSString *DTPlatformName;
@property (nonatomic, readonly) NSString *DTPlatformVersion;
@property (nonatomic, readonly) NSString *DTSDKBuild;
@property (nonatomic, readonly) NSString *DTSDKName;
@property (nonatomic, readonly) NSString *DTXcode;
@property (nonatomic, readonly) NSString *DTXcodeBuild;

@property (nonatomic, readonly) NSString *LSRequiresIPhoneOS;
@property (nonatomic, readonly) NSString *MinimumOSVersion;					//
@property (nonatomic, readonly) NSArray *NSAppTransportSecurity;			//数组
@property (nonatomic, readonly) NSArray *UIDeviceFamily;					//数组
@property (nonatomic, readonly) NSString *UILaunchImageFile;
@property (nonatomic, readonly) NSArray  *UILaunchImages;					//数组
@property (nonatomic, readonly) NSString *UIMainStoryboardFile;
@property (nonatomic, readonly) NSArray *UIRequiredDeviceCapabilities;		//数组
@property (nonatomic, readonly) NSArray *UISupportedInterfaceOrientations;	//数组

@property (nonatomic, readonly) NSString *app;


#pragma mark 获取系统配置文件
- (NSDictionary *)getInfoDictionary;

// 根据key 获取对应的配置信息
+(NSObject *)getValueOfInfoDict:(NSString *)key;

//============================"    "=============================

//获取当前系统版本号
+ (NSString *)currentSystemVersion;

//获取当前APP版本号
+ (NSString *)currentAPPVersion;

//获取运营商名称
+ (NSString *)cellularProvider;

//获取电池状态和等级  /********************摘录：http://blog.csdn.net/decajes/article/details/41807977
+ (NSString *)getBatteryState;

//获取电量的等级，0.00~1.00
+ (float)getBatteryLevel;






/*   数据版本号信息

 infoDictionary = {
	BuildMachineOSBuild = 14F27;
	CFBundleDevelopmentRegion = en;
	CFBundleExecutable = HuiFang;
	CFBundleIdentifier = "zm.HuiFang";
	CFBundleInfoDictionaryVersion = "6.0";
	CFBundleInfoPlistURL = "Info.plist -- file:///Users/ZM/Library/Developer/CoreSimulator/Devices/8BC82BFF-59F4-4744-B8B6-A74F146C2A46/data/Containers/Bundle/Application/040B38AC-3EDF-482D-BA16-D718D2F30A9A/HuiFang.app/";
	CFBundleName = HuiFang;
	CFBundleNumericVersion = 16809984;
	CFBundlePackageType = APPL;
	CFBundleShortVersionString = "1.0";
	CFBundleSignature = "????";
	CFBundleSupportedPlatforms =     (
 iPhoneSimulator
 );
	CFBundleVersion = 1;
	DTCompiler = "com.apple.compilers.llvm.clang.1_0";
	DTPlatformBuild = "";
	DTPlatformName = iphonesimulator;
	DTPlatformVersion = "9.1";
	DTSDKBuild = 13B137;
	DTSDKName = "iphonesimulator9.1";
	DTXcode = 0710;
	DTXcodeBuild = 7B91b;
	LSRequiresIPhoneOS = 1;
	MinimumOSVersion = "8.0";
	NSAppTransportSecurity =     {
 NSAllowsArbitraryLoads = 1;
	};
	UIDeviceFamily =     (
 1
 );
	UILaunchImageFile = LaunchImage;
	UILaunchImages =     (
 {
 UILaunchImageMinimumOSVersion = "8.0";
 UILaunchImageName = "LaunchImage-800-Portrait-736h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{414, 736}";
 },
 {
 UILaunchImageMinimumOSVersion = "8.0";
 UILaunchImageName = "LaunchImage-800-667h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{375, 667}";
 },
 {
 UILaunchImageMinimumOSVersion = "7.0";
 UILaunchImageName = "LaunchImage-700-568h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{320, 568}";
 }
 );
	UIMainStoryboardFile = Main;
	UIRequiredDeviceCapabilities =     (
 armv7
 );
	UISupportedInterfaceOrientations =     (
 UIInterfaceOrientationPortrait,
 UIInterfaceOrientationLandscapeLeft,
 UIInterfaceOrientationLandscapeRight
 );
 }
 */


@end
