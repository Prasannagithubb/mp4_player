# Keep all classes related to VLC
-keep class org.videolan.libvlc.** { *; }
-keep class org.videolan.medialibrary.** { *; }

# Prevent stripping native libraries
-keep class org.videolan.** { *; }

# Keep enums (if used by VLC)
-keepclassmembers enum * { *; }
