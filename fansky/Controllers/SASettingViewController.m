//
//  SASettingViewController.m
//  fansky
//
//  Created by Zzy on 9/20/15.
//  Copyright © 2015 Zzy. All rights reserved.
//

#import "SASettingViewController.h"
#import "SAUserViewController.h"
#import <VTAcknowledgementsViewController/VTAcknowledgementsViewController.h>

@interface SASettingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@end

@implementation SASettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)updateInterface
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *versionString = [NSString stringWithFormat:@"%@ (%@)", [info objectForKey:@"CFBundleShortVersionString"], [info objectForKey:@"CFBundleVersion"]];
    self.versionLabel.text = versionString;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navigationController = (UINavigationController *)self.navigationController.presentingViewController;
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self dismissViewControllerAnimated:YES completion:^{
                SAUserViewController *userViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SAUserViewController"];
                userViewController.userID = @"fansky";
                dispatch_async(dispatch_get_main_queue(), ^{
                    [navigationController showViewController:userViewController sender:nil];
                });
            }];
        } else if (indexPath.row == 1) {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"Pods-fansky-acknowledgements" ofType:@"plist"];
            VTAcknowledgementsViewController *acknowledgementViewController = [[VTAcknowledgementsViewController alloc] initWithAcknowledgementsPlistPath:path];
            acknowledgementViewController.headerText = @"饭斯基使用了如下开源组件";
            [self.navigationController showViewController:acknowledgementViewController sender:nil];
        }
    }
}

#pragma mark - EventHandler

- (IBAction)closeButtonTouchUp:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
