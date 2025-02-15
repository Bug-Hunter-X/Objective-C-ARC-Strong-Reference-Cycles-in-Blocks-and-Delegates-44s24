The solution to the strong reference cycle problem lies in using weak references (`__weak` in blocks or `weak` in properties) appropriately. Here's how to fix the provided examples:

**Blocks:**
```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    __weak MyClass *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        if (weakSelf) { // Check for nil before using weakSelf
            weakSelf.myString = [NSString stringWithFormat:@"Hello from background thread"];
        }
    });
}
@end
```
Note the `if (weakSelf)` check. This prevents potential crashes if `self` is deallocated before the block is executed.

**Delegates:**
To break a strong reference cycle in delegate relationships, make the delegate property in the delegate itself `weak`.
```objectivec
@interface MyDelegate : NSObject <MyProtocol>
@property (nonatomic, weak) MyViewController *viewController; // Weak reference
- (void)myProtocolMethod;
@end

@interface MyViewController : UIViewController <MyProtocol>
@property (nonatomic, strong) MyDelegate *delegate;
@end
```
By making the `viewController` property in `MyDelegate` weak, the retain cycle is broken.  The `MyViewController` object is only retained during its lifetime, preventing the circular retention.