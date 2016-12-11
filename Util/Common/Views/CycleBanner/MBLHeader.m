//
//  SADImageView.m
//  123
//
//  Created by 马宝丽 on 16/4/14.
//  Copyright © 2016年 haishusichuang. All rights reserved.
//

#import "MBLHeader.h"
#import "MBLHeaderImageView.h"
//默认5秒旋转图片一次,可以根据需要改变

#define WiatForSwitchImgMaxTime 5

typedef NS_ENUM(NSInteger, SwitchDirection)

{
    
    //未成功旋转
    
    SwitchDirectionNone = -1,
    
    //向右旋转图片
    
    SwitchDirectionRight = 0,
    
    //向左训转图片
    
    SwitchDirectionLeft = 1,
    
};

@interface MBLHeader()<UIScrollViewDelegate>

//底部UIScrollView

@property(nonatomic,weak)UIScrollView *contentScrollView;

//显示页码的UIPageControl控件

@property(nonatomic,weak)UIPageControl *pageControlView;

//用保存当前UIPageControl控件显示的当前位置

@property(nonatomic,assign)NSInteger currentPage;

//用于保存当前显示图片在图片urlArr数组中的索引

@property(nonatomic,assign)NSInteger currentImgIndex;

//UIScrollView上的三个UIImgaView这里通过3个UIImageView实现无限循环图片轮转

@property(nonatomic,strong)MBLHeaderImageView *imgView1;

@property(nonatomic,strong)MBLHeaderImageView *imgView2;

@property(nonatomic,strong)MBLHeaderImageView *imgView3;

@property(nonatomic,assign)BOOL isDragImgView;

//SwitchDirection类型，用于保存滑动的方向

@property(nonatomic,assign)SwitchDirection swDirection;

@end
@implementation MBLHeader


-(id)initWithFrame:(CGRect)frame

{
    
    if (self = [super initWithFrame:frame])
        
    {
        self.backgroundColor = [KDColor getC7Color];

        
        [self createContentScrollView];
        
        [self createPageControlView];
        
        //默认第一页
        
        _currentPage = 0;
        
        //默认显示第一张图片
        
        _currentImgIndex = 0;
        
        _isDragImgView = NO;
        
        _swDirection = SwitchDirectionNone;
        
        
    }
    
    return self;
    
}

-(void)createContentScrollView

{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    scrollView.delegate = self;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.shouldGroupAccessibilityChildren = NO;
    
    scrollView.pagingEnabled = YES;
    
    [self addSubview:scrollView];
    
    _contentScrollView = scrollView;
    
}

-(void)createPageControlView

{
    
    UIPageControl *pageControlVw = [[UIPageControl alloc] init];
    
    pageControlVw.frame = CGRectMake(0, 0, 80, 20);
    pageControlVw.center = CGPointMake(self.center.x, self.bounds.size.height - 20);
    
    pageControlVw.backgroundColor = [UIColor clearColor];
    [pageControlVw setValue:[UIImage imageNamed:@"shop_gundong"] forKeyPath:@"pageImage"];
    [pageControlVw setValue:[UIImage imageNamed:@"shop_gundong1"] forKeyPath:@"currentPageImage"];
    pageControlVw.pageIndicatorTintColor = [UIColor clearColor];
    
    pageControlVw.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    _pageControlView.pageIndicatorTintColor = [UIColor greenColor];
    
    _pageControlView.currentPageIndicatorTintColor = [UIColor greenColor];
    
    [self addSubview:pageControlVw];
    
    _pageControlView = pageControlVw;
    
}

//value对Count取模,并保证为正值

//这里很重要，是实现无限循环的重要的一步，比如现在显示的是第一张图片，_currentImgIndex=0,向左滑动后就显示_currentImgIndex+1张图片，可是_currentImgIndex+1可能回大于_imgUrlArr的数组count，这里取模，其次还要保证为正数，比如，如果向右边滑动是就显示_currentImgIndex-1张图片，_currentImgIndex-1取模也可能为负数，此时加上count保证为正数

-(NSInteger)switchToValue:(NSInteger)value Count:(NSInteger)count

{
    
    NSInteger result = value % count;
    
    return result >=0 ? result : result + count;
    
}
-(void)setImgUrlArr:(NSArray *)imgUrlArr

