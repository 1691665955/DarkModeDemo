//
//  TDHomeVC.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/5/12.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "TDHomeVC.h"
#import "TDDetailVC.h"

@interface TDHomeVC ()
@property (weak, nonatomic) IBOutlet UIImageView *networkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *localImageView;
@property (weak, nonatomic) IBOutlet UILabel *textLB;

@end

@implementation TDHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self changeUIForTraitCollection];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetail)];
    [self.view addGestureRecognizer:tap];
}

- (void)showDetail {
    TDDetailVC *vc = [[TDDetailVC alloc] initWithNibName:@"TDDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (@available(iOS 13.0, *)) {
        if (previousTraitCollection.userInterfaceStyle != [UITraitCollection currentTraitCollection].userInterfaceStyle) {
            [self changeUIForTraitCollection];
        }
    }
}

- (void)changeUIForTraitCollection {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            self.textLB.textColor = [UIColor colorWithHexString:@"ffffff"];
            self.networkImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3619984352,3574180748&fm=15&gp=0.jpg"]]];
        } else {
            self.textLB.textColor = [UIColor colorWithHexString:@"333333"];
            self.networkImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2808094148,3407668965&fm=15&gp=0.jpg"]]];
        }
    } else {
        self.textLB.textColor = [UIColor colorWithHexString:@"333333"];
        self.networkImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2808094148,3407668965&fm=15&gp=0.jpg"]]];
    }
//    self.localImageView.image = [UIImage imageNamed:@"law"];
}

@end
