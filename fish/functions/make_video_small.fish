function make_video_small
  set dir $(dirname "$argv[1]")
  set fn smaller_$(basename "$argv[1]")
  ffmpeg -i "$argv[1]" -c:v libx264 -crf 26 -preset fast -c:a copy "$dir/$fn"
end
