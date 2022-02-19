//
//  ModuleGraphicalTabs.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/18/22.
//

#import "ModuleGraphicalTabs.h"

@interface ModuleGraphicalTabs ()

@property (strong) NSMutableArray *tabs;

@end

@implementation ModuleGraphicalTabs

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.tabs = [[NSMutableArray alloc] init];
        
        NSBox *bottomBorder = [[NSBox alloc] initWithFrame:NSMakeRect(0.0, 1.0, 687.0, 1.0)];
        [bottomBorder setBoxType:NSBoxSeparator];
        [self addSubview:bottomBorder];
    }
    
    return self;
}

- (void)addTabWithImageNamed:(NSString *)imageName
                       title:(NSString *)title
{
    NSImage *image = [NSImage imageNamed:imageName];
    
    CGFloat xPosition = 0.0;
    
    for (NSButton *button in self.tabs) {
        xPosition += button.frame.size.width;
    }
    
    CGFloat yPosition = self.frame.size.height - 53.0;
    
    NSSize textSize = [title sizeWithAttributes:@{}];
    CGFloat width = 50.0;
    
    if (textSize.width > width) {
        // Adding 7.0px for some padding
        width = textSize.width + 7.0;
    }
    
    NSButton *newButton = [[NSButton alloc] initWithFrame:NSMakeRect(xPosition, yPosition, width, 50.0)];
    [newButton setTitle:title];
    [newButton setImage:image];
    [newButton setBezelStyle:NSBezelStyleRegularSquare];
    [newButton setFont:[NSFont systemFontOfSize:10.0]];
    [newButton setAction:@selector(tabClicked:)];
    [newButton setImagePosition:(NSCellHasImageOnLeftOrBottom)];
    [newButton setBordered:NO];
    
    [self.tabs addObject:newButton];
    [self addSubview:newButton];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (IBAction)tabClicked:(NSButton *)sender
{
    NSLog(@"tab clicked");
}

@end
