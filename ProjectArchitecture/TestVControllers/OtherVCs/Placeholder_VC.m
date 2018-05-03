//
//  Placeholder_VC.m
//  ProjectArchitecture
//
//  Created by ZM on 2017/5/18.
//  Copyright © 2017年 ZM. All rights reserved.
//

#import "Placeholder_VC.h"
#import "UILabel+ZMAdd.h"
#import "NSString+ZMAdd.h"
#import "UIViewController+ZMAdd.h"

@interface Placeholder_VC ()
{
    
}
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation Placeholder_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self initUI];
    
    [self.view addSubview:self.titleLab];

}

/** 关于OC中 占位符：的使用详解
 
 %d:整数
 %f:浮点数
 %s:方法
 %c:c字符
 %@:OC对象
 %p:指针
 
 */
//例一：
- (void)case1 {
    
    //保留两位小数
    NSLog(@"--->%0.2f",1.0203);
    //输出结果:1.02
    
    //使用0左补位
    NSLog(@"--->%04d",1);
    //输出结果:0001
    
    //使用空格左补位
    NSLog(@"--->%4d",1);
    //输出结果:   1
    
    //字符串补位
    NSLog(@"--->%4s!","a");
    //输出结果:   a!
    
    //字符串右补位
    NSLog(@"--->%-4s!","a");
    //输出结果:a   !
    
//     NSString *str = @"资料图：“萨德”部分装备在韩部署。新华社/韩联社 &nbsp; 参考消息网5月18日报道 俄媒称，韩国执政的共同民主党团国会首席代表禹元植表示，如果部署“萨德”的行为违反韩国的内部法律程序，该国可能返还给美国前不久部署的“萨德”反导系统。据俄罗斯卫星网5月17日报道，共同民主党党团负责人称，“我们需要研究这些问题，包括返还‘萨德’系统的可能性，如果发现没有完成内部的法律程序。”&nbsp; 该负责人指出，“萨德”系统的部署需要得到国会的批准，上届政府没有履行这个程序。&nbsp; 报道称，当选总统文在寅在竞选时就表示，反对该系统的部署。据报道，首尔去年决定在韩国部署美国末段高空区域防御系统。“萨德”用于高空大气层外拦截短程和中程导弹。“萨德”拦截半径不超过200公里。该系统应能有效拦截朝鲜导弹。%4d 报道称，今年4月份大气层外拦截弹道导弹系统的首批部件，部署在了位于星州郡庆尚南道的前高尔夫球场。韩国国防部称，“萨德”系统的安装工作可能在今年年底前全面完成。同时，“萨德”系统的主要功能目前已可以投入使用。返回腾讯网首页&gt;&gt;责任编辑：josezhang";
    
    NSString *str = @"资料图：“萨德”部分装备在韩部署。新华社/韩联社 &nbsp; 参考消息网5月18日报道 俄媒称，韩国执政的共同民主党团国会首席代表禹元植表示，如果部署“萨德”的行为违反韩国的内部法律程序，该国可能返还给美国前不久部署的“萨德”反导系统。据俄罗斯卫星网5月17日报道，共同民主党党团负责人称，“我们需要研究这些问题，包括返还‘萨德’系统的可能性，如果发现没有完成内部的法律程序。”&nbsp; 该负责人指出，“萨德”系统的部署需要得到国会的批准，上届政府没有履行这个程序。&nbsp; 报道称，当选总统文在寅在竞选时就表示，反对该系统的部署。据报道，首尔去年决定在韩国部署美国末段高空区域防御系统。“萨德”用于高空大气层外拦截短程和中程导弹。“萨德”拦截半径不超过200公里。该系统应能有效拦截朝鲜导弹。%4d 报道称，今年4月份大气层外拦截弹道导弹系统的首批部件，部署在了位于星州郡庆尚南道的前高尔夫球场。韩国国防部称，“萨德”系统的安装工作可能在今年年底前全面完成。返回腾讯网首页&gt;&gt;责任编辑：josezhang";
    
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@"&gt;" withString:@""];

    NSLog(@"--->6: 替换：%@ \n ",str);
    
    self.titleLab.text = str;
//    [self.titleLab changeLabTextArray:@[@"资料图：“萨德”部分装备在韩部署。",@"新华社/韩联社"]
//                           colorArray:@[[UIColor darkTextColor],Blue_2599FA]
//                            fontArray:@[@"16",@"14"]
//                            alignment:NSTextAlignmentLeft
//                            lineSpace:4.4f
//                       paragraphSpace:30.f
//                       characterSpace:@0.8f
//                             autoSize:YES];
    
//    [self.titleLab changeLabTextArray:nil
//                           colorArray:nil
//                            fontArray:nil
//                            alignment:NSTextAlignmentLeft
//                            lineSpace:4.4f
//                       paragraphSpace:10.f
//                       characterSpace:@0.3f
//                             autoSize:YES];
   
    [self.titleLab changeLabTextArray:nil colorArray:nil fontArray:nil
                            alignment:NSTextAlignmentLeft
                            lineSpace:4.4f
                       paragraphSpace:10.f
                       characterSpace:@0.3
                           headIndent:0
                           tailIndent:0
                             autoSize:YES];
    
    
//    //测试
//    NSString *str = @"    上海棠棣信息科技有限公司（股票代码833777，简称“棠棣信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n    棠棣信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n    棠棣信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，棠棣信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。";
//    
//    self.titleLab.text = str;
//    
//    [self.titleLab changeLabTextArray:@[@"上海棠棣信息科技有限公司",@"833777"]
//                   colorArray:@[[UIColor darkTextColor],Blue_2599FA]
//                    fontArray:@[@"16",@"14"]
//                    alignment:NSTextAlignmentLeft
//                    lineSpace:4.4f
//               paragraphSpace:30.f
//               characterSpace:@1.2f
//                     autoSize:YES];
    
    
}
//例二：
- (void)case2 {
    
}
//例三：
- (void)case3 {
}
//例四：
- (void)case4 {
}
//例五：
- (void)case5 {
}
//例六：
- (void)case6 {
}
//例七：
- (void)case7 {
}
//例八：
- (void)case8 {
}
//例九：
- (void)case9 {
}

- (void)initUI {
    
    NSString *title=@"";
    CGFloat width = 60;
    for (int i=1 ; i<11; i++) {
        title = [NSString stringWithFormat:@"case%d",i];
        [self addBtnTitle:title frame:CGRectMake(10, 50+ (35+10)*i, width, 35) tag:i];
    }
}
- (void)myBtnClick:(UIButton *)Btn{
    if (Btn.tag==1) {       [self case1];
    }else if (Btn.tag==2) { [self case2];
    }else if (Btn.tag==3) { [self case3];
    }else if (Btn.tag==4) { [self case4];
    }else if (Btn.tag==5) { [self case5];
    }else if (Btn.tag==6) { [self case6];
    }else if (Btn.tag==7) { [self case7];
    }else if (Btn.tag==8) { [self case8];
    }else if (Btn.tag==9) { [self case9];
    }
}
// 标题
- (UILabel *)titleLab {
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = FFont(14);
        _titleLab.textColor = Black_COLOR;
        _titleLab.numberOfLines = 0;
        _titleLab.backgroundColor = [UIColor yellowColor];
        _titleLab.frame = CGRectMake(80, 70, 270, 500);
    }
    return _titleLab;
}
@end
