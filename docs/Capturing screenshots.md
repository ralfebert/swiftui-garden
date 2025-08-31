Screenshots of Views can be generated via `SwiftUIGardenTests` (that uses Swift Testing and the [swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) package to generate screenshots that can be auto-updated)

Videos are recorded manually in the simulator. To crop and re-encode:

```bash
ffmpeg -i input_video.mov -vf "crop=iw:500" output_video.mp4
```
