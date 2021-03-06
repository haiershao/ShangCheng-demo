//
//  CZPhotoView.m
//  传智微博
//
//  Created by apple on 15-3-12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZPhotoView.h"
#import "UIImageView+WebCache.h"
#import "CZPhoto.h"

@interface CZPhotoView ()

@property (nonatomic, weak) UIImageView *gifView;

@end

@implementation CZPhotoView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        // 裁剪图片，超出控件的部分裁剪掉
        self.clipsToBounds = YES;
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView = gifView;
    }
    
    return self;
}

- (void)setPhoto:(CZPhoto *)photo
{
    _photo = photo;
    
    // 赋值
    [self sd_setImageWithURL:photo.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    // 判断下是否显示gif
    NSString *urlStr = photo.thumbnail_pic.absoluteString;
    if ([urlStr hasSuffix:@".gif"]) {
        self.gifView.hidden = NO;
    }else{
        self.gifView.hidden = YES;
    }
}


// .gif
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
    
}

@end
