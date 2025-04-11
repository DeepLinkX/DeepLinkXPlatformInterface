# deeplink_x_platfrom_interface

A common platform interface for the `deeplink_x` plugin.

This interface allows platform-specific implementations of the `deeplink_x`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `deeplink_x`, extend
`LauncherUtilPlatform` with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`LauncherUtilPlatform` by calling
`LauncherUtilPlatform.instance = MyPlatformLauncherUtil()`.