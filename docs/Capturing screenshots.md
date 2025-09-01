View Screenshot can be auto-updated by running `SwiftUIGardenTests`.

Videos are recorded manually in the simulator. To crop and re-encode:

```bash
ffmpeg -i input_video.mov -vf "crop=iw:500" output_video.mp4
```