{
    _imgUrlArr = [imgUrlArr copy];
    
    
    
    //    NSInteger count = imgUrlArr.count;
    NSInteger count = imgUrlArr.count;
    
    if (count <= 0 )
        
    {
        
        return;
        
    }
    
    //如果只显示一张图片,那就没有旋转情况
    
    if (count == 1)
        
    {
        
        _pageControlView.currentPageIndicatorTintColor = [UIColor clearColor];
        MBLHeaderImageView *imgView = [[MBLHeaderImageView alloc]init];
        imgView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
        //        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [imgView addTarget:self withSelector:@selector(tapImage:)];
        [_contentScrollView addSubview:imgView];
        
        _pageControlView.numberOfPages = 1;
        
        _pageControlView.currentPage = 0;
        
        _contentScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        
        NSURL *imgUrl = [NSURL URLWithString:imgUrlArr[0]];
        
        [imgView setImageWithURL:imgUrl placeholder:[UIImage imageNamed:@"placeholder1"]];
        return;
        
    }
    
    if (count > 1)
        
    {
        
        //这里只使用3个ImgView轮转多张图片，数量2,3,4,5,6...
        
        for(int i = 0; i < 3 ;i++)
            
        {
            MBLHeaderImageView *imgView = [[MBLHeaderImageView alloc] init];
            
            imgView.frame = CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
            
            imgView.layer.masksToBounds = YES;
            
            [imgView addTarget:self withSelector:@selector(tapImage:)];
            //            imgView.contentMode = UIViewContentModeScaleAspectFit;
            
            NSString *urlStr = urlStr = _imgUrlArr[[self switchToValue:i-1 Count:count]];
            
            NSURL *imgUrl = [NSURL URLWithString:urlStr];
            
            [imgView setImageWithURL:imgUrl placeholder:[UIImage imageNamed:@"placeholder1"]];
            
            if (i == 0)
                
            {
                _imgView1 = imgView;
            }
            
            else if (i == 1)
                
            {
                
                _imgView2 = imgView;
                
            }
            
            else if (i == 2)
                
            {
                
                _imgView3 = imgView;
                
            }
            
            [_contentScrollView addSubview:imgView];
            
        }
        
        _pageControlView.numberOfPages = count;
        
        _pageControlView.currentPage = 0;
        
        _contentScrollView.contentSize = CGSizeMake(self.bounds.size.width * 3,   self.bounds.size.height);
        
        _currentImgIndex = 0;
        
        [_contentScrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),  ^{
            
            //循环轮转图片
            
            [self switchImg];
            
        });
        
    }
    
}

-(void)switchImg

{
    
    while (1)
        
    {
        
        [NSThread sleepForTimeInterval:WiatForSwitchImgMaxTime];
        
        //如果正在拖拽图片，此次作废
        
        if (_isDragImgView) {
            
            continue;
            
        }
        
        _currentPage = [self switchToValue:_currentPage + 1 Count:_imgUrlArr.count];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _pageControlView.currentPage = _currentPage;
            
            _contentScrollView.contentOffset = CGPointMake(2 * self.bounds.size.width, 0);
            
            [self reSetImgUrlWithDirection:SwitchDirectionLeft];
            
        });
        
    }
    
}

-(void)switchImgByDirection:(SwitchDirection)direction

{
    
    if (direction == SwitchDirectionNone) {
        
        return;
        
    }
    
    [self reSetImgUrlWithDirection:direction];
    
    [_contentScrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
    
}

-(void)reSetImgUrlWithDirection:(SwitchDirection)direction

{
    
    if (direction == SwitchDirectionRight) {
        [_imgView1 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex - 2 Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        [_imgView2 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex - 1 Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        
        [_imgView3 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        
        _currentImgIndex = [self switchToValue:_currentImgIndex - 1 Count:_imgUrlArr.count];
        
    }
    
    else if(direction == SwitchDirectionLeft)
        
    {

        [_imgView1 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex  Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        [_imgView2 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex + 1 Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        
        [_imgView3 setImageWithURL:[NSURL URLWithString:_imgUrlArr[[self switchToValue:_currentImgIndex + 2 Count:_imgUrlArr.count]]] placeholder:[UIImage imageNamed:@"placeholder1"]];
        _currentImgIndex = [self switchToValue:_currentImgIndex + 1 Count:_imgUrlArr.count];
        
    }
    
}

#pragma mark -------------Delegate---------------

//记住滑动的方向

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    static float newx = 0;
    
    static float oldx = 0;
    
    newx= scrollView.contentOffset.x ;
    
    if (newx != oldx )
        
    {
        
        if (newx > oldx)
            
        {
            
            _swDirection = SwitchDirectionLeft;
            
        }else if(newx < oldx)
            
        {
            
            _swDirection = SwitchDirectionRight;
            
        }
        
        oldx = newx;
        
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    _isDragImgView = YES;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    
    //向左旋转
    
    if (_swDirection == SwitchDirectionLeft)
        
    {
        
        _currentPage = [self switchToValue:_currentPage + 1 Count:_imgUrlArr.count];
        
    }//向右旋转
    
    else if (_swDirection == SwitchDirectionRight)
        
    {
        
        _currentPage = [self switchToValue:_currentPage - 1 Count:_imgUrlArr.count];
        
    }
    
    _pageControlView.currentPage = _currentPage;
    
    if (_swDirection != SwitchDirectionNone) {
        
        [self switchImgByDirection:_swDirection];
        
    }
    
    _isDragImgView = NO;
    
}

- (void)tapImage:(MBLHeaderImageView *)gotoUrl
{

//    NSArray * arr = [_imgUrlArr[_currentPage] componentsSeparatedByString:@"t"];
//    if (arr.count<2) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_imgUrlArr[_currentPage]]]];
//    }else{
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_imgUrlArr[_currentPage]]];
//    }

}


@end
