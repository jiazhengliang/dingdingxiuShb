//
//  YJCustomNavView.h
//  JZLYuJia
//
//  Created by jones on 2020/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJCustomNavView : UIView


-(void)setTitle:(NSString *)string;
-(void)setTitleLabelText:(NSString *)text;


-(void)setTitleColor:(UIColor *)color;

-(void)setTitleWithAttributedString:(NSAttributedString*)string;//包含富文本的标题

-(void)setLeftButton:(UIButton *)button;

-(void)setRightButton:(UIButton *)button;
-(UIButton *)getRightButton;

-(void)setLeftView:(UIView *)view;

-(void)setRightView:(UIView *)view;

-(void)setTitleView:(UIView *)view;

-(UIView *)getTitleView;

-(void)setSepetorLineHidden:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END
