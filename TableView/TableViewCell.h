//
//  TableViewCell.h
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellDescriptionLabel;

@end
