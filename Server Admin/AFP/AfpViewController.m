//
//  AfpViewController.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/16/22.
//

#import "AfpViewController.h"
#import "../Views/ModuleGraphicalTabs.h"
#import "AfpOverviewViewController.h"
#import "AfpLogsViewController.h"
#import "AfpGraphsViewController.h"
#import "AfpConnectionsViewController.h"
#import "AfpSharePointsViewController.h"
#import "AfpSettingsViewController.h"


@interface AfpViewController ()

@property (strong) ModuleGraphicalTabs *tabs;

@property (weak) IBOutlet NSView *panelView;
@property (strong) NSMutableDictionary *panels;
@property (strong) NSViewController *activePanel;

@end

@implementation AfpViewController

- (instancetype)initWithNibName:(NSNibName)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        self.panels = [[NSMutableDictionary alloc] init];
        
        self.tabs = [[ModuleGraphicalTabs alloc] initWithFrame:NSMakeRect(0.0, (self.view.frame.size.height - 55.0), 687.0, 55.0)];
        
        [self.tabs setNotificationName:@"AfpNavUpdate"];
        [self.tabs addTabWithImageNamed:@"NSInfo" title:@"Overview"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Logs"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Graphs"];
        [self.tabs addTabWithImageNamed:@"NSNetwork" title:@"Connections"];
        [self.tabs addTabWithImageNamed:@"NSBonjour" title:@"Share Points"];
        [self.tabs addTabWithImageNamed:@"NSAdvanced" title:@"Settings"];
        
        [self.view addSubview:self.tabs];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeModuleSubnavigation:)
                                                     name:@"AfpNavUpdate"
                                                   object:self.tabs];
        
        NSViewController *vc = [[AfpOverviewViewController alloc] initWithNibName:@"AfpOverviewViewController"
                                                                           bundle:[NSBundle mainBundle]];
        
        [self setActivePanel:vc];
        [self.panels setObject:vc forKey:@"overview"];
        
        [self.panelView addSubview:vc.view];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
}

- (void)clearAllSubviews
{
    NSArray *subviews = self.panelView.subviews;
    for (NSView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

- (void)changeModuleSubnavigation:(NSNotification *)n
{
    NSString *tabTitle = [n.userInfo objectForKey:@"tabTitle"];
    
    [self clearAllSubviews];
    
    if ([tabTitle isEqualToString:@"Logs"]) {
        if ([self.panels objectForKey:@"logs"]) {
            NSViewController *vc = [self.panels objectForKey:@"logs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpLogsViewController alloc] initWithNibName:@"AfpLogsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"logs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Graphs"]) {
        if ([self.panels objectForKey:@"graphs"]) {
            NSViewController *vc = [self.panels objectForKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpGraphsViewController alloc] initWithNibName:@"AfpGraphsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"graphs"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Connections"]) {
        if ([self.panels objectForKey:@"connections"]) {
            NSViewController *vc = [self.panels objectForKey:@"connections"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpConnectionsViewController alloc] initWithNibName:@"AfpConnectionsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"connections"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Share Points"]) {
        if ([self.panels objectForKey:@"sharepoints"]) {
            NSViewController *vc = [self.panels objectForKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpSharePointsViewController alloc] initWithNibName:@"AfpSharePointsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"sharepoints"];
            [self.panelView addSubview:vc.view];
        }
    } else if ([tabTitle isEqualToString:@"Settings"]) {
        if ([self.panels objectForKey:@"settings"]) {
            NSViewController *vc = [self.panels objectForKey:@"settings"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpSettingsViewController alloc] initWithNibName:@"AfpSettingsViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"settings"];
            [self.panelView addSubview:vc.view];
        }
    } else {
        if ([self.panels objectForKey:@"overview"]) {
            NSViewController *vc = [self.panels objectForKey:@"overview"];
            [self.panelView addSubview:vc.view];
        } else {
            NSViewController *vc = [[AfpOverviewViewController alloc] initWithNibName:@"AfpOverviewViewController"
                                                                                       bundle:[NSBundle mainBundle]];
            [self.panels setObject:vc forKey:@"overview"];
            [self.panelView addSubview:vc.view];
        }
    }
}

@end
