//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "StrokeColorsViewController.h"
#import "RSSchool_T9-Swift.h"


typedef enum : NSUInteger {
	SettingsOptionDrawStories,
	SettingsOptionStrokeColor,
	SettingsOptionsCount
} SettingsOption;



// MARK: - SettingsViewController
@interface SettingsViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end


@implementation SettingsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	[self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

- (void)initStyle {
	self.view.layer.backgroundColor = [UIColor colorNamed:@"controlBackgroundColor"].CGColor;
}

- (void)setupViews {
	_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.alwaysBounceVertical = NO;
	_tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:_tableView];
	
	[NSLayoutConstraint activateConstraints:@[
		[_tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
		[_tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
		[_tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
		[_tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
	]];
}

- (void)toggleDrawStories:(UISwitch * _Nullable)sender {
	if (sender) {
		RSSettings.defaultSettings.drawStoriesOn = sender.isOn;
	} else {
		RSSettings.defaultSettings.drawStoriesOn = !RSSettings.defaultSettings.drawStoriesOn;
	}
}

- (void)showColorsSettings {
	StrokeColorsViewController *vc = [StrokeColorsViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}


// MARK: Table DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return SettingsOptionsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *cellID = @"CellID";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	switch (indexPath.row) {
		case SettingsOptionDrawStories: {
			cell.textLabel.text = @"Draw stories";
			//add a switch
			UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
			cell.accessoryView = switchview;
			[switchview setOn:RSSettings.defaultSettings.drawStoriesOn animated:NO];
			[switchview addTarget:self action:@selector(toggleDrawStories:) forControlEvents:UIControlEventValueChanged];
			break;
		}
		case SettingsOptionStrokeColor: {
			cell.textLabel.text = @"Stroke color";
			cell.detailTextLabel.text = RSSettings.defaultSettings.drawStoriesColor;
			cell.detailTextLabel.textColor = [[UIColor alloc] initWithHex:cell.detailTextLabel.text];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			cell.selectionStyle = UITableViewCellSelectionStyleDefault;
			break;
		}
	}
	
	return cell;
}

- (void)toggleSwitchAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	UISwitch *switchView = (UISwitch *)cell.accessoryView;
	[switchView setOn:!switchView.isOn animated:YES];
}


// MARK: Table Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.row) {
		case SettingsOptionDrawStories: {
			[self toggleSwitchAtIndexPath:indexPath];
			[self toggleDrawStories:nil];
			break;
		}
		case SettingsOptionStrokeColor: {[tableView deselectRowAtIndexPath:indexPath animated:YES];
			[self showColorsSettings];
			break;
		}
	}
}

@end
