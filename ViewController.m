//
//  ViewController.m
//  0406-分页显示
//
//  Created by Ibokan on 15/4/6.
//  Copyright (c) 2015年 focus. All rights reserved.
//

#import "ViewController.h"
#define picNum 3
#define viewW 320
#define viewH 568
@interface ViewController () <UIScrollViewDelegate>{
    UIScrollView * _scrollview;
    UIPageControl * _pagecontrol;
    NSArray * _scrollsubviewarr;
    UIImageView * _currentimgview;
    UIImageView * _foreimgview;
    UIImageView * _nextimgview;
}
@end

@implementation ViewController
#pragma mark 重大bug:拖拽图片的时候放在了分页显示Tests.m下面,导致无法显示图片!
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat imgW = self.view.frame.size.width;
    CGFloat imgH = self.view.frame.size.height;
    
    _scrollview = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollview];
    _scrollview.frame = self.view.frame;

    for (int i = 0; i < picNum; i++) {
    //1.图片－> 相框 －> 放大镜
    NSString * imgname = [NSString stringWithFormat:@"0%d.jpg",i + 1];
    UIImage * img = [UIImage imageNamed:imgname];
        
    UIImageView * imgview = [[UIImageView alloc] initWithImage:img];
    //图片按imageview大小限定显示
    imgview.frame = CGRectMake(i * imgW, 0, imgW , imgH);
    imgview.contentMode = UIViewContentModeScaleToFill;
    [_scrollview addSubview:imgview];
    

    }
    _scrollview.delegate = self;
    _pagecontrol = [[UIPageControl alloc] initWithFrame:CGRectMake(110,510,110, 50)];
    _pagecontrol.numberOfPages = picNum;
    _pagecontrol.Enabled = NO;
    [self.view addSubview:_pagecontrol];
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.pagingEnabled = YES;
    _scrollview.contentSize = CGSizeMake(picNum * imgW, 0);
    _scrollsubviewarr = _scrollview.subviews;
//    NSLog(@"%@",_scrollsubviewarr);
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//取到imgview
#pragma mark error
//    if  (_pagecontrol.currentPage == picNum - 1){
////        NSLog(@"%lf",_scrollview.contentOffset.x);
//
//           NSLog(@"%lu",(arrindex));
//        if (scrollviewX > (arrindex - 2) * viewW + 20) {
////            [UIView animateWithDuration:(0.5) animations:^{
////                _scrollview.contentOffset = CGPointMake(0, 0);
////            }];
//            NSLog(@"%@",(_scrollsubviewarr));
//            UIView * scroll_imgview = _scrollsubviewarr[(_pagecontrol.currentPage + 2)%8];
//            _scrollview.contentSize = CGSizeMake((_pagecontrol.currentPage + 2) * viewW, 0);
//            scroll_imgview.frame = CGRectMake((_pagecontrol.currentPage + 2) * viewW, 0, 320, 568);
//            [_scrollview addSubview:scroll_imgview];
//        }
//    }
#pragma mark continue
    CGFloat scrollviewX = scrollView.contentOffset.x;
    _pagecontrol.currentPage = scrollviewX / viewW;
    //得到当前的imgview
    _currentimgview = _scrollsubviewarr[_pagecontrol.currentPage];
    //得到当前的imgview的下一张一张imgview
//    _nextimgview = _scrollsubviewarr.lastObject;
    _nextimgview = _scrollsubviewarr[(_pagecontrol.currentPage + 1) % 3];
        //得到当前的imgview的第一张imgview
//    _foreimgview = _scrollsubviewarr.firstObject;
    _foreimgview = _scrollsubviewarr[(_pagecontrol.currentPage + 2) % 3];

    //移动当前imgview,向左移动,scrollviewX值>currentimgviewX;向右移动imgviewX<currentimgviewX;
//    if (scrollviewX > _currentimgview.frame.origin.x) {
//        NSLog(@"%lf > %lf",scrollviewX,_currentimgview.frame.origin.x);
//    if (scrollviewX == 320) {
//        //交换数组内的imgview
////        [_scrollview exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
////        [_scrollview sendSubviewToBack:_scrollsubviewarr[2]];
//        _currentimgview.frame = CGRectMake(320, 0, viewW, viewH);
//        _nextimgview.frame = CGRectMake(320, 0, viewW, viewH);
//        _foreimgview.frame = CGRectMake(0, 0, viewW, viewH);
//        _scrollview.contentOffset = CGPointMake(320, 0);
//    }
    




//        NSLog(@"%@",_scrollview.subviews);
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
