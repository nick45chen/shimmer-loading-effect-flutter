# shimmer_loading_effect

Here is a shimmer loading effect package with an example. 😎

For detailed instructions, please refer to the [Create a shimmer loading effect](https://docs.flutter.dev/cookbook/effects/shimmer-loading)

## Getting Started

The project architecture is:

* example: sample code showing how to use the `shimmer_effect` package.
* shimmer_effect: the main loading effect package.

## Example

The example with the shimmer effect package is just like the following:

``` dart
class _ExampleUiLoadingAnimationState extends State<ExampleUiLoadingAnimation> {

var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(  // Provide all children with the same shimmer gradient and control animation
        linearGradient: _shimmerGradient,
        child: ListView(
            // ListView Contents
            ),
      ),
    );
  }
}

// Control the loading state to decide whether or not to paint the child.
Widget _buildListItem() {
  return ShimmerLoading(
    isLoading: _isLoading,
    child: CardListItem(
      isLoading: _isLoading,
    ),
  );
}
```

Now, you can see the final animation effect.