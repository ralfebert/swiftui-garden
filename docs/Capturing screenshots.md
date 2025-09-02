## Screenshots

View Screenshot can be auto-updated by running `SwiftUIGardenTests`.

## Videos

Videos are recorded manually in the simulator. To crop and re-encode:

```bash
# Centered crop (default)
ffmpeg -i input_video.mov -vf "crop=iw:500" output_video.mp4

# Un-centered crop
ffmpeg -i input_video.mov -vf "crop=iw:500:0:0" output_video.mp4
```

**Note:** ffmpeg currently loses HiDPI metadata when processing videos ([ffmpeg ticket #11025](https://trac.ffmpeg.org/ticket/11025)). Looking for a way to visually crop videos while ideally preserving the metadata that indicates it's HiDPI.
