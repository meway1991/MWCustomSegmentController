//
//  MWCustomSegementView.m
//  HBCosmetic
//
//  Created by meway on 13-7-30.
//  Copyright (c) 2013年 meway. All rights reserved.
//

#define Btn_Title_Gap 8.f

#define Segement_Tag 2222

#define Default_Title_Font 14.f

#import "MWCustomSegementView.h"

@interface MWCustomSegementView ()
{
    CGSize _sgSize;
    NSInteger _pre_btn_tag;
}
@end

@implementation MWCustomSegementView

- (id)initWithFrame:(CGRect)frame segementSize:(CGSize)sgSize
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _sgSize = sgSize;
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    [self initView];
}

- (void)initView
{
    self.backgroundColor = [UIColor colorWithPatternImage:_backgroundImage?_backgroundImage:[UIImage imageNamed:@"gs_navbg"]];
    
    CGFloat _left_gap = (self.frame.size.width - _sgSize.width*_items.count)/2;
    CGFloat _top_gap = (self.frame.size.height - _sgSize.height)/2;
    
    for (int i = 0; i < _items.count; i++)
    {
        CGRect rect = CGRectMake(_left_gap+_sgSize.width*i, _top_gap, _sgSize.width, _sgSize.height);
        
        UIButton *button = [self addBtnWithFrame:rect Item:[_items objectAtIndex:i]];
        
        button.tag = Segement_Tag+i;
        if (i == 0) _pre_btn_tag = button.tag;
        
        [self addSubview:button];
    }
}

- (UIButton *)addBtnWithFrame:(CGRect)frame Item:(id)item
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitleColor:(_titleColor ? _titleColor : [UIColor whiteColor]) forState:UIControlStateNormal];
    button.titleLabel.font = (_titleFont ? _titleFont : [UIFont systemFontOfSize:Default_Title_Font]);
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    button.adjustsImageWhenHighlighted = NO;

    [button setTitle:item forState:UIControlStateNormal];
    return button;
}

- (void)setHeadImage:(MWImage)headImage
{
    _headImage = headImage;
    UIButton *button = (UIButton *)[self viewWithTag:Segement_Tag];
    [button setBackgroundImage:[UIImage imageNamed:headImage.hilight_image] forState:UIControlStateNormal];
}

- (void)setMidImage:(MWImage)midImage
{
    _midImage = midImage;
    for (int i = 1; i < _items.count-1; i++)
    {
        UIButton *button = (UIButton *)[self viewWithTag:Segement_Tag+i];
        [button setBackgroundImage:[UIImage imageNamed:midImage.normal_image] forState:UIControlStateNormal];
    }
}

- (void)setTrailImage:(MWImage)trailImage
{    
    _trailImage = trailImage;
    UIButton *button = (UIButton *)[self viewWithTag:Segement_Tag+_items.count-1];
    [button setBackgroundImage:[UIImage imageNamed:trailImage.normal_image] forState:UIControlStateNormal];
}

- (void)btnClicked:(UIButton *)btn
{
    if (_pre_btn_tag == btn.tag) return;
    
    UIButton *_preBtn = (UIButton *)[self viewWithTag:_pre_btn_tag];
    NSInteger index = _pre_btn_tag - Segement_Tag;
    
    UIImage *image = nil;
    if (index == 0)
    {
        image = [UIImage imageNamed:_headImage.normal_image];
    }
    else if (index == _items.count-1)
    {
        image = [UIImage imageNamed:_trailImage.normal_image];
    }
    else
    {
        image = [UIImage imageNamed:_midImage.normal_image];
    }
    [_preBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    index = btn.tag - Segement_Tag;
    
    if (index == 0)
    {
        image = [UIImage imageNamed:_headImage.hilight_image];
    }
    else if (index == _items.count-1)
    {
        image = [UIImage imageNamed:_trailImage.hilight_image];
    }
    else
    {
        image = [UIImage imageNamed:_midImage.hilight_image];
    }
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    _pre_btn_tag = btn.tag;
    
    if ([_delegate respondsToSelector:@selector(segementClickedAtIndex:)])
    {
        [_delegate segementClickedAtIndex:index];
    }
}

- (NSInteger)selectedSegmentIndex
{
    return _pre_btn_tag-Segement_Tag;
}

@end
