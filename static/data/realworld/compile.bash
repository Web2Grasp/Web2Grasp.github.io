ffmpeg \
  -i wine_glass.mp4 -i syringe.mp4 -i phone.mp4 -i power_drill.mp4 \
  -i microphone.mp4 -i spray.mp4 -i tong.mp4 -i mug.mp4 \
  -i bowl.mp4 -i plate.mp4 -i fork.mp4 -i knife.mp4 \
  -filter_complex "
    [0:v] setpts=PTS-STARTPTS,scale=320x320 [v0];
    [1:v] setpts=PTS-STARTPTS,scale=320x320 [v1];
    [2:v] setpts=PTS-STARTPTS,scale=320x320 [v2];
    [3:v] setpts=PTS-STARTPTS,scale=320x320 [v3];
    [4:v] setpts=PTS-STARTPTS,scale=320x320 [v4];
    [5:v] setpts=PTS-STARTPTS,scale=320x320 [v5];
    [6:v] setpts=PTS-STARTPTS,scale=320x320 [v6];
    [7:v] setpts=PTS-STARTPTS,scale=320x320 [v7];
    [8:v] setpts=PTS-STARTPTS,scale=320x320 [v8];
    [9:v] setpts=PTS-STARTPTS,scale=320x320 [v9];
    [10:v] setpts=PTS-STARTPTS,scale=320x320 [v10];
    [11:v] setpts=PTS-STARTPTS,scale=320x320 [v11];
    [v0][v1][v2][v3][v4][v5][v6][v7][v8][v9][v10][v11]
    xstack=inputs=12:layout=0_0|320_0|640_0|960_0|0_320|320_320|640_320|960_320|0_640|320_640|640_640|960_640 [out]
  " -map "[out]" -c:v libx264 -crf 23 -preset veryfast output_real.mp4