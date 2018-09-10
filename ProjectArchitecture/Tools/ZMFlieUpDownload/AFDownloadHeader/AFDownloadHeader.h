//
//  AFDownloadHeader.h
//  ZMDownloadManager
//
//  Created by ZM on 16/5/20.
//  Copyright © 2016年 TD. All rights reserved.
//

#ifndef AFDownloadHeader_h
#define AFDownloadHeader_h

//1: Document
#define Document_pathArray  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
#define DocumentPath		[Document_pathArray objectAtIndex:0]

//5: Temporary
#define TempPath				NSTemporaryDirectory()


#define DirectoryPath	[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define Download_VideoName	@"demo1.mp4"

#define Img_URL1		@"http://i1.douguo.net//upload/banner/0/6/a/06e051d7378040e13af03db6d93ffbfa.jpg"
#define Img1Name		@"SZJVideoName.png"

// 宋钟基
#define SZJ_URL			@"http://flv2.bn.netease.com/videolib3/1604/22/iGABN3301/SD/iGABN3301-mobile.mp4"
#define SZJ_VideoName	@"SZJVideoName.mp4"
//CFNetworkDownload_E2l8S1.tmp

// 青春
#define ItYvG_URL		@"http://flv2.bn.netease.com/videolib3/1604/22/ItYvG2490/SD/ItYvG2490-mobile.mp4"
#define ItYvG_VideoName	@"ItYvGVideoName.mp4"
//CFNetworkDownload_Y9ZBst.tmp

// 棠棣宣传片
#define TDVideo_URl1		@"http://139.196.229.113:8080/MPWEB/upload/201605/603894.wmv"
#define TDVideoName1		@"TDVideoName1.mp4"

#define TDVideo_URl2		@"http://139.196.229.113:8080/MPWEB/upload/201605/498113.mp4"
#define TDVideoName2		@"TDVideoName2.mp4"


#endif /* AFDownloadHeader_h */
