
// Maximum number of bytes that a text message may have. The payload data of
// a push notification is limited to 256 bytes and that includes the JSON 
// overhead and the name of the sender.
#define MaxMessageLength 190
#define ServerApiURL @"http://10.0.1.2:44447"

// Convenience function to show a UIAlertView
void ShowErrorAlert(NSString* text);
