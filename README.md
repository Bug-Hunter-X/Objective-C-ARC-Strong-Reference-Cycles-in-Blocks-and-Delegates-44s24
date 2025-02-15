# Objective-C ARC Strong Reference Cycle Bug

This repository demonstrates a common and subtle bug in Objective-C related to strong reference cycles when using Automatic Reference Counting (ARC). The bug manifests as memory leaks due to improper handling of strong references within blocks and delegate relationships.

## Bug Description
The bug involves situations where strong reference cycles inadvertently occur, preventing objects from being deallocated even when they are no longer needed. This can lead to memory exhaustion and application instability.

## Code Example (bug.m)
The `bug.m` file contains the erroneous Objective-C code that showcases the strong reference cycle.  See the file for details.

## Solution (bugSolution.m)
The `bugSolution.m` file provides a corrected version of the code, addressing the strong reference cycle.  The solution demonstrates proper usage of weak references to prevent the cycle.

## How to Reproduce
1. Clone this repository.
2. Open the project in Xcode.
3. Run the application to observe the memory leak (in the original bug code).
4. Observe the corrected behaviour with the solved code.