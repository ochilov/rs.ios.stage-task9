//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		[self setupViews];
	}
	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		[self setupViews];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)setupViews {
	self.title = @"Settings";
	self.tabBarItem.image = [UIImage systemImageNamed:@"gear"];
	self.view.layer.backgroundColor = UIColor.systemBlueColor.CGColor;
}

@end
