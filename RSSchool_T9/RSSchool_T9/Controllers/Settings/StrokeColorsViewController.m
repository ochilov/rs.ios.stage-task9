//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "StrokeColorsViewController.h"
#import "RSSchool_T9-Swift.h"


// MARK: - View controller to setup stroke colors
@interface StrokeColorsViewController()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *colorsSet;

@end

@implementation StrokeColorsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	[self setupViews];
	[self initData];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

- (void)initStyle {
	self.view.layer.backgroundColor = UIColor.controlBackground.CGColor;
}

- (void)setupViews {
	_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	_tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:_tableView];
	
	[NSLayoutConstraint activateConstraints:@[
		[_tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
		[_tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
		[_tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
		[_tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
	]];
}

- (void)initData {
	self.colorsSet = @[
		@"#be2813",
		@"#3802da",
		@"#467c24",
		@"#808080",
		@"#8e5af7",
		@"#f07f5a",
		@"#f3af22",
		@"#3dacf7",
		@"#e87aa4",
		@"#0f2e3f",
		@"#213711",
		@"#511307",
		@"#92003b"
	];
}

- (void)onChecked {
	[self.navigationController popViewControllerAnimated:YES];
}


// MARK: Table DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.colorsSet.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellID = @"ColorSetCellID";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
		cell.selectionStyle = UITableViewCellSelectionStyleDefault;
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
	NSString *item = indexPath.row < self.colorsSet.count ? self.colorsSet[indexPath.row] : nil;
	if (item) {
		cell.textLabel.text = item;
		cell.textLabel.textColor = [[UIColor alloc] initWithHex:item];
		
		
		BOOL isSelected = RSSettings.defaultSettings.drawStoriesColor.length &&
						 [RSSettings.defaultSettings.drawStoriesColor isEqualToString:item];
		cell.accessoryType = isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	}
	
	return cell;
}


// MARK: Table Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *item = indexPath.row < self.colorsSet.count ? self.colorsSet[indexPath.row] : nil;
	if (item) {
		RSSettings.defaultSettings.drawStoriesColor = item;
		[self onChecked];
	}
}


@end
