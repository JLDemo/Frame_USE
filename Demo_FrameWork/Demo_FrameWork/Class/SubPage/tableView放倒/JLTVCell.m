//
//  JLTVCell.m
//  Frame_USE
//
//  Created by kfz on 16/6/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "JLTVCell.h"

@interface JLTVCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end


@implementation JLTVCell
static NSString *ID = @"cell_IDDD";

+ (instancetype)tvCellWithTableView:(UITableView *)tableView {
    JLTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if ( !cell ) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JLTVCell" owner:self options:nil] lastObject];
        
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, M_PI_2);
}

- (void)setI:(NSInteger)index {
    _i = index;
    self.imgView.image = [self randemImage:index];
    
}

- (UIImage *)randemImage:(NSInteger)index {
    NSString *imageName = [NSString stringWithFormat:@"0_%ld",index];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end













