//
//  AppDelegate.m
//  passgen
//
//  Created by Radu Croitoru on 31/12/14.
//  Copyright (c) 2014 Radu Croitoru. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (weak) IBOutlet NSButton *capitalsOption;
@property (weak) IBOutlet NSButton *numeralsOption;
@property (weak) IBOutlet NSButton *symbolsOption;
@property (weak) IBOutlet NSTextField *passwordNumberOfCharacters;
@property (weak) IBOutlet NSTextField *password;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setupStatusItem];
}

- (void)setupStatusItem {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.title = @"";
    _statusItem.image = [NSImage imageNamed:@"StatusItem-Image"];
    _statusItem.highlightMode = YES;
    _statusItem.toolTip = @"Simple password generator for OS X";
    _statusItem.menu = menu;
}

- (IBAction)generateButtonClicked:(NSButton *)sender {
    PasswordGenerator *passwd = [[PasswordGenerator alloc] initUsingOptions:[self getOptionsFromUI]];
    [self.password setStringValue:[passwd generateRandomPasswordWithLength:self.passwordNumberOfCharacters.intValue]];
}

- (IBAction)quitButton:(id)sender {
    [[NSApplication sharedApplication] terminate:self.statusItem.menu];
}

- (IBAction)slider:(NSSlider *)sender {
    [self.passwordNumberOfCharacters setStringValue:[NSString stringWithFormat:@"%d", sender.intValue]];
}

- (IBAction)copyButtonPressed:(NSButton *)sender {
    NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
    [pasteBoard declareTypes:[NSArray arrayWithObjects:NSStringPboardType, nil] owner:nil];
    [pasteBoard setString: [self.password stringValue] forType:NSStringPboardType];
}

- (NSDictionary *)getOptionsFromUI {
    return @{ @"Capitals" : self.capitalsOption.stringValue,
              @"Numerals" : self.numeralsOption.stringValue,
              @"Symbols" :  self.symbolsOption.stringValue };
}

@end