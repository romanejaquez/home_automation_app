enum FlickyAnimatedIconOptions {
  flickybulb,
  flickytext,
  barhome,
  barrooms,
  bardevices,
  barsettings,
  lightbulb,
  fan,
  hairdryer,
  bolt,
  ac,
  oven,
}

enum FlickyAnimatedIconSizes {
  small(35),
  medium(60),
  large(100),
  xlarge(120);

  const FlickyAnimatedIconSizes(this.value);
  final double value;
}