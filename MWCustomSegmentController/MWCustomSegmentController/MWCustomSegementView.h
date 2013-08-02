//
//  MWCustomSegementView.h
//  HBCosmetic
//
//  Created by meway on 13-7-30.
//  Copyright (c) 2013年 meway. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct MWImage {
    __unsafe_unretained NSString *normal_image;
    __unsafe_unretained NSString *hilight_image;
}MWImage;

static MWImage MWImageMake(NSString *normal_image,NSString *hilight_image)
{
    MWImage mwImage;
    mwImage.normal_image = normal_image;
    mwImage.hilight_image = hilight_image;
    return mwImage;
}

@class MWCustomSegementView;

@protocol MWCustomSegementViewDelegate <NSObject>

- (void)segementClickedAtIndex:(NSInteger)index;

@end

@interface MWCustomSegementView : UIView

- (id)initWithFrame:(CGRect)frame segementSize:(CGSize)sgSize;  //init

@property (nonatomic,assign) id <MWCustomSegementViewDelegate> delegate;

@property (nonatomic,strong) UIImage *backgroundImage;   //背景图片

@property(nonatomic,strong) UIFont *titleFont;           //字体大小

@property(nonatomic,strong) UIColor *titleColor;         //字体颜色

@property (nonatomic,strong) NSArray *items;             //Segement的内容，只能为NSString;

//设置左中右按钮背景图片
@property (nonatomic,assign) MWImage headImage;
@property (nonatomic,assign) MWImage midImage;
@property (nonatomic,assign) MWImage trailImage;

@property (nonatomic,readonly) NSInteger selectedSegmentIndex; //获取Segement当前index

@end
