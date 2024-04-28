function fr2vid
  set tmplist $(mktemp)

  # Fill the file with lines that look like this:
  # file /Users/stjo/projects/gausian-splats/03-cpp-frames/frame_99.jpg
  # file /Users/stjo/projects/gausian-splats/03-cpp-frames/frame_100.jpg
  find $argv[1] -type f | sort -V | awk "{ print \"file $PWD/\" \$0 }" > $tmplist

  ffmpeg -f concat -safe 0 -i $tmplist -framerate 30 -pix_fmt yuv420p $argv[2]

  rm $tmplist
end
